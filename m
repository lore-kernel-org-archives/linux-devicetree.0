From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: dts: uniphier: add /memreserve/ for spin-table
 release address
Date: Mon, 18 Apr 2016 10:04:16 +0100
Message-ID: <20160418090415.GB21438@leverpostej>
References: <1460743138-17768-1-git-send-email-yamada.masahiro@socionext.com>
 <20160418084508.GA21438@leverpostej>
 <CAK7LNATtWyZtVWrW3nOYjN=aRvCO1w8Rvr6_JWm3QfMMPhrSAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK7LNATtWyZtVWrW3nOYjN=aRvCO1w8Rvr6_JWm3QfMMPhrSAQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: arm@kernel.org, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 18, 2016 at 05:55:14PM +0900, Masahiro Yamada wrote:
> 2016-04-18 17:45 GMT+09:00 Mark Rutland <mark.rutland@arm.com>:
> > I take it that the code for the spin-table is not in RAM, and does not
> > need to be protected similarly?
> 
> I use U-Boot to boot Linux for this board.
> 
> The code for the spin-table is on SDRAM, and not protected.
> 
> I already recognize this problem.
> 
> The difficulty for U-Boot is that
> U-Boot relocates itself to the top of the DRAM.
> So, it is difficult to predict
> where the code will be placed.
> 
> I will discuss this issue in the U-Boot ML.

Ok, please do.

> So, My current solution is pre-fetch the code for the spin-table onto
> I-cache.

As you are probably aware, this is incredibly unsafe, and very likely to
go wrong. Nothing guarantees that (stale) entries remain in the I-cache.

I would very much advise fixing this ASAP.

Thanks,
Mark.
