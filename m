From: Parthiban Nallathambi <pn@denx.de>
Subject: Re: [PATCH v4 0/5] Add Actions Semi S700 pinctrl support
Date: Wed, 29 Aug 2018 09:55:48 +0200
Message-ID: <3c8a46a3-4884-ba0e-c72e-2e03357d6e40@denx.de>
References: <0180729200038.11795-1-sravanhome@gmail.com>
 <20180731194743.13678-1-sravanhome@gmail.com>
 <CACRpkda=q+LZMUN5xJ777ZGWxYRBdZTvG0naNqr5BoLnVQ1=aA@mail.gmail.com>
 <20180829074119.GA24958@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829074119.GA24958@Mani-XPS-13-9360>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: pn@denx.de, sravanhome@gmail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, mp-cs@actions-semi.com, Jeff Chen <jeff.chen@actions-semi.com>, "Thomas C. Liau" <thomas.liau@actions-semi.com>, linux@cubietech.com
List-Id: devicetree@vger.kernel.org

Hi Mani,

On 08/29/2018 09:41 AM, Manivannan Sadhasivam wrote:
> On Wed, Aug 29, 2018 at 09:35:38AM +0200, Linus Walleij wrote:
>> On Tue, Jul 31, 2018 at 9:48 PM Saravanan Sekar <sravanhome@gmail.com> wrote:
>>
>>> This patchset adds pinctrl support for Actions Semi S700 SoC.
>>> Pinmux functions are only accessible for pin groups while pinconf
>>> parameters are available for both pin groups and individual pins.
>>>
>>> pinctrl driver is verified using the Cubieboard7.
>>>
>>> common functionalities from s900 is moved for all Actions Semi
>>> SoC's usage.
>>> Common pad control configurations are moved to SoC specific
>>>
>>> dts entry for pinctrl depends on clock driver which is still under review:
>>> https://patchwork.kernel.org/patch/10533959/
>>
>> So what is the status of this patch set?
>>
> 
> Oops. This one slipped through the cracks...
> 
>> I am happy to apply it once you have the right buildtime dependencies
>> and Manivannan's ACK on the patch set! (Looks good to me.)
>>
> 
> Sadly mutt played its part on this patchset and 1,3 patches got
> deleted accidentally.
> 
>> Maybe you want to rebase on v4.19-rc1 and resend as v5 before
>> I do that though?
>>
> 
> Parthiban,
> 
> Can you please rebase and send the next iteration as Linus said. I'll take a
> look.

Sure, will send it today after rebase.

> 
> Sorry for the late reply.
> 
> Regards,
> Mani
> 
>> Yours,
>> Linus Walleij

-- 
Thanks,
Parthiban N
