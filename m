From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-gxl-s905d-phicomm-n1: add status LED
Date: Thu, 14 Mar 2019 11:08:50 -0700
Message-ID: <7hva0lwcp9.fsf@baylibre.com>
References: <20190312083326.18029-1-gch981213@gmail.com> <5c580f1b-1038-2c34-7047-e504eb4ac323@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5c580f1b-1038-2c34-7047-e504eb4ac323@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Chuanhong Guo <gch981213@gmail.com>, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Hi Chuanhong,
>
> On 12/03/2019 09:33, Chuanhong Guo wrote:
>> There is a white LED on the front panel behind the logo and the
>> manufacturer uses that LED to indicate network and USB drive status.
>> 
>> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
>> ---
>>  .../boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts    | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
>> index 9a8a8a7e4b53..b5667f1fb2c8 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
>> @@ -14,6 +14,16 @@
>>  	cvbs-connector {
>>  		status = "disabled";
>>  	};
>> +
>> +	leds {
>> +		compatible = "gpio-leds";
>> +
>> +		status {
>> +			label = "n1:white:status";
>> +			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
>> +			default-state = "on";
>> +		};
>> +	};
>>  };
>>  
>>  &cvbs_vdac_port {
>> 
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.2 with Neil's tag (branch: v5.2/dt64)

Kevin
