From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 11/11] irqchip: Decouple bcm7120-l2 from brcmstb-l2
Date: Wed, 29 Oct 2014 08:55:30 +0100
Message-ID: <2809323.IhySeFJxgA@wuerfel>
References: <1414555138-6500-1-git-send-email-cernekee@gmail.com> <1414555138-6500-11-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414555138-6500-11-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Tuesday 28 October 2014 20:58:58 Kevin Cernekee wrote:
> Some chips, such as BCM6328, only require the former driver.  Some
> BCM7xxx STB configurations only require the latter driver.  Treat them
> as two separate entities, and update the mach-bcm dependencies to
> reflect the change.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

	Arnd
