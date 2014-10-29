From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 04/11] irqchip: Remove ARM dependency for bcm7120-l2 and brcmstb-l2
Date: Wed, 29 Oct 2014 08:44:06 +0100
Message-ID: <2058619.ZZgjsUZogD@wuerfel>
References: <1414555138-6500-1-git-send-email-cernekee@gmail.com> <1414555138-6500-4-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414555138-6500-4-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Tuesday 28 October 2014 20:58:51 Kevin Cernekee wrote:
> This can compile for MIPS (or anything else) now.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> 

It's a silent symbol, so the dependency is obviously not needed,

Acked-by: Arnd Bergmann <arnd@arndb.de>
