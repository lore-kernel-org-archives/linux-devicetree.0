From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx: Fix the assigned-clock mismatch issue on imx6q/dl
Date: Tue, 15 Dec 2015 09:16:07 -0200
Message-ID: <CAOMZO5BKFqMKpRiM6hV43Ko7YcGHPEChSi1GEBMzg3oGo6_Lnw@mail.gmail.com>
References: <1449648955-30835-1-git-send-email-b51503@freescale.com>
	<20151214030750.GF25756@tiger>
	<20151215085237.GB388@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151215085237.GB388@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bai Ping <b51503-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 15, 2015 at 6:52 AM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Dec 14, 2015 at 11:07:50AM +0800, Shawn Guo wrote:
>> On Wed, Dec 09, 2015 at 04:15:55PM +0800, Bai Ping wrote:
>> > The 'assigned-clock-parents' and 'assigned-clock-rates' list
>> > should corresponding to the 'assigned-clocks' property clock list.
>> >
>> > Signed-off-by: Bai Ping <b51503-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>
>> Applied, thanks.
>
> As this essentially a fix to ed339363de1b ("ARM: dts: imx6qdl-sabreauto:
> Allow HDMI and LVDS to work simultaneously"), I'm going to send it as a
> fix with copying stable.

Actually the mismatch exists since 97dae8590fa314c ("ARM: dts:
imx6qdl-sabreauto: Add audio support").

> @Fabio,
>
> Do you agree with the fix?

It seems that even after this patch we still have a mismatch:
assigned-clocks has 5 members and assigned-clock-parents has 4.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
