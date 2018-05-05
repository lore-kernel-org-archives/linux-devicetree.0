From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 5/7] gpio: pca953x: fix address calculation for pcal6524
Date: Sat, 5 May 2018 13:29:55 +0300
Message-ID: <CAHp75Vfqcezf-WKuAamVJLDLdNStJCb0X7hB1+45TctM-iDUUQ@mail.gmail.com>
References: <cover.1524933096.git.hns@goldelico.com> <aaac818909d71523726094b1dfacc03e756874e9.1524933096.git.hns@goldelico.com>
 <CAHp75VfD4gYesEw2n4JMycmr=qcAtqSkAAjwCViJZRYC6kVUVg@mail.gmail.com>
 <4F016FCD-04B0-4EE1-A9F4-5A182DD437EF@goldelico.com> <14D3FF3C-0F70-4F72-B381-318B61B944CA@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <14D3FF3C-0F70-4F72-B381-318B61B944CA@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, kernel@pyra-handheld.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 4, 2018 at 10:30 AM, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>> Am 02.05.2018 um 14:35 schrieb H. Nikolaus Schaller <hns@goldelico.com>:

>>> Suggested-by ?
>>
>> Detecting that we need to adjust the registers generally was from me,
>> but your suggestion of an improved formula should of course be mentioned
>> and appreciated!
>>
>> I'll think about a good formulation for v6.
>
> Would the following commit message be ok for you?

Yes, it's perfect.

>
> ...
>
> Therefore, we have to add code to the 24 bit accessor functions
> that adjusts the register number for these exended registers.
>
> The formula finally used was developed and proposed by
> Andy Shevchenko <andy.shevchenko@gmail.com>.
>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>


-- 
With Best Regards,
Andy Shevchenko
