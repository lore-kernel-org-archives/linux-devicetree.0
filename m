From: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: rk3288 Tinker Board (S) add wi-fi
Date: Mon, 18 Feb 2019 20:26:02 +0000
Message-ID: <3e9a387c-2ebc-c762-6222-90efc851e4ed@davidjohnsummers.uk>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
 <20190217121513.22965-3-beagleboard@davidjohnsummers.uk>
 <1528638260.343699.1550436208775@email.ionos.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1528638260.343699.1550436208775-uEpKuDZ350hmhno068Nerg@public.gmane.org>
Content-Language: en-PH
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 17/02/2019 20:43, Stefan Wahren wrote:
> Hi David,
>
>> David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org> hat am 17. Februar 2019 um 13:15 geschrieben:
>>
>>
>> +
>> +	sdio_pwrseq: sdio-pwrseq {
>> +		compatible = "mmc-pwrseq-simple";
>> +		clocks = <&rk808 RK808_CLKOUT1>;
>> +		clock-names = "ext_clock";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wifi_enable>;
> As i wrote at the Arch board it would be nice to keep the Asus comment here:
>
> /*
>   * On the module itself this is one of these (depending
>   * on the actual card populated):
>   * - SDIO_RESET_L_WL_REG_ON
>   * - PDN (power down when low)
>   */
>
Sorry Stefan,

I'm with Robin on this one. Three reasons:

1) When you look at where ASUS added these comments:

https://github.com/TinkerBoard/debian_kernel/commit/6a3128ade33f758887048578ada61a4b7ab8e678

They has only added RK_PD4 = 28

So at best to only applies to that change.

2) If you look at datasheet:

http://files.pine64.org/doc/datasheet/pine64/RTL8723BS.pdf
http://cit.odessa.ua/media/pdf/Intel-Compute-Stick/FN-Link_F23BDSM25-W1.pdf

Then neither of the two pins are mentioned, and the comment is not helpful

3) Should dts have comments in? Over time I'm got to like git, and that 
you click on blame. That is what showed in post one that the comment 
only applied to one pin. To me blame point to the patch - and that 
usually gives more details. Its why I explain that we don't know what 
these two pins are attached to - this doesn't sound good, but actually 
its all we know. So it explains things. So I now think that dts should 
have very few comments in, and only where they *really* add something. 
In this case we don't know what the comment means ..


>> +		reset-gpios = <&gpio4 RK_PD3 GPIO_ACTIVE_LOW>, <&gpio4 RK_PD4 GPIO_ACTIVE_LOW>;
>> +	};
>>   };
>>   
>>   &cpu0 {
>> @@ -337,8 +345,8 @@
>>   
>>   &io_domains {
>>   	status = "okay";
>> -
> Please drop this whitespace change
Most {} in dts don't have white space line in - only between {} {}. So a 
white space line in the middle of a single {} is unusual. I can't see 
what its needed for, or what it makes clearer. So to me removing makes 
it more in line with everything else. If people are unhappy though I'll 
add the white line back in again.
>>   	sdcard-supply = <&vccio_sd>;
>> +	wifi-supply = <&vcc_18>;
>>   };
>>   
>>   &pinctrl {
>> @@ -417,6 +425,12 @@
>>   			rockchip,pins = <7 8 RK_FUNC_GPIO &pcfg_pull_none>;
>>   		};
>>   	};
>> +
>> +	sdio {
>> +		wifi_enable: wifi-enable {
>> +			rockchip,pins = <4 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>, <4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
> Please make a line break after the first pin definition
Yes that makes sense

David
