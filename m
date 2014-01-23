From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM i.MX53: dts: Add TVE to i.MX53-QSB device tree
Date: Thu, 23 Jan 2014 12:08:44 -0200
Message-ID: <CAOMZO5BOJ1W_x=M_ymCtTGf186EYE4X4Tw8yA23SD7cSDQAvEw@mail.gmail.com>
References: <1380192374-9531-1-git-send-email-p.zabel@pengutronix.de>
	<1380192374-9531-2-git-send-email-p.zabel@pengutronix.de>
	<20130927011643.GB25146@S2101-09.ap.freescale.net>
	<1380552008.3959.29.camel@pizza.hi.pengutronix.de>
	<20131005015845.GC2734@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131005015845.GC2734-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On Fri, Oct 4, 2013 at 10:58 PM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Sep 30, 2013 at 04:40:08PM +0200, Philipp Zabel wrote:
>> > > @@ -280,8 +289,8 @@ memgpu: /memreserve/ 0xb0000000 0x04000000;
>> > >                   };
>> > >
>> > >                   ldo8_reg: ldo8 {
>> > > -                         regulator-min-microvolt = <1200000>;
>> > > -                         regulator-max-microvolt = <3600000>;
>> > > +                         regulator-min-microvolt = <2750000>;
>> > > +                         regulator-max-microvolt = <2750000>;
>> >
>> > Why this change?
>>
>> According to the reference manual, the TVDAC supply should be 2.75 V. If
>> there are no ill effects if this ldo is actually set to 3.6 V, this
>> change could be dropped.
>
> So you either add a comment in commit log for the change or drop the
> change.

Do you plan to resubmit this patch?

Regards,

Fabio Estevam
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
