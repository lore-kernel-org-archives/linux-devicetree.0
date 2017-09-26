From: Sergey Senozhatsky <sergey.senozhatsky.work-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: do not leak console options
Date: Tue, 26 Sep 2017 15:31:01 +0900
Message-ID: <20170926063101.GA25762@jagdpanzerIV.localdomain>
References: <20170825173647.1004-1-sergey.senozhatsky@gmail.com>
 <20170825223721.hilqpt5z4urevh6b@rob-hp-laptop>
 <20170827071910.GA581@tigerII.localdomain>
 <20170906124033.GB3143@pathway.suse.cz>
 <20170906132923.GA805@jagdpanzerIV.localdomain>
 <CAL_JsqKRPGFUzLVbyU_=GZzsy87Mc6x43DtmUQ758-nrZZF_jA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKRPGFUzLVbyU_=GZzsy87Mc6x43DtmUQ758-nrZZF_jA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On (09/06/17 10:27), Rob Herring wrote:
[..]
> > Rob, Grant,
> > will this dirty hack work for you? I can respin the patch.
> 
> Yes, as long as you intend to fix things later.

Rob, sorry for the delay, I just sent out a simple patch. It contains that
'less-than-pretty' const cast. As of updating printk API -- I took a quick
look... and there are quite a lot things to touch: not just printk.c, but
also UART and all console drivers; we pass options not only to ->match()
callback, but to ->setup() callback as well. I'm not sure I've got enough
spare time for it right now, sorry.

	-ss
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
