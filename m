From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: nitrogen6x: use simple-panel instead of
 display-timings for LVDS0
Date: Mon, 18 May 2015 07:12:29 -0700
Message-ID: <5559F34D.5090308@boundarydevices.com>
References: <1431804202-11067-1-git-send-email-eric.nelson@boundarydevices.com>	<1431804202-11067-2-git-send-email-eric.nelson@boundarydevices.com> <20150518075844.7e1b5916@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150518075844.7e1b5916-VjFSrY7JcPWvSplVBqRQBQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/17/2015 10:58 PM, Lothar Wa=C3=9Fmann wrote:
> Hi,
>=20
>> Also add alias for backlight_lvds and connect it to the display.
>>
>> Signed-off-by: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi | 30 +++++++++++++++++---=
----------
>>  1 file changed, 17 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi b/arch/arm/bo=
ot/dts/imx6qdl-nitrogen6x.dtsi
>> index fd096dc..712c5ec 100644
>> --- a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
>> +++ b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
>> @@ -122,7 +122,7 @@
>>  		status =3D "okay";
>>  	};
>> =20
>> -	backlight_lvds {
>> +	backlight_lvds: backlight_lvds {
>>
> The patch does not add an 'alias', but a 'label'.
>=20

Good catch.

Thanks for the clarification.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
