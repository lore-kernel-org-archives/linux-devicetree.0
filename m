From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v2 0/3] pinctrl: bcm2835: Add brcm,level property
Date: Wed, 7 Mar 2018 12:58:07 +0100 (CET)
Message-ID: <821312841.275581.1520423887935@email.1und1.de>
References: <431699005.307231.1520086916739@email.1und1.de>
 <1520216960-19880-1-git-send-email-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520216960-19880-1-git-send-email-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, Matheus Castello <matheus@castello.eng.br>
Cc: eric@anholt.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Matheus,

> Matheus Castello <matheus@castello.eng.br> hat am 5. März 2018 um 03:29 geschrieben:
> 
> 
> Hi Linus and Stefan,
> 
> thanks for the tips.
> 
> This series adds support for generic binding for pinctrl bcm2835 driver,
> and add the code for set output buffer of a pin using the output-low and
> output-high generic properties.
> 
> Tested on Raspberry Pi Zero W, based on bcm2835 SoC.
> 
> Matheus Castello (3):

looks like you missed the changes to the dt binding. Please also add Rob Herring and Mark Rutland to CC. We need a ACK from them.

>   pinctrl: bcm2835: switch to GENERIC_PINCONF
>   pinctrl: bcm2835: Add support for generic pinctrl binding
>   pinctrl: bcm2835: Add support for output-low output-high properties
> 
>  drivers/pinctrl/bcm/Kconfig           |  1 +
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 88 +++++++++++++++++++++++------------
>  2 files changed, 60 insertions(+), 29 deletions(-)
> 
> --
> 2.7.4
>
