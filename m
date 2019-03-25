From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] sifive: edac: Add EDAC driver for Sifive l2 Cache
 Controller
Date: Mon, 25 Mar 2019 22:47:31 +0100
Message-ID: <20190325214731.GT12016@zn.tnic>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-3-git-send-email-yash.shah@sifive.com>
 <20190312092842.GC28589@zn.tnic>
 <alpine.DEB.2.21.9999.1903241705460.8028@viisi.sifive.com>
 <20190325065453.GC12016@zn.tnic>
 <alpine.DEB.2.21.9999.1903251211190.8028@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1903251211190.8028@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Yash Shah <yash.shah@sifive.com>, linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, mchehab@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 25, 2019 at 02:18:39PM -0700, Paul Walmsley wrote:
> All of these drivers are for single IP blocks.  Mostly DRAM controllers.
> There's no "platform EDAC manager" IP block in these cases.

Maybe because they have RAS functionality in one single IP block. Others
like altera_edac, for example, have added support for more IP blocks
with time.

> So the EDAC "platform," if there is one, would be Xilinx Zynq, not
> Synopsys.

We have IP blocks sharing between drivers, see fsl_ddr_edac and
skx_common, for example.

> 2. We could create a platform driver for the "SiFive FU540-C000 EDAC"
> reporting platform that wouldn't map to any hardware block, but
> would call functions exported by other sources of EDAC data - most
> likely drivers living in separate directories. If, for example, we
> wind up using a Synopsys memory controller in a future product, we
> move the Synopsys code into a separate library, and move the Xilinx
> Zynq-specific code into a zynq_edac driver, etc.

Yes, librarizing is something we do already. So if you wanna share IP
blocks with other vendors, you can abstract it out into compilation
units like in the examples above. And then those compilation units can
be linked into a platform driver.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
