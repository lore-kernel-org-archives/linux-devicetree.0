From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] input: gpio-keys: add support to name the gpio-keys
Date: Thu, 14 Jan 2016 10:16:30 +0100
Message-ID: <CACRpkdaL5UFPW-=E8iVG7JFDh3=8kvfDrs+ZKRXtSRCNRAQ=RQ@mail.gmail.com>
References: <1452598370-28509-1-git-send-email-ldewangan@nvidia.com>
	<1452598370-28509-2-git-send-email-ldewangan@nvidia.com>
	<20160112144301.GA30932@rob-hp-laptop>
	<569513E6.60608@nvidia.com>
	<CAL_Jsq+ZLVNXVnQX+fYGjhqAx6aFrPNgBBXbPGTKrWoY52vMvw@mail.gmail.com>
	<56951A98.40502@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <56951A98.40502@nvidia.com>
Sender: linux-input-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 12, 2016 at 4:24 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> On Tuesday 12 January 2016 08:53 PM, Rob Herring wrote:
>> On Tue, Jan 12, 2016 at 8:55 AM, Laxman Dewangan <ldewangan@nvidia.com>
>> wrote:
>>>
>>> On Tuesday 12 January 2016 08:13 PM, Rob Herring wrote:
>>>>
>>>> On Tue, Jan 12, 2016 at 05:02:50PM +0530, Laxman Dewangan wrote:
>
>
>> So label is exactly for this purpose of defining user meaningful names.
>>
> Yes, I can use the label for name. I will update the patch.
>
> Just for understanding, is "label" is better property name to pass the
> specific name?

Yes, look at this from
arch/arm64/boot/dts/arm/juno-motherboard.dtsi:

                        gpio_keys {
                                compatible = "gpio-keys";
                                #address-cells = <1>;
                                #size-cells = <0>;

                                button@1 {
                                        debounce_interval = <50>;
                                        wakeup-source;
                                        linux,code = <116>;
                                        label = "POWER";
                                        gpios = <&iofpga_gpio0 0 0x4>;
                                };
                                button@2 {
                                        debounce_interval = <50>;
                                        wakeup-source;
                                        linux,code = <102>;
                                        label = "HOME";
                                        gpios = <&iofpga_gpio0 1 0x4>;
                                };
(...)

Currently these names (POWER, HOME etc) appear nicely in
/proc/interrupts, so I guess the same should be used for input?

Yours,
Linus Walleij
