From: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Adding LEDs handling via leds-gpio
 for the Radxa Rock2 Square
Date: Wed, 30 Dec 2015 17:07:46 +0100
Message-ID: <1451491666.11453.29.camel@collabora.co.uk>
References: <1451474219-1313-1-git-send-email-romain.perier@gmail.com>
	 <3613784.8JLtyMHEE9@diego> <1451490343.11453.28.camel@collabora.co.uk>
	 <3020768.zersTrE99c@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3020768.zersTrE99c@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-12-30 at 16:53 +0100, Heiko St=C3=BCbner wrote:
> Am Mittwoch, 30. Dezember 2015, 16:45:43 schrieb Sjoerd Simons:
> > On Wed, 2015-12-30 at 16:20 +0100, Heiko St=C3=BCbner wrote:
> > >=C2=A0
> I only looked at the schematics, so missed that. While personally I'd
> still=C2=A0
> like having the "christmas-tree" off by default, Sjoerd's argument
> for the=C2=A0
> trigger-choice sounds sensible.
> Hint for next time: Describing that makes a good commit message
>=20
> Anybody opposed to me adding the following commit message?
>=20
> ----
> Describe the two user-controllable LEDs on Rock2-square boards.
> The default-triggers mimic the behaviour of the vendor-kernel to
> keep functionalities in sync.
> ----

Looks good to me, with that commit message feel free to add:

Reviewed-by: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
>=20
> Heiko
>=20

--=20
Sjoerd Simons
Collabora Ltd.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
