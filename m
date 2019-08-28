From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 0/2] Update ethernet compatible string for SiFive
 FU540
Date: Wed, 28 Aug 2019 14:06:44 -0700 (PDT)
Message-ID: <20190828.140644.534529249197568915.davem@davemloft.net>
References: <1566882364-23891-1-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566882364-23891-1-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yash.shah@sifive.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, palmer@sifive.com, paul.walmsley@sifive.com, ynezz@true.cz, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

From: Yash Shah <yash.shah@sifive.com>
Date: Tue, 27 Aug 2019 10:36:02 +0530

> This patch series renames the compatible property to a more appropriate
> string. The patchset is based on Linux-5.3-rc6 and tested on SiFive
> Unleashed board

You should always base changes off of "net" or "net-next" and be explicitly
in your Subject lines which of those two trees your changes are for f.e.:

	Subject: [PATCH v2 net-next N/M] ...

> 
> Change history:
> Since v1:
> - Dropped PATCH3 because it's already merged
> - Change the reference url in the patch descriptions to point to a
>   'lore.kernel.org' link instead of 'lkml.org'

Series applied to 'net'.
