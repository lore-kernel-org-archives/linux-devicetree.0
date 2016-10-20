From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH] ARM: dts: rockchip: add i2c-bus subnode to edp
Date: Thu, 20 Oct 2016 15:47:56 +0200
Message-ID: <6083453f-08e1-643a-9638-1db38c704aa5@collabora.com>
References: <1476950845-28242-1-git-send-email-tomeu.vizoso@collabora.com>
 <7604646.6yosK0XMNL@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7604646.6yosK0XMNL@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, Randy Li <randy.li@rock-chips.com>, Jon Hunter <jonathanh@nvidia.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/20/2016 03:45 PM, Heiko Stübner wrote:
> Am Donnerstag, 20. Oktober 2016, 10:07:25 schrieb Tomeu Vizoso:
>> Add an empty 'i2c-bus' subnode to the edp node just so that the I2C core
>> doesn't attemp to parse the 'ports' subnode as containing i2c devices.
>>
>> This is to avoid spurious failure messages such as:
>>
>> i2c i2c-6: of_i2c: modalias failure on /dp@ff970000/ports
> 
> On the one hand, the edp really has an i2c bus - with its only client the EDID 
> listening at 0x50 (and maybe 0x30).
> 
> On the other hand, adding an empty bus to the (implementation independent) 
> devicetree just to make the Linux i2c subsystem happy sounds heavily like a 
> implementation-specific hack, as the edp i2c bus doesn't leak into the outside 
> world otherwise.
> 
> I guess this empty i2c bus not being part of the binding document points 
> heavily into the implementation-specific corner :-) .
> 
> My short search on other patches touching this didn't reveal anything but 
> maybe this was already discussed somewhere and found to be ok?

Here it is:

http://www.spinics.net/lists/linux-tegra/msg27862.html

Regards,

Tomeu

> Another option could be to just make of_i2c_register_device silent if 
> of_modalias_node returns -ENODEV?
> 
> 
> Heiko
> 
>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>> Cc: Randy Li <randy.li@rock-chips.com>
>> Cc: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>  arch/arm/boot/dts/rk3288.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
>> index 2f814ffeb605..94f4b7eecca2 100644
>> --- a/arch/arm/boot/dts/rk3288.dtsi
>> +++ b/arch/arm/boot/dts/rk3288.dtsi
>> @@ -1075,6 +1075,11 @@
>>  				};
>>  			};
>>  		};
>> +
>> +		i2c-bus {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +		};
>>  	};
>>
>>  	hdmi: hdmi@ff980000 {
> 
