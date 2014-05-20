From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] ARM: shmobile: r8a7791: add internal PCI bridge
 nodes
Date: Tue, 20 May 2014 10:04:13 +0200
Message-ID: <5095898.2pUCzGkcW7@wuerfel>
References: <201405200148.28683.sergei.shtylyov@cogentembedded.com>
 <201405200152.06575.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201405200152.06575.sergei.shtylyov@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-sh@vger.kernel.org, magnus.damm@gmail.com, robh+dt@kernel.org, horms@verge.net.au, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 20 May 2014 01:52:05 Sergei Shtylyov wrote:
> +               interrupt-map-mask = <0xff00 0 0 0x7>;
> +               interrupt-map = <0x0000 0 0 1 &gic 0 108 IRQ_TYPE_LEVEL_HIGH
> +                                0x0800 0 0 1 &gic 0 108 IRQ_TYPE_LEVEL_HIGH
> +                                0x1000 0 0 2 &gic 0 108 IRQ_TYPE_LEVEL_HIGH>;

Are there only internal devices on this PCI host?

If there are slots, the map should normally list all four interrupts
per slot in some way.

	Arnd
