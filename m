From: =?UTF-8?Q?Pablo_Sebasti=c3=a1n_Greco?= <pgreco@centosproject.org>
Subject: Re: [linux-sunxi] Re: [PATCH v5 7/7] ARM: dts: sun8i: v40:
 bananapi-m2-berry: Add Bluetooth device node
Date: Thu, 2 May 2019 07:27:39 -0300
Message-ID: <c96ecf5a-398c-d34e-72b8-332f0efbade0@centosproject.org>
References: <1556040365-10913-1-git-send-email-pgreco@centosproject.org>
 <1556040365-10913-8-git-send-email-pgreco@centosproject.org>
 <20190502074103.vtuxmsl55u3ygyvl@flea>
 <CAGb2v65eaRLRkJ2hvoOc1Cr=ncSeqy7Tq2pzt4rk4uiWQeag2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGb2v65eaRLRkJ2hvoOc1Cr=ncSeqy7Tq2pzt4rk4uiWQeag2w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: wens@kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


El 2/5/19 a las 05:20, Chen-Yu Tsai escribió:
> On Thu, May 2, 2019 at 3:41 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>> On Tue, Apr 23, 2019 at 02:26:04PM -0300, Pablo Greco wrote:
>>> The AP6212 is based on the Broadcom BCM43430 or BCM43438. The WiFi side
>>> identifies as BCM43430, while the Bluetooth side identifies as BCM43438.
>>>
>>> The Bluetooth side is connected to UART3 in a 4 wire configuration. Same
>>> as the WiFi side, due to being the same chip and package, DLDO1 and
>>> DLDO2 regulator outputs from the PMIC provide overall power via VBAT and
>>> I/O power via VDDIO. The CLK_OUT_A clock output from the SoC provides
>>> the LPO low power clock at 32.768 kHz.
>>>
>>> This patch enables Bluetooth on this board, and also adds the missing
>>> LPO clock on the WiFi side. There is also a PCM connection for
>>> Bluetooth, but this is not covered here.
>>>
>>> The LPO clock is fed from CLK_OUT_A, which needs to be muxed on pin
>>> PI12. This can be represented in multiple ways. This patch puts the
>>> pinctrl property in the pin controller node. This is due to limitations
>>> in Linux, where pinmux settings, even the same one, can not be shared
>>> by multiple devices. Thus we cannot put it in both the WiFi and
>>> Bluetooth device nodes. Putting it the CCU node is another option, but
>>> Linux's CCU driver does not handle pinctrl. Also the pin controller is
>>> guaranteed to be initialized after the CCU, when clocks are available.
>>> And any other devices that use muxed pins are guaranteed to be
>>> initialized after the pin controller. Thus having the CLK_OUT_A pinmux
>>> reference be in the pin controller node is a good choice without having
>>> to deal with implementation issues.
>>>
>>> Signed-off-by: Pablo Greco <pgreco@centosproject.org>
>>> ---
>>>   arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 22 ++++++++++++++++++++++
>>>   1 file changed, 22 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
>>> index c87f2c0..15c22b0 100644
>>> --- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
>>> +++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
>>> @@ -96,6 +96,8 @@
>>>        wifi_pwrseq: wifi_pwrseq {
>>>                compatible = "mmc-pwrseq-simple";
>>>                reset-gpios = <&pio 6 10 GPIO_ACTIVE_LOW>; /* PG10 WIFI_EN */
>>> +             clocks = <&ccu CLK_OUTA>;
>>> +             clock-names = "ext_clock";
>> So if you don't have that patch (that enables bluetooth) the wifi
>> doesn't work (even though the previous patch is supposed to enable it)
> Maybe we should just squash the two (WiFi and Bluetooth) together?
> After all, they are in the same package, and depend on some of the
> same things, such as clocks and regulators.
>
> ChenYu
That seems better, I was trying to keep the same logic the patches 
applied to the ultra.
>>>        };
>>>   };
>>>
>>> @@ -173,6 +175,7 @@
>>>
>>>   &pio {
>>>        pinctrl-names = "default";
>>> +     pinctrl-0 = <&clk_out_a_pin>;
>> This one should bein the previous one as well
>>
>> Maxime
>>
>> --
>> Maxime Ripard, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>> --
>> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
>> For more options, visit https://groups.google.com/d/optout.
Pablo.
