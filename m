From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/11] irqchip: bcm7120-l2: Use irq_reg_* accessors
Date: Wed, 29 Oct 2014 08:46:27 +0100
Message-ID: <1863628.skWLaDFD15@wuerfel>
References: <1414555138-6500-1-git-send-email-cernekee@gmail.com> <1414555138-6500-6-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414555138-6500-6-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Tuesday 28 October 2014 20:58:53 Kevin Cernekee wrote:
> This keeps things consistent between the "core" bcm7120-l2 driver and the
> helpers in generic-chip.c.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> ---
> 

Ah, you did. Nevermind my comment to patch 5 then ;-)

Acked-by: Arnd Bergmann <arnd@arndb.de>
