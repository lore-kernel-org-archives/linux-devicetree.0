From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 3/4] ARM: dts: Clean up exynos5250-snow
Date: Thu, 31 Jul 2014 21:19:35 +0200
Message-ID: <53DA96C7.30009@gmail.com>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de> <1406822910-6255-4-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1406822910-6255-4-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Stephan van Schaik <stephan@synkhronix.com>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Andreas,

Please see my comments inline.

On 31.07.2014 18:08, Andreas F=C3=A4rber wrote:
> Use the new style of referencing inherited nodes and use symbolic nam=
es.
>=20
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>

[snip]

> -
>  	usb@12110000 {
> -		samsung,vbus-gpio =3D <&gpx1 1 0>;
> +		samsung,vbus-gpio =3D <&gpx1 1 GPIO_ACTIVE_HIGH>;
>  	};

This is a higher level node being overridden, so it should be specified
using references too.

> =20
>  	fixed-rate-clocks {
> @@ -287,7 +206,7 @@
>  	};
> =20
>  	hdmi {

Ditto.

Best regards,
Tomasz
