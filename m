From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 2/7] soc: davinci: new genpd driver
Date: Thu, 8 Feb 2018 10:54:49 +0100
Message-ID: <CAMRc=Mf+S3k_wfhUWEx2-39AZx1szkgy-u-bsZQUMiaY06UKww@mail.gmail.com>
References: <20180207134553.13510-1-brgl@bgdev.pl> <20180207134553.13510-3-brgl@bgdev.pl>
 <65f2690c-c605-3c66-9d8a-9a882aaf446d@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <65f2690c-c605-3c66-9d8a-9a882aaf446d@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

2018-02-08 10:30 GMT+01:00 Sekhar Nori <nsekhar@ti.com>:
> On Wednesday 07 February 2018 07:15 PM, Bartosz Golaszewski wrote:
>> +     /*
>> +      * DaVinci always uses a single clock for power-management. We assume
>> +      * it's the first one in the clocks property.
>> +      */
>> +     clk = of_clk_get(dev->of_node, 0);
>> +     if (IS_ERR(clk))
>> +             return PTR_ERR(clk);
>
> We already get this today with drivers/base/power/clock_ops.c once
> .con_ids list is dropped from pm_clk_notifier_block (which I think it
> should).
>
> If there is no reason to introduce thus functionality at this stage,
> perhaps we should wait till such a time when its clearly needed?
>
> Thanks,
> Sekhar

If I understand correctly: once we drop the con_ids list, we end up
calling clk_get(dev, NULL) from pm_clk_acquire(), which matches
against the clock with NULL con_id, which may not necessarily be the
first clock in the list.

I'm working on extending the psc driver with the power-domain code (as
suggested by David), which should be much smaller and simplier - how
about that?

Thanks,
Bartosz
