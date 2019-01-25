From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6] arm64: dts: marvell: Add device tree for uDPU board
Date: Fri, 25 Jan 2019 19:06:00 +0100
Message-ID: <20190125180600.GE22211@lunn.ch>
References: <20190125171707.27742-1-vladimir.vid@sartura.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190125171707.27742-1-vladimir.vid@sartura.hr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vladimir Vid <vladimir.vid@sartura.hr>
Cc: devicetree@vger.kernel.org, Luis Torres <luis.torres@methode.com>, Jason Cooper <jason@lakedaemon.net>, Paul Arola <paul.arola@telus.com>, Gregory Clement <gregory.clement@bootlin.com>, Scott Roberts <scott.roberts@telus.com>, Luka Perkov <luka.perkov@sartura.hr>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 25, 2019 at 06:17:08PM +0100, Vladimir Vid wrote:
> This adds initial support for micro-DPU (uDPU) board which is based on
> Armada-3720 SoC.  micro-DPU is the single-port FTTdp distribution point
> unit made by Methode Electronics which offers complete modularity with
> replaceable SFP modules both for uplink and downlink (G.hn over
> twisted-pair, G.hn over coax, 1G and 2.5G Ethernet over Cat-5e cable).
> 
> On-board features:
> - 512 MiB DDR3
> - 2 x 2.5G SFP via HSGMII SERDES interface to the A3720 SoC
> - USB 2.0 Type-C connector
> - 4GB eMMC
> - ETSI TS 101548 reverse powering via twisted pair (RJ45) or coax (F Type)
> 
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Luis Torres <luis.torres@methode.com>
> Cc: Scott Roberts <scott.roberts@telus.com>
> Cc: Paul Arola <paul.arola@telus.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Gregory Clement <gregory.clement@bootlin.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Vladimir Vid <vladimir.vid@sartura.hr>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
