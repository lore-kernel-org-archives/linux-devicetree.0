From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] powerpc: populate the default bus with
 machine_arch_initcall
Date: Mon, 15 Aug 2016 09:54:59 +1000
Message-ID: <1471218899.12231.76.camel@kernel.crashing.org>
References: <1470913781-9204-1-git-send-email-haokexin@gmail.com>
	 <87k2fmtxbv.fsf@concordia.ellerman.id.au>
	 <20160812054934.GJ17275@pek-khao-d1>
	 <CAL_Jsq+_K-uU7bFkSm-tq-Q0DPhQt4j=f84OzQSCJFEC29O-8A@mail.gmail.com>
	 <1471209670.12231.60.camel@kernel.crashing.org>
	 <CAL_Jsq+JLvThaz3ZTy80yVW23waPjqfw_JC-EJF-QuCk21=eJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+JLvThaz3ZTy80yVW23waPjqfw_JC-EJF-QuCk21=eJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 2016-08-14 at 17:42 -0500, Rob Herring wrote:
> > Not fan of the hard #ifdef at all... it will make it hard to
> convert
> > platforms one by one. Why not an arch_want_default_of_probe() or
> > something like this which we can then plumb into ppc_md. ?
> 
> Yeah, I'm not either really. I didn't propose using IS_ENABLED here
> either as it does add a needless initcall.
> 
> Do you have any idea which platforms are not broken and could be
> switched over now. If not, I think we should just leave as is for 4.8
> and make it per platform selectable for 4.9.

Not really... the non-embedded platforms (mac, pseries, etc...) don't
really use the OF bus probing iirc, so it's going to be a matter of
scrubbing the embedded ones. I agree we can do that in 4.9

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
