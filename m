From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 1/3] RISC-V: Add DT documentation for SiFive L2 Cache
 Controller
Date: Thu, 18 Apr 2019 14:40:42 +0200
Message-ID: <20190418124042.GH27160@zn.tnic>
References: <1555328443-30874-1-git-send-email-yash.shah@sifive.com>
 <1555328443-30874-2-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1555328443-30874-2-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com, mchehab@kernel.org, james.morse@arm.com, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On Mon, Apr 15, 2019 at 05:10:41PM +0530, Yash Shah wrote:
> This patch adds device tree bindings for SiFive FU540 L2 cache controller
> driver

Avoid having "This patch" or "This commit" in the commit message. It is
tautologically useless.

Also, do

$ git grep 'This patch' Documentation/process

for more details.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
