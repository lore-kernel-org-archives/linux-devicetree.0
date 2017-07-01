From: chen <547884940-9uewiaClKEY@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: dts: rockchip: enable saradc for rk3288-evb
Date: Sat, 1 Jul 2017 20:55:04 +0800
Message-ID: <0200fd0a-b914-b31e-d76e-0b46fc59b876@qq.com>
References: <1498874567-11219-1-git-send-email-jacob-chen@iotwrt.com>
 <1498874567-11219-5-git-send-email-jacob-chen@iotwrt.com>
 <10342435.5c883YxTZd@phil>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1267261569178101537=="
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <10342435.5c883YxTZd@phil>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============1267261569178101537==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi heiko,


Heiko Stuebner wrote on 2017年07月01日 19:06:
> Hi Jacob,
>
> Am Samstag, 1. Juli 2017, 10:02:46 CEST schrieb Jacob Chen:
>> saradc in rk3288-evb use 1.8v ref.
>>
>> Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/rk3288-evb.dtsi | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk3288-evb.dtsi
>> index f226ca7..9cee856 100644
>> --- a/arch/arm/boot/dts/rk3288-evb.dtsi
>> +++ b/arch/arm/boot/dts/rk3288-evb.dtsi
>> @@ -129,6 +129,15 @@
>>   		};
>>   	};
>>   
>> +	vccadc_ref: vccadc-ref {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc1v8_sys";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +	};
> this looks wrong. Regulators should always be named with the name
> used in schematics and also, according to the rk3288-evb schematics
> I have here, the saradc uses vcc_18 directly which comes from either
> the rk808 or act8846 pmics (depending on the board version).
>

OK,  I don't have software to check that schematics...
Agree and i will send a new patch.

>> +
>>   	/* This turns on USB vbus for both host0 (ehci) and host1 (dwc2) */
>>   	vcc_host: vcc-host-regulator {
>>   		compatible = "regulator-fixed";
>> @@ -218,6 +227,11 @@
>>   	status = "okay";
>>   };
>>   
>> +&saradc {
>> +	vref-supply = <&vccadc_ref>;
> So taking the above into account
> 	vref-supply = <&vcc_18>; ?
>
>
> Heiko
>
>> +	status = "okay";
>> +};
>> +
>>   &sdmmc {
>>   	bus-width = <4>;
>>   	cap-mmc-highspeed;
>>
>
>


T�


--===============1267261569178101537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip

--===============1267261569178101537==--
