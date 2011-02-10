From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH OF 07/14] of: move of_irq_map_pci() into generic code
Date: Thu, 10 Feb 2011 14:57:21 +0100
Message-ID: <4D53EEC1.5020101@monstr.eu>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de> <1295843342-1122-8-git-send-email-bigeasy@linutronix.de>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1295843342-1122-8-git-send-email-bigeasy@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, sodaville@linutronix.de, x86@kernel.org, devicetree-discuss@lists.ozlabs.org, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

Sebastian Andrzej Siewior wrote:
> From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
> 
> There is a tiny difference between PPC32 and PPC64. Microblaze uses the
> PPC32 variant.
> 
> Cc: devicetree-discuss@lists.ozlabs.org
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>

> ---
>  arch/microblaze/include/asm/pci-bridge.h |   12 ++++
>  arch/microblaze/include/asm/prom.h       |   15 -----
>  arch/microblaze/kernel/prom_parse.c      |   77 ---------------------------
>  arch/microblaze/pci/pci-common.c         |    1 +

Please always CC me for Microblaze changes. I want to at least compile it.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
