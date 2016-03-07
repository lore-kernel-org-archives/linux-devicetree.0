From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v3 4/8] Documentation: devicetree: Clean up gpio-keys example
Date: Mon, 07 Mar 2016 19:05:39 +0100
Message-ID: <15855134.NAdvd5CP0M@diego>
References: <1457294038-14243-1-git-send-email-afaerber@suse.de> <1457294038-14243-5-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457294038-14243-5-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Julien Chauveau <chauveau.julien@gmail.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Am Sonntag, 6. M=E4rz 2016, 20:53:53 schrieb Andreas F=E4rber:
> Drop #address-cells and #size-cells, which are not required by the
> gpio-keys binding documentation, as button sub-nodes are not devices.
>=20
> Reported-by: Julien Chauveau <chauveau.julien@gmail.com>
> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> ---

changes to input-device bindings should go through the input tree, and =
thus=20
include Dmitry Thorokhov and the linux-input lists.


Heiko

>  v3: New (Julien)
>=20
>  Documentation/devicetree/bindings/input/gpio-keys.txt | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/input/gpio-keys.txt
> b/Documentation/devicetree/bindings/input/gpio-keys.txt index
> 21641236c095..1552a11f6786 100644
> --- a/Documentation/devicetree/bindings/input/gpio-keys.txt
> +++ b/Documentation/devicetree/bindings/input/gpio-keys.txt
> @@ -34,8 +34,6 @@ Example nodes:
>=20
>  	gpio_keys {
>  			compatible =3D "gpio-keys";
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
>  			autorepeat;
>  			button@21 {
>  				label =3D "GPIO Key UP";
