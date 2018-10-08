From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v2 10/29] drm/sun4i: Rename DE2 registers
 related macros
Date: Mon, 08 Oct 2018 16:28:41 +0200
Message-ID: <11072788.dZi9MDiihb@jernej-laptop>
References: <20181007093905.11253-1-jernej.skrabec@siol.net> <20181007093905.11253-11-jernej.skrabec@siol.net> <20181008101828.hb4xtppbexwalbkk@flea>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBHGT5XOQKGQEF6LJLZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181008101828.hb4xtppbexwalbkk@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne ponedeljek, 08. oktober 2018 ob 12:18:28 CEST je Maxime Ripard napisal(a):
> Hi,
> 
> On Sun, Oct 07, 2018 at 11:38:46AM +0200, Jernej Skrabec wrote:
> > In preparation to introduce DE3 support, change prefix from "SUN8I_" to
> > "DE2_". Current prefix suggest that it's valid only for one family,
> > whereas in reality, DE2 unit is used also on sun50i family.
> > Additionally, it will be easier to distinguish DE3 specific macros by
> > using "DE3_" prefix.
> > 
> > No functional change in this commit.
> 
> I'm not too sure about this one. There's basically two ways to look at
> this: you described the first one, and the second one would be to
> treat it as we do for the compatibles: the IP was introduced on one
> SoC family, and then got used on some other ones.
> 
> Trying to always match the one you have however have a quite big
> maintainance cost, as can be shown by your patch: you always have to
> adapt comments, function names, defines, etc. This creates a lot of
> useless churns (ie, non-functional changes) in the drivers, that need
> to be written in the first place, and then reviewed.
> 
> It's just not worth it.

Well, using family neutral way would mean that there is no need anymore for 
adaptation in the future, but as you wish.

What prefix should I use for DE3 specific registers?

Best regards,
Jernej
