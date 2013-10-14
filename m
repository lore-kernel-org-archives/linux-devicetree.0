From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v5] powerpc/mpc85xx: Update the clock nodes in device
 tree
Date: Mon, 14 Oct 2013 17:13:06 -0500
Message-ID: <1381788786.7979.643.camel@snotra.buserror.net>
References: <1381300704-4238-1-git-send-email-Yuantian.Tang@freescale.com>
	 <20131010100331.GE26954@e106331-lin.cambridge.arm.com>
	 <D07C73A334FF604B95B3CBD2A545D07B150BD137@039-SN2MPN1-013.039d.mgd.msft.net>
	 <20131011092526.GE3910@e106331-lin.cambridge.arm.com>
	 <1381518433.7979.536.camel@snotra.buserror.net>
	 <D07C73A334FF604B95B3CBD2A545D07B150C24BD@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D07C73A334FF604B95B3CBD2A545D07B150C24BD-RL0Hj/+nBVDYdknt8GnhQq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tang Yuantian-B29983 <B29983-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Li Yang-Leo-R58472 <r58472-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2013-10-11 at 21:52 -0500, Tang Yuantian-B29983 wrote:
> Thanks for your review.
>=20
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: 2013=E5=B9=B410=E6=9C=8812=E6=97=A5 =E6=98=9F=E6=9C=9F=E5=85=AD=
 3:07
> > To: Mark Rutland
> > Cc: Tang Yuantian-B29983; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-
> > dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Li Yang-Leo-R58472
> > Subject: Re: [PATCH v5] powerpc/mpc85xx: Update the clock nodes in =
device
> > tree
> >=20
> > I'm not sure I understand the "_0"/"_1" part, though.  Doesn't each=
 PLL
> > just have one output, which the consumer may choose to divide by 2 =
(or in
> > some cases 4)?  Why does that division need to be exposed in the de=
vice
> > tree as separate connections to the parent clock?
> >=20
> The device tree makes that quite clear.=20

You chose to model it that way in the device tree; that doesn't make it
clear that the hardware works that way or that it's a good way to model
it.

> Each PLL has several output which MUX node can take from.

Point out where in the hardware documentation it says this.  What I see
is a PLL that has one output, and a MUX register that can choose from
multiple PLL and divider options.

>  It is not a runtime decision.

Hmm?  It's a register you write to.

-Scott



--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
