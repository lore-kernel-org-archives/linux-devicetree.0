From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v4] Added support for pogoplug e02 (pink/gray)
Date: Wed, 14 Jan 2015 18:49:15 +0100
Message-ID: <20150114174915.GA389@lunn.ch>
References: <CAA8MNVjieDJ-dv2NNWXK=+uqrPmvtk2EiBYJGJkMugEiN2TsAw@mail.gmail.com>
 <1421210969-12446-1-git-send-email-ottxor@gentoo.org>
Reply-To: CAA8MNVjieDJ-dv2NNWXK=+uqrPmvtk2EiBYJGJkMugEiN2TsAw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421210969-12446-1-git-send-email-ottxor-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Junghans <ottxor-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 13, 2015 at 09:49:29PM -0700, Christoph Junghans wrote:
> The pogoplug differs from the SheevaPlug only by a
> few details, but especially in the led assignments.
> This patch was tested under Gentoo Linux and is
> based on dts files from Arch Linux ARM and OpenWrt.
> 
> Suggested-by: Felix Kaechele <heffer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
> Suggested-by: Oleg Rakhmanov <moonman.ca-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Christoph Junghans <ottxor-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
> 
> V1: initial patch
> V2: added GPL-2 header
>     dropped earlyprintk from bootargs
>     added stdout-path
>     change leds name to scheme "devicename:colour:function"
> V3: rebase on v3.19-rc4
>     fixed stdout-path to be &uart0
>     fixed compiling issue by using pin-controller
> V4: moved ocp@f1000000 block into &uart and &pinctrl

Hi Christoph

Thanks for these last changes. It looks good now, and i've added it to
mvebu/dt. So long as there are no more comments, i will pass it
upstream soon.

Thanks
        Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
