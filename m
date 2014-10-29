From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 08/11] irqchip: bcm7120-l2: Fix missing nibble in gc->unused mask
Date: Wed, 29 Oct 2014 08:47:29 +0100
Message-ID: <1877870.yMDyCEjdc0@wuerfel>
References: <1414555138-6500-1-git-send-email-cernekee@gmail.com> <1414555138-6500-8-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414555138-6500-8-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Tuesday 28 October 2014 20:58:55 Kevin Cernekee wrote:
> This mask should have been 0xffff_ffff, not 0x0fff_ffff.
> 
> The change should not have an effect on current users (STB) because bits
> 31:27 are unused.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>
