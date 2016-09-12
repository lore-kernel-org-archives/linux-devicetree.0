From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/8 v2] arm: orion5x: Add DT-based support for Netgear
 WNR854T
Date: Mon, 12 Sep 2016 12:06:25 -0500
Message-ID: <20160912170625.GA7420@rob-hp-laptop>
References: <1472203264-21089-7-git-send-email-jm@lentin.co.uk>
 <1473109646-23366-1-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1473109646-23366-1-git-send-email-jm@lentin.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jamie Lentin <jm@lentin.co.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, devicetree@vger.kernel.org, Gregory Clement <gregory.clement@free-electrons.com>, Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 05, 2016 at 10:07:26PM +0100, Jamie Lentin wrote:
> This is a router based on the mv88f5181 chipset.
> 
> http://www.netgear.com/support/product/WNR854T.aspx
> http://wiki.openwrt.org/toh/netgear/wnr854t
> 
> Signed-off-by: Jamie Lentin <jm@lentin.co.uk>
> ---
> This removes the contentious vendor partitioning scheme and goes back
> to the original partitioning scheme used in non-DT ports to this board.
> Using the same partitioning scheme should mean less surprises for
> someone trying to upgrade their router.
> 
> The non-DT PCI setup is still here, as there are other orion5x DT boards
> doing very similar things, and can all be converted at the same time.

If we keep accepting this duplicated, legacy PCI setup, who is going to 
be motivated to clean things up. But it's ultimately up to Arnd and 
Olof.

 
> The patchset in it's entirety is available at
> https://github.com/lentinj/linux wnr854t-support-v2
> 
> Cheers,
> ---
>  .../bindings/arm/marvell/marvell,orion5x.txt       |   1 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/orion5x-netgear-wnr854t.dts      | 197 +++++++++++++++++++++

Acked-by: Rob Herring <robh@kernel.org>

>  arch/arm/mach-orion5x/Kconfig                      |   6 +
>  arch/arm/mach-orion5x/Makefile                     |   1 +
>  arch/arm/mach-orion5x/board-wnr854t.c              |  78 ++++++++
>  6 files changed, 284 insertions(+)
>  create mode 100644 arch/arm/boot/dts/orion5x-netgear-wnr854t.dts
>  create mode 100644 arch/arm/mach-orion5x/board-wnr854t.c
