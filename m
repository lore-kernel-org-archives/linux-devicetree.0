From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH V6 00/25] Generic BMIPS kernel
Date: Tue, 24 Mar 2015 15:48:08 -0700
Message-ID: <5511E9A8.6090908@gmail.com>
References: <1419529760-9520-1-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419529760-9520-1-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>, ralf@linux-mips.org
Cc: jaedon.shin@gmail.com, abrestic@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, jogo@openwrt.org, arnd@arndb.de, computersforpeace@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 25/12/14 09:48, Kevin Cernekee wrote:
> V5->V6: Incorporate several fixes/enhancements from Jaedon Shin:
> 
>  - Fix register read/modify/write in RAC flush code.
> 
>  - Fix use of "SYS_HAS_CPU_BMIPS32_3300" Kconfig symbol.
> 
>  - Add base platform support for 7358 and 7362.
> 
> The DTS files follow Andrew Bresticker's new per-vendor directory layout.
> 
> This series applies on top of Linus' current head of tree.
> 
> Patch 01 (Fix outdated use of mips_cpu_intc_init()) is REQUIRED for 3.19
> to fix a build failure seen in 3.19-rc.  The other patches can
> be queued for 3.20 or later.

Jason, can you merge the irqchip patches through your tree? They still
apply cleanly to your irqchip/core branch as of today, except the last
one which has a small hunk to be fixed in drivers/irqchip/Makefile.

Thanks!
-- 
Florian
