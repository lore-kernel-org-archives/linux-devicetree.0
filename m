From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH V2] MXS: Add DT binding support into stmp3xxx-rtc
Date: Fri, 29 Jun 2012 13:08:17 +0200
Message-ID: <4FED8CA1.5000800@pengutronix.de>
References: <1339181804-22822-1-git-send-email-marex@denx.de>
 <20120625043711.GA18156@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6835406306004846520=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120625043711.GA18156-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============6835406306004846520==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigB493FFC2E38291481686DC75"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigB493FFC2E38291481686DC75
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/25/2012 06:37 AM, Shawn Guo wrote:
> On Fri, Jun 08, 2012 at 08:56:44PM +0200, Marek Vasut wrote:
>> Add simple binding for the stmp3xxx-rtc.
>>
>> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
>> Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
>=20
> Hi Alessandro,
>=20
> The patch has some changes on arch/arm/boot/dts/imx28.dtsi, and also we=

> need the patch to convert some board files over to device tree.  May I
> have your ack to queue the patch on my tree?

The interrupt numbers are not as the driver expects them..

>=20
> Regards,
> Shawn
>=20
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
>> Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  .../devicetree/bindings/rtc/stmp3xxx-rtc.txt        |   19 ++++++++++=
+++++++++
>>  arch/arm/boot/dts/imx28.dtsi                        |    1 +
>>  drivers/rtc/rtc-stmp3xxx.c                          |    7 +++++++
>>  3 files changed, 27 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/rtc/stmp3xxx-rtc=
=2Etxt
>>
>> V2: Fix typos, remove fsl,imx28-rtc
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt b/=
Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt
>> new file mode 100644
>> index 0000000..a7a7de5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt
>> @@ -0,0 +1,19 @@
>> +* STMP3xxx/i.MX28 Time Clock controller
>> +
>> +Required properties:
>> +- compatible: should be one of the following.
>> +    * "fsl,stmp3xxx-rtc"
>> +- reg: physical base address of the controller and length of memory m=
apped
>> +  region.
>> +- interrupts: Two interrupt numbers to the cpu should be specified. F=
irst
>> +  interrupt number is the rtc tick interrupt and second interrupt num=
ber
>> +  is the rtc alarm interrupt. The number of cells representing a inte=
rrupt
>> +  depends on the parent interrupt controller.

The driver expects the first interrupt to the the alarm interrupt, the
event interrupt is not use, yet.

>> +
>> +Example:
>> +
>> +	rtc@80056000 {
>> +		compatible =3D "fsl,stmp3xxx-rtc";
>> +		reg =3D <0x80056000 2000>;
>> +		interrupts =3D <28 29>;
>> +	};
>> diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dt=
si
>> index cabcce8..5053019 100644
>> --- a/arch/arm/boot/dts/imx28.dtsi
>> +++ b/arch/arm/boot/dts/imx28.dtsi
>> @@ -387,6 +387,7 @@
>>  			};
>> =20
>>  			rtc@80056000 {
>> +				compatible =3D "fsl,imx28-rtc", "fsl,stmp3xxx-rtc";
>>  				reg =3D <0x80056000 2000>;
>>  				interrupts =3D <28 29>;

should be:
                                             <29 28>


>>  				status =3D "disabled";
>> diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
>> index 1028786..3aadb58 100644
>> --- a/drivers/rtc/rtc-stmp3xxx.c
>> +++ b/drivers/rtc/rtc-stmp3xxx.c
>> @@ -25,6 +25,7 @@
>>  #include <linux/interrupt.h>
>>  #include <linux/rtc.h>
>>  #include <linux/slab.h>
>> +#include <linux/of_device.h>
>> =20
>>  #include <mach/common.h>
>> =20
>> @@ -265,6 +266,11 @@ static int stmp3xxx_rtc_resume(struct platform_de=
vice *dev)
>>  #define stmp3xxx_rtc_resume	NULL
>>  #endif
>> =20
>> +static const struct of_device_id rtc_dt_ids[] =3D {
>> +	{ .compatible =3D "fsl,stmp3xxx-rtc", },
>> +	{ /* sentinel */ }
>> +};
>> +
>>  static struct platform_driver stmp3xxx_rtcdrv =3D {
>>  	.probe		=3D stmp3xxx_rtc_probe,
>>  	.remove		=3D stmp3xxx_rtc_remove,
>> @@ -273,6 +279,7 @@ static struct platform_driver stmp3xxx_rtcdrv =3D =
{
>>  	.driver		=3D {
>>  		.name	=3D "stmp3xxx-rtc",
>>  		.owner	=3D THIS_MODULE,
>> +		.of_match_table =3D rtc_dt_ids,
>>  	},
>>  };
>> =20
>> --=20
>> 1.7.10
>>
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enigB493FFC2E38291481686DC75
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/tjKQACgkQjTAFq1RaXHNx4wCfWv7O7MCuDgUFZ154RnWyqeoS
1WEAoInKHC7/wo26CvAYgdTC2qgYbmuY
=5qVy
-----END PGP SIGNATURE-----

--------------enigB493FFC2E38291481686DC75--

--===============6835406306004846520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6835406306004846520==--
