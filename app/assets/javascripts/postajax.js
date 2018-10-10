$(() => {
  function buildHTML(post) {
    let html = $('<div class='col s12 m7'>
                    <div class='card horizontal'>
                      <div class='card-image'>
                        <img src="${post.image}" alt="Chat" />
                      </div>
                      <div class='card-stacked'>
                        <div class='card-content'>
                          <p>${post.title}</p>
                          <hr>
                          <p>${post.body}</p>
                        </div>
                        <div class='card-action'>
                          <ul>
                            <li>
                              <a href="/posts/${post.id}"><i class='material-icons'>search</i>
                            </a></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                ').append(todo.content);
    return html;
  }


});
