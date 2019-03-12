From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 2/2] sifive: edac: Add EDAC driver for Sifive l2 Cache
 Controller
Date: Tue, 12 Mar 2019 09:31:43 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1903120927450.26459@viisi.sifive.com>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com> <1552382461-13051-3-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552382461-13051-3-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, bp@alien8.de, mchehab@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Yash,

On Tue, 12 Mar 2019, Yash Shah wrote:

> Add driver for the SiFive L2 cache controller
> on the HiFive Unleashed board

This should read "for the SiFive FU540-C000 chip" or something similar.  
The L2 cache controller is not specific to the HiFive Unleashed board.

Could you also please describe in your patch description:

1. what features this driver supports - in other words, why would it be 
used

2. and, if this driver was written based on any other drivers, please just 
briefly credit them.  For example, the use of the "teardown_*" function 
names suggest that this driver is at least partially based on
i10nm_base.c, skx_base.c, or pnd2_edac.c ?


thanks,

- Paul
