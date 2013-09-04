From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3] gpio: interrupt consistency check for OF GPIO IRQs
Date: Wed, 04 Sep 2013 14:18:51 -0600
Message-ID: <522795AB.3060303@wwwdotorg.org>
References: <1377526030-32024-1-git-send-email-larsi@wh2.tu-dresden.de> <4094364.ACYUvMRRNa@lem-wkst-02> <52261C5C.9000102@wwwdotorg.org> <5034887.FlGzi4P5YS@lem-wkst-02>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5034887.FlGzi4P5YS@lem-wkst-02>
Sender: linux-gpio-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lars Poeschel <larsi@wh2.tu-dresden.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-Id: devicetree@vger.kernel.org

On 09/04/2013 03:21 AM, Lars Poeschel wrote:
> On Wednesday 04 September 2013 11:29:00, Stephen Warren wrote:
>> On 09/02/2013 03:38 AM, Lars Poeschel wrote:
>>> Am Freitag, 30. August 2013, 13:53:45 schrieb Stephen Warren:
>> ...
>>
>>>> Yet the current patch only addresses a limited set of cases, since it
>>>> doesn't hook the APIs but rather parses the DT. It doesn't cover the
>>>> non-DT case. It should if the feature is useful.
>>>
>>> As pointed out before, only DT has this problem, that,
>>
>> That's completely false. Both DT and non-DT can represent the exact same
>> HW, and use the exact same drivers. It's equally possible to write a bug
>> in a board file or a DT file (i.e. a typo or incorrect reading of the
>> schematic) that causes the wrong GPIO or IRQ ID to be used, and hence
>> for there to be conflicts. Any solution to this issue needs to address
>> both cases.
> 
> This is again not the point. This is not what this patch is trying to solve. 
> The patch is trying to solve problem A. But you are talking about problem B.
> Sure I can write a bug in board files and I can write a bug in DT files. The 
> patch is not trying to prevent that. This is a completly different thing.

I'm not trying to assert what this current patch was written to solve. I
am asserting what the patch should be (have been) written to solve.

My point is that we shouldn't only solve the problem in case B, but
rather solve the problem in all cases (A, B, and anything else). Doing
anything else isn't useful in my opinion; it's too special-cased.
