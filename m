From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Added default implementation for of_find_all_nodes().
 This function is used by board.c from the board module (drivers/staging/board).
Date: Sun, 8 Oct 2017 20:22:05 -0500
Message-ID: <CAL_JsqK17XT5PAbF8ebzr5Z2jH2pdsZeR-YkZgVmQywNNPueGA@mail.gmail.com>
References: <1504117946-3958-1-git-send-email-larturus2@gmail.com>
 <1507480107-3576-1-git-send-email-larturus2@gmail.com> <1507480107-3576-2-git-send-email-larturus2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507480107-3576-2-git-send-email-larturus2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Artur Lorincz <larturus2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, larturus-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 8, 2017 at 11:28 AM, Artur Lorincz <larturus2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Signed-off-by: Artur Lorincz <larturus-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
> ---
>  include/linux/of.h | 5 +++++
>  1 file changed, 5 insertions(+)

I replied to you on the previous version[1]. Why are you sending this again?

Rob

[1] https://lkml.org/lkml/2017/10/6/805
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
