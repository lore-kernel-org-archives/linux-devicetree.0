From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3] ARM: dts: mvebu: add support for Linksys WRT3200ACM
 (Rango)
Date: Wed, 24 May 2017 14:41:11 +0200
Message-ID: <20170524124111.GA24341@lunn.ch>
References: <20170524061647.4238-1-ralph.sennhauser@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170524061647.4238-1-ralph.sennhauser@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 24, 2017 at 08:16:46AM +0200, Ralph Sennhauser wrote:
> The Linksys WRT3200ACM (Rango) is the lates Armada-385 based router in
> the Linksys WRT AC Series which got released in October 2016.
> 
> Key differences to the earlier Armada-385 based devices in the series is
> a bigger flash chip, next generation wireless modules (Marvell 88W8964)
> in the mini pcie slots as well as a Marvell SD8887. Finally the CPU is
> clocked at 1866 GHz by default.
> 
> The file armada-385-linksys-rango.dts is loosly based off of a DTS
> authored by Imre Kaloz.
> 
> As Rango is part of the armada-385-linksys family of boards use the
> armada-385-linksys.dtsi as basis. As for functional differences to Imre
> Kaloz dts, the wlan LEDs aren't connected to the expander chip pca9635
> but directly to GPIOs. Then mpp47 controls the USB2.0 port and not the
> USB3.0 port, so use the correct GPIO mpp44 for it. Finally use
> non-removable instead of broken-cd with the sdhci node to avoid polling.
> 
> Other changes can be categorized as just cleanup / reorganization due to
> using the armada-385-linksys.dtsi.
> 
> URL: https://github.com/openwrt/openwrt/blob/0abc3fa5a996daf7dafdc7794ccfe3fa7e955c5a/target/linux/mvebu/files/arch/arm/boot/dts/armada-385-linksys-rango.dts
> Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
