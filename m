From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 0/3] mtd: rawnand: denali: add new clocks and improve setup_data_interface
Date: Thu, 14 Jun 2018 16:29:59 +0900
Message-ID: <CAK7LNASoV9nHTFax1nD_8pvkEjTzXkFpDFRf_xuoOnPPf9K23A@mail.gmail.com>
References: <1528953067-24324-1-git-send-email-yamada.masahiro@socionext.com> <6557713.S7AzxIg9TS@blindfold>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6557713.S7AzxIg9TS@blindfold>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Weinberger <richard@sigma-star.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Boris Brezillon <boris.brezillon@bootlin.com>, Philipp Rosenberger <p.rosenberger@linutronix.de>, Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Richard,

2018-06-14 16:25 GMT+09:00 Richard Weinberger <richard@sigma-star.at>:
> Masahiro,
>
> Am Donnerstag, 14. Juni 2018, 07:11:04 CEST schrieb Masahiro Yamada:
>>
>> The ->setup_data_interface() hook needs to know the clock frequency.
>> In fact, this IP needs three clocks, bus "which clock?" is really
>> confusing.  (It is not described in the DT-binding at all.)
>>
>> This series adds more clocks.  In the new binding, three clocks
>> are required: core clock, bus interface clock, ECC engine clock.
>>
>> This series also takes care of the backward compatibility by
>> providing hardcoded values in case the new clocks are missing.
>> So, existing DT should work.
>>
>>
>> Changes in v2:
>>   - Split patches into sensible chunks
>>
>> Masahiro Yamada (3):
>>   mtd: rawnand: denali_dt: use dev as a shorthand of &pdev->dev
>>   mtd: rawnand: denali_dt: add more clocks based on IP datasheet
>>   mtd: rawnand: denali: optimize timing parameters for data interface
>
> This still means that we need to feed at least 2/3 and 3/3 into -stable to
> unbreak the driver.


3/3 is not mandatory.

You can only back-port 1/3 and 2/3.


3/3 is an optimization.
It will make the device access a little faster,
but you do not have to take it if you do not want to.




> I'd really prefer a single self-hosting fix that can go into -stable and then
> patches on top of the fix can prettify the driver.
>
> Thanks,
> //richard
>
> --
> sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
> ATU66964118 - FN 374287y
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
