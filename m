From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH v3 1/4] pinctrl-tz1090: add TZ1090 pinctrl driver
Date: Mon, 24 Jun 2013 16:38:57 +0100
Message-ID: <51C86811.2010400@imgtec.com>
References: <1371720391-21825-1-git-send-email-james.hogan@imgtec.com> <1371720391-21825-2-git-send-email-james.hogan@imgtec.com> <CACRpkdbMfWLf17Aty-a80_+gETTvLgO3wEWVFsnhuLypy61VBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbMfWLf17Aty-a80_+gETTvLgO3wEWVFsnhuLypy61VBw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 24/06/13 16:04, Linus Walleij wrote:
> On Thu, Jun 20, 2013 at 11:26 AM, James Hogan <james.hogan@imgtec.com> wrote:
> 
>> Add a pin control driver for the main pins on the TZ1090 SoC. This
>> doesn't include the low-power pins as they're controlled separately via
>> the Powerdown Controller (PDC) registers.
>>
>> Signed-off-by: James Hogan <james.hogan@imgtec.com>
>> Cc: Grant Likely <grant.likely@linaro.org>
>> Cc: Rob Herring <rob.herring@calxeda.com>
>> Cc: Rob Landley <rob@landley.net>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: linux-doc@vger.kernel.org
>> Cc: devicetree-discuss@lists.ozlabs.org
>> ---
>> Changes in v3:
>>  - separated from irq-imgpdc and removed arch/metag changes to allow
>>    these patches to go upstream separately via the pinctrl[/gpio] trees
>>    (particularly the pinctrl drivers depend on the new pinconf DT
>>    bindings).
>>  - some s/unsigned/unsigned int/.
>>  - some s/unsigned int/bool/ and use of BIT().
>>  - pinctrl-tz1090*: switch to generic pinconfig DT bindings and
>>    pinconf_generic_dump_config.
>>  - pinctrl-tz1090*: use tz1090, prefix for pins and function in DT
>>    bindings.
>>  - pinctrl-tz1090*: make internal functions static.
>>  - pinctrl-tz1090*: move initcall from postcore to arch.
> 
> Thanks James, patch applied.
> 
> Also thanks for helping out in getting the generic pinconf
> in place for some three different drivers for this merge window,
> this was very good for pinctrl at large.

Thanks Linus, and no problem!

Cheers
James

