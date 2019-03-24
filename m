From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: Add vendor prefix for MaxBotix
Date: Sun, 24 Mar 2019 12:01:39 +0000
Message-ID: <20190324120139.573814dc@archlinux>
References: <20190317203458.bgculdjvtt44zkch@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190317203458.bgculdjvtt44zkch@arbad>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, arnd@arndb.de, davem@davemloft.net, gregkh@linuxfoundation.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, robh@kernel.org, songqiang1304521@gmail.com, treding@nvidia.com, techsupport@maxbotix.com
List-Id: devicetree@vger.kernel.org

On Sun, 17 Mar 2019 21:35:00 +0100
Andreas Klinger <ak@it-klinger.de> wrote:

> Add MaxBotix, which is a vendor of ultrasonic rangers in different
> varieties and interfaces.
>=20
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docu=
mentation/devicetree/bindings/vendor-prefixes.txt
> index 389508584f48..added54a1108 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -225,6 +225,7 @@ lsi	LSI Corp. (LSI Logic)
>  lwn	Liebherr-Werk Nenzing GmbH
>  macnica	Macnica Americas
>  marvell	Marvell Technology Group Ltd.
> +maxbotix	MaxBotix Inc.
>  maxim	Maxim Integrated Products
>  mbvl	Mobiveil Inc.
>  mcube	mCube
