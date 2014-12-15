From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/8] mfd: Add ST's Low Power Controller driver
Date: Mon, 15 Dec 2014 14:38:50 +0000
Message-ID: <20141215143850.GD13885@x1>
References: <1418642738-17407-1-git-send-email-lee.jones@linaro.org>
 <2928949.OKYp272uiY@wuerfel>
 <20141215135052.GC13885@x1>
 <5276146.VV460E9Y1P@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5276146.VV460E9Y1P@wuerfel>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 15 Dec 2014, Arnd Bergmann wrote:

> On Monday 15 December 2014 13:50:52 Lee Jones wrote:
> > > >=20
> > >=20
> > > I don't think it's necessary to have the MFD node if only one of =
the
> > > two modes can be used based on a DT property. It should be enough
> > > to have both the rtc and the wdt driver list the same compatible
> > > string and check the property in the probe function to decide if
> > > they want to drive the device or not:
> >=20
> > I tried that and it didn't work.  Only one driver probed.
> >=20
> >=20
>=20
> Strange, the code in really_probe() and the comment in device_attach(=
)
> suggest that this is not the intentional behavior. What error
> code did you return? If it's -ENODEV or -ENXIO, it should keep
> trying the other drivers, otherwise it will give up.

Oh I see.  So if I return -ENODEV it will keep trying to bind with
other drivers.  I'll try that and report back.

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
