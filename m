From: delicious quinoa <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: gpio: dwapb: Synopsys Designware GPIO
Date: Thu, 31 Oct 2013 10:34:50 -0500
Message-ID: <CANk1AXRH8zDZFFWGn=NYrkhHrygeoeLQ9QNd6o7Wm6XHmT95pQ@mail.gmail.com>
References: <52718C28.5030803@gmail.com>
	<20131031082226.GZ28790@pengutronix.de>
	<CADhT+wcCzMM1MbP3UuQbdc8JmpdO+AhM421R5AiC6vxyn-osvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADhT+wcCzMM1MbP3UuQbdc8JmpdO+AhM421R5AiC6vxyn-osvQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 31, 2013 at 10:18 AM, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Yes, we'll post a patch up on rocketboards-next and maybe we can post them
> to the mailing list too?
>
Hi Steffen,

I've posted a branch on rocketboards.orgs' linux-socfpga-next.git.
The branch name is dwapb-gpio-3.11.

The top five patches are:
1. Remove the Altera gpio-dw.c driver
2 & 3.  Cherrypick Jamie's stuff from his git repo
4. Enable gpio-dwapb in our defconfig and dts
5. This is the main patch here: use irq_domain_add_linear for
gpio-dwapb.c plus a few bug fixes.

If you'd rather see that last patch on the mailing list, I can post it
there for review.

Alan Tull
Altera Corporation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
