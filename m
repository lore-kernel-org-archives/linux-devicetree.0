From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] edac: sifive: Add EDAC driver for SiFive FU540-C000
 chip
Date: Mon, 25 Mar 2019 22:50:05 +0100
Message-ID: <20190325215005.GU12016@zn.tnic>
References: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
 <1553082728-9232-3-git-send-email-yash.shah@sifive.com>
 <alpine.DEB.2.21.9999.1903241558210.8028@viisi.sifive.com>
 <20190325065737.GD12016@zn.tnic>
 <alpine.DEB.2.21.9999.1903251418440.8028@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1903251418440.8028@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Yash Shah <yash.shah@sifive.com>, linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, mchehab@kernel.org, devicetree@vger.kernel.org, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 25, 2019 at 02:26:52PM -0700, Paul Walmsley wrote:
> We'll definitely take the RAM savings that a few #ifdefs will deliver to 
> us.  They add up.  We're selling chips for embedded use cases, not just 
> big-iron x86 systems.

Fair enough.

Btw, while we're at it, this driver would need a MAINTAINERS entry so
that you guys can get CCed on bugs.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
