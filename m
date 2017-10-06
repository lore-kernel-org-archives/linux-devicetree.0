From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] default implementation for of_find_all_nodes(...)
Date: Fri, 6 Oct 2017 17:32:57 -0500
Message-ID: <CAL_JsqLLiU+QZaBti8ifnq6Uf3jQ-ma4v0M=YHxOP5jSZYjG9Q@mail.gmail.com>
References: <1504117946-3958-1-git-send-email-larturus2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504117946-3958-1-git-send-email-larturus2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Artur Lorincz <larturus2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, larturus-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 30, 2017 at 1:32 PM, Artur Lorincz <larturus2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Added default implementation for of_find_all_nodes(). This function is
> used by board.c from the board module (drivers/staging/board).

Didn't even know we had this... The DT core already has some support
for something like this with "auxdata" that lets you attach DT nodes
to existing platform devices. Why doesn't that work?

In any case, you should just make this code depend on CONFIG_OF. When
there's only 3 other users of this function, that's a good sign we
don't want more. Searching thru all nodes is generally not the right
thing to do.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
