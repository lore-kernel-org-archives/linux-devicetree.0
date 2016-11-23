From: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Enable UEXT related nodes for Olimex
 A20 SOM EVB
Date: Wed, 23 Nov 2016 18:16:10 +0100
Message-ID: <20161123181610.cae67ad53f5f69246d341b30@bidouilliste.com>
References: <20161121164911.76900-1-manu@bidouilliste.com>
        <20161123080350.fstwdfndghk7c5xx@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161123080350.fstwdfndghk7c5xx@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 23 Nov 2016 09:03:50 +0100
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> On Mon, Nov 21, 2016 at 05:49:11PM +0100, Emmanuel Vadot wrote:
> > UEXT are Universal EXTension connector from Olimex. They embed i2c, spi
> > and uart pins along power in one connector and are found on most,
> > if not all, Olimex boards.
> > The Olimex A20 SOM EVB have two UEXT connector so enable the nodes found on
> > those two connectors.
> > 
> > Signed-off-by: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
> 
> Fixed the indentation of the spi pinctrl cells, and applied.
> 
> Please note that I'm note planning to send any new pull request, so
> this will likely end up in 4.11.
> 
> Thanks!
> Maxime
> 
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

 Sorry about the indentation, I'll be more carefull next time.

 Thank you.

-- 
Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org> <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
