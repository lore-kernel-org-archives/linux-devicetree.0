From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] drivers: gpio: pca953x: add compatibility for pcal6524
 and pcal9555a
Date: Wed, 14 Mar 2018 17:25:52 +0200
Message-ID: <CAHp75VeD_2W-psRxz=MkWpUpUGoX7xx=9O9NM2a3YQ3yzhmN7A@mail.gmail.com>
References: <49f6922ba342cf69bfd2a787d0c2a93b4df2c429.1520664883.git.hns@goldelico.com>
 <CAHp75Ve8Y2AOm36KwuVUhssLR7Q82KS1SzB1tcKw57_LdqkKhQ@mail.gmail.com> <0BF8A237-1EB9-465A-9A7C-75163F093F18@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0BF8A237-1EB9-465A-9A7C-75163F093F18@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Yong Li <yong.b.li@intel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, letux-kernel@openphoenux.org, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

On Wed, Mar 14, 2018 at 2:39 PM, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>> Am 13.03.2018 um 17:56 schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
>> On Sat, Mar 10, 2018 at 1:00 PM, H. Nikolaus Schaller <hns@goldelico.com> wrote:

>> What does L means in the model code?
>
> Good question. The data sheets don't tell. But 6424 and 6524 are not identical
> from register set and overall functions, although quite similar.
> Only for pin and package.
>
> As far as I understand the 6524 (and all PCAL) have additional interrupt
> latch mechanisms and registers so that it is possible to disable each
> I/O pin individually as an interrupt while for the 6424 they are always
> enabled. Maybe this is the "L" designator.

IIRC "L" stands for the "Latch" as you correctly described above.

> But we aren't using interrupts yet.

Are you planning? Or let's put it this way: does the hardware support it?

>> Perhaps we need to rename PCA_PCAL to be more specific?
>
> My assumption is that it should be there for all PCAL variants,
> but I think the original author who introduced this constant should know.

>     The original patch was submitted by
>     Josef Ahmad <josef.ahmad@linux.intel.com>
>     http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-quark/tree/recipes-kernel/linux/files/0015-Quark-GPIO-1-2-quark.patch

I'm not sure we can reach to Josef (at least easily). So, better to
rely on official datasheets.

>>> +       { .compatible = "nxp,pcal6524", .data = OF_953X(24, PCA_INT), },
>>> +       { .compatible = "nxp,pcal9555a", .data = OF_953X(16, PCA_INT), },
>>
>> Other way around, you missed PCA_PCAL in the second case.
>
> Ah, ok. It wasn't clear how these flag relate to the i2c table because they
> are hidden by a macro here. I'd assume that PCA_PCAL is missing for both.

Yep, if HW supports it.

> So it might be that we run the pcal6524 in non-PCAL mode because we use DT.
> I can do a test as soon as I have access to the hardware.

Please, do.

-- 
With Best Regards,
Andy Shevchenko
