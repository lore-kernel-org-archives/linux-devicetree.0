From: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 06/11] drm/sun4i: rgb: Add DT property to
 disable strict clock rate check
Date: Wed, 20 Feb 2019 22:39:51 -0800
Message-ID: <CA+E=qVdP8Ocds2Ojv5PzvwowGKb-od21bRgAtC==Z8CNfYszQw@mail.gmail.com>
References: <20190215050957.20755-1-anarsoul@gmail.com> <20190215050957.20755-7-anarsoul@gmail.com>
 <20190218182629.GA14714@bogus> <CA+E=qVfDfDvVmKQDeh2e0SA=tm6VpBMpu9MPKUqxFPObxYFXDg@mail.gmail.com>
 <20190219085626.7poutwvm3lrilnon@flea> <CA+E=qVfV8ds-zb0oG1-g8c-ReCSnZjfUjvAHbZf1zBf8H-xUcw@mail.gmail.com>
 <20190220103347.74wqu2btdti2myi7@flea>
Reply-To: anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDV3B667TUHBBUUPXHRQKGQEHT5ZYNA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190220103347.74wqu2btdti2myi7@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-linux <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 20, 2019 at 2:33 AM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> On Tue, Feb 19, 2019 at 07:44:56AM -0800, Vasily Khoruzhick wrote:
> > On Tue, Feb 19, 2019 at 12:56 AM Maxime Ripard

> > Maxime, thanks for your patch but  it doesn't work for me. Pinebook
> > needs 1% tolerance. Having it as a module parameter means that no
> > distro will be able to boot on Pinebook out of the box.
>
> I don't really know what to tell you, the VESA spec defines everywhere
> that tolerance, and if we're not able to provide that, then we're not
> compliant and I don't want us to not be compliant just because one
> panel needed to be a bit more flexible, and especially since what
> could work on one panel might fail on another one.
>
> If you want alternate solutions, then please answer to:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2019-February/630441.html
>
> or provide the EDID blob.

Uh, I spoke to early, my bad. I made a mistake when I calculated rate
deviation for 768p last time - I took 73MHz as dotclock, but actual
requested rate 72.3 MHz and it gets 72.296296 MHz, so it's within 0.5%
tolerance. 1080p pinebook needs 138.5 MHz and gets 138.461538 MHz -
also within 0.5%.

However your patch has an issue, I'll respond to your previous email.

> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
