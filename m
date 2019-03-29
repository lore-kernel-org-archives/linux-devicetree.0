From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 2/2] edac: sifive: Add EDAC driver for SiFive FU540-C000
 chip
Date: Fri, 29 Mar 2019 12:45:33 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1903291236060.6637@viisi.sifive.com>
References: <1553082728-9232-1-git-send-email-yash.shah@sifive.com> <1553082728-9232-3-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553082728-9232-3-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-edac@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, Yash Shah <yash.shah@sifive.com>, james.morse@arm.com, palmer@sifive.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, bp@alien8.de, mchehab@kernel.org, devicetree@vger.kernel.org, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On Wed, 20 Mar 2019, Yash Shah wrote:

> This EDAC driver supports:
> - Initial configuration reporting on bootup via debug logs
> - ECC event monitoring and reporting through the EDAC framework
> - ECC event injection
> 
> This driver is partially based on pnd2_edac.c and altera_edac.c
> 
> Initially L2 Cache controller is added as a subcomponent to
> this EDAC driver.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Based on the discussion with Borislav, we're going to move the L2 driver 
elsewhere in the tree.  We'll look into creating a platform-specific EDAC 
driver on top of that.


- Paul
