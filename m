From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 2/5] mtd: mtdpart: Do not fail mtd probe when parsing
 partitions fails.
Date: Mon, 26 Oct 2015 18:44:48 -0700
Message-ID: <20151027014448.GN13239@google.com>
References: <cover.1439911625.git.hramrach@gmail.com>
 <97366073dfe93b478f24e2fc30ca818326906e0a.1439911625.git.hramrach@gmail.com>
 <20151011200347.GD3696@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151011200347.GD3696@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Suchanek <hramrach@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 11, 2015 at 01:03:47PM -0700, Brian Norris wrote:
> All in all, I think my suggestions would look something like the
> following alternative patch. I haven't tested it yet.
> 
> Brian
> 
> (git-format-patch pasted below)
> 
> From 53b60f31a2a0f2a7e8220a4aff47457248bccbcf Mon Sep 17 00:00:00 2001
> From: Brian Norris <computersforpeace@gmail.com>
> Date: Sun, 11 Oct 2015 10:25:23 -0700
> Subject: [PATCH] mtd: mtdpart: Do not fail mtd probe when parsing partitions
>  fails.
> 
> Due to wrong assumption in ofpart ofpart fails on Exynos on SPI chips
> with no partitions because the subnode containing controller data
> confuses the ofpart parser.
> 
> Thus compiling in ofpart support automatically fails probing any SPI NOR
> flash without partitions on Exynos.
> 
> Compiling in a partitioning scheme should not cause probe of otherwise
> valid device to fail.
> 
> Instead, let's do the following:
>  * try parsers until one succeeds
>  * if no parser succeeds, report the first error we saw
>  * even in the failure case, allow MTD to probe, with fallback
>    partitions or no partitions at all -- the master device will still be
>    registered
> 
> Issue report and comments initially by Michal Suchanek.
> 
> Reported-by: Michal Suchanek <hramrach@gmail.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/mtdcore.c |  6 ++++--
>  drivers/mtd/mtdpart.c | 14 ++++++++++----
>  2 files changed, 14 insertions(+), 6 deletions(-)

Tested, and applied this version to l2-mtd.git
