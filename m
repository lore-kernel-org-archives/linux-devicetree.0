From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v2 0/3] pinctrl: bcm2835: Add brcm,level property
Date: Thu, 8 Mar 2018 09:00:39 +0100 (CET)
Message-ID: <188888639.307907.1520496039100@email.1und1.de>
References: <431699005.307231.1520086916739@email.1und1.de>
 <1520216960-19880-1-git-send-email-matheus@castello.eng.br>
 <821312841.275581.1520423887935@email.1und1.de>
 <047e47b4-daf7-2ba2-ea86-0060a59049b7@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <047e47b4-daf7-2ba2-ea86-0060a59049b7@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Castello <matheus@castello.eng.br>
Cc: linus.walleij@linaro.org, eric@anholt.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Matheus,

> Matheus Castello <matheus@castello.eng.br> hat am 8. März 2018 um 01:12 geschrieben:
> 
> 
> Hi Stefan,
> 
> On 03/07/2018 07:58 AM, Stefan Wahren wrote:
> > Hi Matheus,
> > 
> >> Matheus Castello <matheus@castello.eng.br> hat am 5. März 2018 um 03:29 geschrieben:
> >>
> >>
> >> Hi Linus and Stefan,
> >>
> >> thanks for the tips.
> >>
> >> This series adds support for generic binding for pinctrl bcm2835 driver,
> >> and add the code for set output buffer of a pin using the output-low and
> >> output-high generic properties.
> >>
> >> Tested on Raspberry Pi Zero W, based on bcm2835 SoC.
> >>
> >> Matheus Castello (3):
> > 
> > looks like you missed the changes to the dt binding. Please also add Rob Herring and Mark Rutland to CC. We need a ACK from them.
> 
> are you talking about the .dts files? I add an overlay file for my tests. 
> I was thinking it would be better to start with this changes in the driver and then in another series to convert to the generic style in the .dts.
> If you find it better already add the conversion also in this series let me know.
> 
> I understood that I should put the device tree maintainers in thread only if I were to introduce a new property. As I am using generic properties and not introducing new ones I did not add them.
> Let me know if it is still necessary I stayed in this doubt.

no this is a misunderstanding. You are changing the DT interface because the driver supports new properties (from driver point of view). The DT users usually look at the binding document [1] not the source code. So you need to extend the binding document before changing the source code within a patch series. At the end we need a DT maintainer's ACK for the binding change. Using the generic properties doesn't allow us to skip this, but it increases the chance of an ACK.

Btw it's okay to keep the DTS files.

Stefan

[1] - https://elixir.bootlin.com/linux/v4.16-rc4/source/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt

> 
> Best Regards
> Matheus Castello
> > 
> >>   pinctrl: bcm2835: switch to GENERIC_PINCONF
> >>   pinctrl: bcm2835: Add support for generic pinctrl binding
> >>   pinctrl: bcm2835: Add support for output-low output-high properties
> >>
> >>  drivers/pinctrl/bcm/Kconfig           |  1 +
> >>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 88 +++++++++++++++++++++++------------
> >>  2 files changed, 60 insertions(+), 29 deletions(-)
> >>
> >> --
> >> 2.7.4
> >>
