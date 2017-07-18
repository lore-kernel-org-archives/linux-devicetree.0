From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio-exar: Use correct property prefix and document bindings
Date: Tue, 18 Jul 2017 09:37:03 -0500
Message-ID: <CAL_Jsq+vP-8a1x7Q1zB_mM_a14o=gyBd-MD8SMCEkpmpk2O_5Q@mail.gmail.com>
References: <491bf615-f1d2-13ff-fa6e-fe5350a0b3b0@siemens.com>
 <20170717174825.p2oflpvbd5ns6xx3@rob-hp-laptop> <e4190c03-5894-a9d2-a1e6-44135a3acb6a@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e4190c03-5894-a9d2-a1e6-44135a3acb6a@siemens.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 17, 2017 at 1:20 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> On 2017-07-17 19:48, Rob Herring wrote:
>> On Thu, Jul 13, 2017 at 08:44:26AM +0200, Jan Kiszka wrote:
>>> The device-specific property should be prefixed with the vendor name
>>> Change this and document the bindings of this platform device.
>>
>> You are breaking backwards compatibility. You minimally need to state
>> that and why that is okay in this case.
>
> There is no previous version yet: The patch that introduced this just
> entered for 4.13. Linus remarked that "linux," is the wrong prefix and
> wanted this to be changed before this version becomes final.

Please describe this in the commit message and add a Fixes tag.

Rob
