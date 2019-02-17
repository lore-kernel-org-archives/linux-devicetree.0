From: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: rk3288 Tinker Board (S) add wi-fi
Date: Sun, 17 Feb 2019 19:03:07 +0000
Message-ID: <af8bdf55-c815-247e-9fdd-0e610bac0d62@davidjohnsummers.uk>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
 <20190217121513.22965-3-beagleboard@davidjohnsummers.uk>
 <CAERgokmpHQb2czJdx++qFoogFRmkvXZm=4BNOsVuCz-ZvgTEaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAERgokmpHQb2czJdx++qFoogFRmkvXZm=4BNOsVuCz-ZvgTEaw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Tony McKahan <tonymckahan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Oh yes - didn't reply to the "chip_h", in asus patch called "chip_enable_h".

This is the <&gpio4 RK_PD3 GPIO_ACTIVE_LOW> IIRC. We could see that two 
pins were pulled. RK_PD3 and RK_PD4; but not knowing exactly why the 
pins were pulled, question is should they be separate?

We went the direction of putting both pins under wifi_enable.

Its not clear to me which is the least confusing, should wifi_enable 
need pulling two pins, or should there be an extra service 
"chip_enable_h" for the extra pin? Think our problem is we didn't see 
what "chip_enable_h" meant - the description doesn't help. Hence why we 
removed, and merged with wifi_enable ...

On 17/02/2019 14:32, Tony McKahan wrote:
> A similar configuration has been in use on Armbian images since kernel
> 4.14, but not in a clean enough format for submission. I will test
> this, but the only differences I see compared to ours are combination
> of the mystery "chip_h" power domain/reset with the Wifi one and the
> inclusion of sd_uhs_ddr50.
>
> -Tony
>
> On Sun, Feb 17, 2019 at 7:16 AM David Summers
> <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org> wrote:
>> This patch adds the wifi to the ASUS Tinker Board (S) machines.
>>
>> Unfortunatly neither the Tinker Board nor the Tinker Board S schematic
>> indicate how the WiFi is wired up on these devices. The WiFi is
>> provided by the RTL8723BS device, that has sdio WiFi and UART
>> Bluetooth. This patch just adds the WiFi interface.
>>
>> With no schematic, most of the wiring has been derived from the ASUS
>> patch to Debian:
>>
>> https://github.com/TinkerBoard/debian_kernel/commit/6a3128ade33f758887048578ada61a4b7ab8e678
>>
>> In conjunction with the pin out of the RTL8723BS device:
>>
>> http://files.pine64.org/doc/datasheet/pine64/RTL8723BS.pdf
>> http://cit.odessa.ua/media/pdf/Intel-Compute-Stick/FN-Link_F23BDSM25-W1.pdf
>>
>> The only unusual part is that to bring the card up, both the pins
>> RK_PD3 and RK_PD4 need to be pulled. Why this needs to be done is not
>> clear, best explaination is that they are connected to the RTL8723BS
>> pins WL_DIS# and BT_DIS#, which the data sheet vaguely says:
>>
>> Shared with GPIO9 This Pin Can Externally Shutdown the RTL8723BS WLAN
>> function when BT_DISn is Pulled Low. When this pin deasserted, SDIO
>> interface will be disabled. This pin can also support the WLAN Ra
>> dio-off function with host interface remaining connected.
>>
>> Anyway extensive testing the TheSaint on ArchLinux Arm Forum
>>
>> https://archlinuxarm.org/forum/viewtopic.php?f=44&t=13064&start=120#p60548
>>
>> Signed-off-by: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
>> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
>>
>> +
>> +       sdio_pwrseq: sdio-pwrseq {
>> +               compatible = "mmc-pwrseq-simple";
>> +               clocks = <&rk808 RK808_CLKOUT1>;
>> +               clock-names = "ext_clock";
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&wifi_enable>;
>> +               reset-gpios = <&gpio4 RK_PD3 GPIO_ACTIVE_LOW>, <&gpio4 RK_PD4 GPIO_ACTIVE_LOW>;
>> +       };
>>
>> +
>> +       sdio {
>> +               wifi_enable: wifi-enable {
>> +                       rockchip,pins = <4 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>, <4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
>> +               };
>> +       };
