From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 01/15] ARM: Introduce atomic MMIO modify
Date: Tue, 21 Jan 2014 10:45:21 +0100
Message-ID: <3512865.jTEvHVvFLA@wuerfel>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390295561-3466-2-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1390295561-3466-2-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Lior Amsalem <alior@marvell.com>, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Tawfik Bayouk <tawfik@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Wim Van Sebroeck <wim@iguana.be>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

On Tuesday 21 January 2014 06:12:27 Ezequiel Garcia wrote:
> Some SoC have MMIO regions that are shared across orthogonal
> subsystems. This commit implements a possible solution for the
> thread-safe access of such regions through a spinlock-protected API.
> 
> Concurrent access is protected with a single spinlock for the
> entire MMIO address space. While this protects shared-registers,
> it also serializes access to unrelated/unshared registers.
> 
> We add relaxed and non-relaxed variants, by using writel_relaxed and writel,
> respectively. The rationale for this is that some users may not require
> register write completion but only thread-safe access to a register.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

You add the new atomic mmio interfaces in an ARM global header file,
but at the same time make them ARM-only. I'm not opposed to having
interfaces like that, but I'm not convinced they are actually needed
for this case and if we go there, it needs to be done more carefully
and should be available for all architectures so that portable drivers
can use them.

It also seems to duplicate functionality that is already present in
regmap-mmio.

	Arnd
