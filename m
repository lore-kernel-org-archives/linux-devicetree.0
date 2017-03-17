From: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 2/5] rtc: Add rtc-sh
Date: Fri, 17 Mar 2017 13:16:25 +0000
Message-ID: <SG2PR06MB1165A9931C930DF9BCD5C0A98A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
 <20170316175112.27913-3-chris.brandt@renesas.com>
 <CAMuHMdVu0dQjptyW0F5YS+V6sixXTM3P6VWq2=8BQ5njUOXf-Q@mail.gmail.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <rtc-linux+bncBDXOFUXT2UGBBMGDV7DAKGQEFAZIMFI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMuHMdVu0dQjptyW0F5YS+V6sixXTM3P6VWq2=8BQ5njUOXf-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, RTCLINUX <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,


Happy St Patrick's Day!

    (I know you are not Irish....but you are closer to Ireland than I am ;)


On Friday, March 17, 2017, Geert Uytterhoeven wrote:
> On Thu, Mar 16, 2017 at 6:51 PM, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> wrote:
> > rtc-sh is a RTC for SuperH and RZ/A SoCs.
>=20
> an RTC?

Good point. That's more better ;)


> > +Required properties:
> > +- compatible: Should be "renesas,r7s72100-rtc" or "renesas,sh-rtc" as
> > +a
>=20
> s/or/and/

OK


> > +  fallback.
> > +- reg: physical base address and length of memory mapped region.
> > +- interrupts: 3 interrupts for alarm, period, and carry.
>=20
> If there's a need for multiple interrupts, it's always a good idea to use
> interrupt-names. The datasheet calls them "arm", "prd", and "cup", but I
> wouldn't object against "alarm", "period", and "carry" ;-)

OK. I'll change.
I like the longer names as well ("prd" looks ugly)


> > +- clocks: the clock source for the RTC controller.
>=20
> The datasheet mentions 3 possible clock sources?

There is the clock source that does the counting (RTC_X1, RTC_X3, XTAL), an=
d then a clock source that runs the register interface (run off of the p0 c=
lock). So I just need to turn on the p0 clock so I can get at the registers=
. Note that if you do a hard reset with a RESET button, and all the registe=
rs in the chip go back to their POR state, the counter still counts off of =
the 32KHz XTAL even though the "peripheral clock" is stopped (which just me=
ans you can't get to the registers).

In reality, you have to assume the RTC counting source has already been set=
 up by u-boot, or from a past reboot, so I don't do any of that select conf=
iguration at all.


Chris

--=20
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
---=20
You received this message because you are subscribed to the Google Groups "=
rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
