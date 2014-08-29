From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: zynq: DT: Add LEDs to zc702 DT
Date: Fri, 29 Aug 2014 06:57:15 +0200
Message-ID: <93dd8f20-f13a-4446-8b11-e8508fc0ebb7@BY2FFO11FD047.protection.gbl>
References: <1409242973-2735-1-git-send-email-soren.brinkmann@xilinx.com>
 <20140828171536.GB4345@xsjandreislx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="47Ir30rTcEQf8R6Ol1DKg2pPU9u6tq70C"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140828171536.GB4345@xsjandreislx>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Ezra Savard <ezras-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ezra Savard <ezra.savard-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--47Ir30rTcEQf8R6Ol1DKg2pPU9u6tq70C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08/28/2014 07:15 PM, S=C3=B6ren Brinkmann wrote:
> On Thu, 2014-08-28 at 09:22AM -0700, Soren Brinkmann wrote:
>> From: Ezra Savard <ezra.savard-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>
>> Adds LEDs to the zc702 devicetree for use with the leds-gpio driver.
>>
>> Signed-off-by: Ezra Savard <ezra.savard-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> Reviewed-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/zynq-zc702.dts | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq=
-zc702.dts
>> index 835c3089c61c..4e9fe26b3e85 100644
>> --- a/arch/arm/boot/dts/zynq-zc702.dts
>> +++ b/arch/arm/boot/dts/zynq-zc702.dts
>> @@ -27,6 +27,16 @@
>>  		bootargs =3D "console=3DttyPS0,115200 earlyprintk";
>>  	};
>> =20
>> +	gpio-leds {
> The node name should rather be just 'leds'. That slipped through, sorry=
=2E
> Do you want a v2 for that?

yes, please send v2.

Thanks,
Michal




--47Ir30rTcEQf8R6Ol1DKg2pPU9u6tq70C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlQACCsACgkQykllyylKDCHOkACfXwIuicyn/1RK5huAlGoCrjnJ
iAYAn104llAWJWyr+5PWtE9sCZLcYa9I
=xMBG
-----END PGP SIGNATURE-----

--47Ir30rTcEQf8R6Ol1DKg2pPU9u6tq70C--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
