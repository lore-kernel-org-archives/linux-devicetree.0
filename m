From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] gpio: mention in DT binding doc that <name>-gpio is also
 supported
Date: Fri, 18 Sep 2015 19:17:08 +0200
Message-ID: <55FC4714.1010804@osg.samsung.com>
References: <1442453638-14246-1-git-send-email-javier@osg.samsung.com>
 <CAAVeFuK-doCwGB=EwN2F933G8_ubSRR2xz9xEnWLAhReTupvSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuK-doCwGB=EwN2F933G8_ubSRR2xz9xEnWLAhReTupvSA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Alexandre,

On 09/18/2015 05:44 PM, Alexandre Courbot wrote:
> On Thu, Sep 17, 2015 at 10:33 AM, Javier Martinez Canillas
> <javier@osg.samsung.com> wrote:
>> The GPIO DT binding doc mentions that GPIO are mapped by defining
>> a <name>-gpios property in the consumer device's node but a -gpio
>> sufix is also supported after commit:
>>
>> dd34c37aa3e8 ("gpio: of: Allow -gpio suffix for property names")
>>
>> Update the DT binding documentation to match the implementation.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>> ---
>> Hello,
>>
>> The GPIO documentation was updated to mention that the -gpio sufix
>> is also supported in patch https://lkml.org/lkml/2015/9/1/117 that
>> already landed in Torvalds tree.
>>
>> I now noticed that the DT binding also only mentions -gpios so I'm
>> posting this patch that adds -gpio to the DT binding documentation.
> 
> I think I remember that -gpio is considered obsolete and its use
> should thus not be encouraged, which is the reason why the
> documentation does not mention it. We could mention it and add a note
> saying that it should not be used for new bindings, but all in all
> isn't it better to keep the documentation clear of such use cases that
> will not be accepted for new patches anyway?
>

I agree that if that's the case then it should be documented. Currently
by reading the docs there is no way to tell if -gpio was only added to
support old DT bindings and should not be used or if is that the docs
were not updated when <function>-gpio parsing was added to gpiolib.

I can re-spin the patch making it clear that even when the -gpio suffix
is supported, it's only there for compatibility reasons and should not
be used for newer bindings.

And also Documentation/gpio/board.txt has to be updated now since now it
mentions <function>-gpio but does not say that should not be used.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
