From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] mtd: nand: denali: allow to override max_banks from DT property
Date: Sat, 2 Apr 2016 14:16:10 +0900
Message-ID: <CAK7LNASWa-8Ag5azvQS+TT3nkXoeHFxmvJF0XDm4nTULb1vE+A@mail.gmail.com>
References: <1459218787-15197-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459218787-15197-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Graham Moore <grmoore@opensource.altera.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Kumar Gala <galak@codeaurora.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>, David Woodhouse <dwmw2@infradead.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

2016-03-29 11:33 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Commit 271707b1d817 ("mtd: nand: denali: max_banks calculation
> changed in revision 5.1") supported the new encoding of the "n_banks"
> bits of the "features" register, but there is an unfortunate case
> not covered by that commit.
>
> Panasonic (its System LSI Business Division is now Socionext) bought
> a couple of versions of this IP.  The IP released for Panasonic
> around Feb. 2012 is revision 5 and uses the old encoding for n_banks
> (2 << n_banks).  While the one released around Nov. 2012 is also
> revision 5, but it uses the new encoding (1 << n_banks).
>
> The revision register cannot distinguish these two incompatible
> hardware.  I guess this IP series is not well-organized.  I could not
> find any solution but giving max_banks from DT property.
>
> This commit works around the problem by allowing DT to set the
> max_banks forcibly.  Of course, this DT property can be optional if
> the auto detection based on the hardware registers works well.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Rob Herring <robh@kernel.org>


Looks like we should take our time for discussion
to find out which is better, a new compatible string or a new DT property.

The discussion is happening in v1 thread.
http://patchwork.ozlabs.org/patch/601562/

Please hold back applying this patch.



-- 
Best Regards
Masahiro Yamada
