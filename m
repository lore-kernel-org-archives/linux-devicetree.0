From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v7 3/9] pinctrl: actions: Add Actions S900 pinctrl driver
Date: Thu, 12 Apr 2018 14:10:28 +0200
Message-ID: <94aceb15-63a5-44a3-d0bc-f56adebc27d5@suse.de>
References: <20180404172258.7678-1-manivannan.sadhasivam@linaro.org>
 <20180404172258.7678-4-manivannan.sadhasivam@linaro.org>
 <CACRpkdZPOSDenSORGVLPuJKPP_iE97mZLXHJLcF2kH5wKPw=tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZPOSDenSORGVLPuJKPP_iE97mZLXHJLcF2kH5wKPw=tg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Daniel Thompson <daniel.thompson@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, hzhang@ucrobotics.com, bdong@ucrobotics.com, Mani Sadhasivam <manivannanece23@gmail.com>
List-Id: devicetree@vger.kernel.org

Am 12.04.2018 um 11:04 schrieb Linus Walleij:
> On Wed, Apr 4, 2018 at 7:22 PM, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> 
>> Add pinctrl driver for Actions Semi S900 SoC. The driver supports
>> pinctrl, pinmux and pinconf functionalities through a range of registers
>> common to both gpio driver and pinctrl driver.
>>
>> Pinmux functionality is available only for the pin groups while the
>> pinconf functionality is available for both pin groups and individual
>> pins.
>>
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Patch applied for v4.18
> 
> GOOD WORK!
> 
> We really need to get this in so that Andreas can work on S500
> patches with this as a base.

No, I refused to do that. If his patches get merged, Mani offered that
he will take care of rebasing/rewriting S500 part.

> 
> If any review comments still remain they can surely be addressed
> with incremental improvement patches.

My biggest problem was/is that Mani designed his structs totally
different from mine, with no explanation why or how they correlate.

Also I had protested against him defining fake pins for the drive
strength. Since I did not have time to review the newer patches yet,
please make sure that this is addressed _before_ merging. Changing the
binding after the fact is a problem!

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
