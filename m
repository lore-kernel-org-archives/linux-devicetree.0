From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 0/3] mtd: rawnand: denali: add new clocks and improve setup_data_interface
Date: Thu, 14 Jun 2018 20:31:59 +0900
Message-ID: <CAK7LNARfnTtESsVdUtvreLh50+awtL42nCLY9tHzbp2UN2kpBw@mail.gmail.com>
References: <1528953067-24324-1-git-send-email-yamada.masahiro@socionext.com>
 <6557713.S7AzxIg9TS@blindfold> <CAK7LNASoV9nHTFax1nD_8pvkEjTzXkFpDFRf_xuoOnPPf9K23A@mail.gmail.com>
 <20180614093835.5c3bf426@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180614093835.5c3bf426@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Brian Norris <computersforpeace@gmail.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Philipp Rosenberger <p.rosenberger@linutronix.de>, Richard Weinberger <richard@sigma-star.at>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,

2018-06-14 16:38 GMT+09:00 Boris Brezillon <boris.brezillon@bootlin.com>:
> On Thu, 14 Jun 2018 16:29:59 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Hi Richard,
>>
>> 2018-06-14 16:25 GMT+09:00 Richard Weinberger <richard@sigma-star.at>:
>> > Masahiro,
>> >
>> > Am Donnerstag, 14. Juni 2018, 07:11:04 CEST schrieb Masahiro Yamada:
>> >>
>> >> The ->setup_data_interface() hook needs to know the clock frequency.
>> >> In fact, this IP needs three clocks, bus "which clock?" is really
>> >> confusing.  (It is not described in the DT-binding at all.)
>> >>
>> >> This series adds more clocks.  In the new binding, three clocks
>> >> are required: core clock, bus interface clock, ECC engine clock.
>> >>
>> >> This series also takes care of the backward compatibility by
>> >> providing hardcoded values in case the new clocks are missing.
>> >> So, existing DT should work.
>> >>
>> >>
>> >> Changes in v2:
>> >>   - Split patches into sensible chunks
>> >>
>> >> Masahiro Yamada (3):
>> >>   mtd: rawnand: denali_dt: use dev as a shorthand of &pdev->dev
>> >>   mtd: rawnand: denali_dt: add more clocks based on IP datasheet
>> >>   mtd: rawnand: denali: optimize timing parameters for data interface
>> >
>> > This still means that we need to feed at least 2/3 and 3/3 into -stable to
>> > unbreak the driver.
>>
>>
>> 3/3 is not mandatory.
>>
>> You can only back-port 1/3 and 2/3.
>
> Well, patch 1 is not a fix, can we move it after patch 2 so that only
> patch 2 is flagged with the Fixes+Cc-stable tags?


OK, will do that.

If you try to port this back to v4.14.*
you need to fix-up the file path
since the driver did not reside in the raw/ sub-directory at that time.


Except that, I do not see backport issue.




> Thanks,
>
> Boris
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Best Regards
Masahiro Yamada
