From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx: Fix the assigned-clock mismatch issue on imx6q/dl
Date: Tue, 15 Dec 2015 10:44:00 -0200
Message-ID: <CAOMZO5D9_G_agDAuYg7JdE_9+2en2soPvBb41sA8_1_YQ3PLFg@mail.gmail.com>
References: <1449648955-30835-1-git-send-email-b51503@freescale.com>
	<20151214030750.GF25756@tiger>
	<20151215085237.GB388@tiger>
	<CAOMZO5BKFqMKpRiM6hV43Ko7YcGHPEChSi1GEBMzg3oGo6_Lnw@mail.gmail.com>
	<567006C4.8050906@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <567006C4.8050906-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bai Ping <b51503-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 15, 2015 at 10:25 AM, Bai Ping <b51503-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

>> It seems that even after this patch we still have a mismatch:
>> assigned-clocks has 5 members and assigned-clock-parents has 4.
>
> I think if it is the last clock in the assigned-clock list, the
> corresponding
> 'assigned-clock-parents' and 'assigned-clock-rates'  entry can be omitted.

Yes, you are right. Confirmed with
Documentation/devicetree/bindings/clock/clock-bindings.txt and your
patch is correct, thanks:

Reviewed-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
