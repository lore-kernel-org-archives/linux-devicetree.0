From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V4 Resend 2/3] mfd: stmpe: Remove irq_trigger from
 platform data
Date: Thu, 29 Nov 2012 15:31:49 +0530
Message-ID: <CAKohpom3cikKkwyMGSNu8sE+vTdcuFrMFNghmCHSHYpNMvr+=g@mail.gmail.com>
References: <d1f012d7bb2835f696fc100073f2eb16d9f6204d.1354128258.git.viresh.kumar@linaro.org>
	<33d71d9d29a3edd2c4a33e0f187cdb89f344af72.1354128258.git.viresh.kumar@linaro.org>
	<20121129093428.GV2013@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121129093428.GV2013@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: sameo@linux.intel.com, grant.likely@secretlab.ca, rabin.vincent@stericsson.com, shiraz.hashim@st.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, linus.walleij@linaro.org
List-Id: devicetree@vger.kernel.org

On 29 November 2012 15:04, Lee Jones <lee.jones@linaro.org> wrote:
> On Thu, 29 Nov 2012, Viresh Kumar wrote:
>
>> STMPE can confige
>
>             configure?
>
>> the way the device emits interrupts and till now this
>
>                                           until?

Ahh... Will fix them. This happens when you send patches at midnight. :)

>> diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c

>>               ret = devm_request_threaded_irq(ci->dev, stmpe->irq, NULL,
>> -                             stmpe_irq, pdata->irq_trigger | IRQF_ONESHOT,
>> -                             "stmpe", stmpe);
>> +                             stmpe_irq, IRQF_ONESHOT, "stmpe", stmpe);
>
> Forgive my ignorance, but you're no longer passing irq_trigger.
>
> Is this intentional? If so, why was it needed before and not now?

Yes, it was intentional. I thought it wasn't required at all. But my mind
is changing a bit now. I feel it is not required for DT, as trigger prop
is already passed in the interrupts cell. But for non-DT user, this is
still required. As there is not other way by which IRQ controller will
come to know what irq trigger type to enable for this irq line.

--
viresh
