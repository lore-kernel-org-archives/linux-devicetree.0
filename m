From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2] gpio: keystone: add dsp gpio controller driver
Date: Mon, 11 Aug 2014 19:06:45 +0300
Message-ID: <53E8EA15.2040003@ti.com>
References: <1406126699-10053-1-git-send-email-grygorii.strashko@ti.com> <CACRpkdZAHj+PMu-xJJow+9ndbp9srnQtmb4E2k5x3nkaQA1jCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZAHj+PMu-xJJow+9ndbp9srnQtmb4E2k5x3nkaQA1jCg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, ivan.khoronzhuk@ti.com, Muralidharan Karicheri <m-karicheri2@ti.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Varka Bhadram <varkabhadram@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 08/08/2014 03:53 PM, Linus Walleij wrote:
> On Wed, Jul 23, 2014 at 4:44 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> 
>> From: Murali Karicheri <m-karicheri2@ti.com>
>>
>> On Keystone SOCs, ARM host can send interrupts to DSP cores using the
>> DSP GPIO controller IP. Each DSP GPIO controller provides 28 IRQ signals for
>> each DSP core. This is one of the component used by the IPC mechanism used
>> on Keystone SOCs.
>>
>> Keystone 2 DSP GPIO controller has specific features:
>> - each GPIO can be configured only as output pin;
>> - setting GPIO value to 1 causes IRQ generation on target DSP core;
>> - reading pin value returns 0 - if IRQ was handled or 1 - IRQ is still
>>    pending.
>>
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> ---
>> Changes in v2:
>> - minor comments applied
> 
> Hm so there was one major comment, quoting myself:
> 
> "And if you proceed with this, please integrate it with
> drivers/gpio/gpio-syscon.c, I don't need more special
> syscons GPIO handlers."
> 
> Maybe you missed this in the midst of the other discussions
> about whether this is GPIO at all, but that comment still
> stands even if you talk me down on the generality of this
> driver.
> 

There is some misunderstanding, sorry. 
And I've not missed your Major comment.

I posted v2 after a week after v1, but, unfortunately, right
before discussion on v1 had been actually started :(


>> +++ b/Documentation/devicetree/bindings/gpio/gpio-keystone.txt
> 
> Make this follow the style in:
> Documentation/devicetree/bindings/gpio/cirrus,clps711x-mctrl-gpio.txt
> 

Regards,
-grygorii

