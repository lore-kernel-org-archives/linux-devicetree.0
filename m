From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH 08/12] rtc: bindings: Supply knowledge
 of a third supported device - clocksource
Date: Thu, 7 May 2015 20:21:39 +0100
Message-ID: <20150507192139.GE16220@x1>
References: <1431005924-21777-1-git-send-email-lee.jones@linaro.org>
 <1431005924-21777-9-git-send-email-lee.jones@linaro.org>
 <20150507141245.GA9793@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150507141245.GA9793@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt | 15 ++++++++=
+------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt b=
/Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt
> > index 73407f50..daf8826 100644
> > --- a/Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt
> > +++ b/Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt
> > @@ -1,20 +1,23 @@
> >  STMicroelectronics Low Power Controller (LPC) - RTC
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > =20
> > -LPC currently supports Watchdog OR Real Time Clock functionality.
> > +LPC currently supports Watchdog OR Real Time Clock OR Clocksource
> > +functionality.
> > =20
> >  [See: ../watchdog/st_lpc_wdt.txt for Watchdog options]
> > +[See: ../timer/st,stih407-lpc for Clocksource options]
> > =20
> >  Required properties
> > =20
> > -- compatible 	: Must be one of: "st,stih407-lpc" "st,stih416-lpc"
> > -				  "st,stih415-lpc" "st,stid127-lpc"
> > +- compatible 	: Must be: "st,stih407-lpc"
>=20
> You are removing the compatibles documentation for the other supporte=
d SoC's like
> stih416-lpc stih415-lpc here.

It would be pretty difficult to do that by mistake. :)

See the comment I made to the Watchdog bindings patch for more info.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
