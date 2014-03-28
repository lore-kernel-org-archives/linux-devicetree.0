From: "Gupta, Pekon" <pekon@ti.com>
Subject: RE: [PATCH RFC 1/3] Devicetree: Add pl353 smc controller devicetree
 binding information
Date: Fri, 28 Mar 2014 08:58:23 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB952B@DBDE04.ent.ti.com>
References: <1395944467-26291-1-git-send-email-punnaia@xilinx.com>
 <05521479-afd6-4c52-afbb-ef3fe2dafd18@CH1EHSMHS001.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <05521479-afd6-4c52-afbb-ef3fe2dafd18@CH1EHSMHS001.ehs.local>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "rob@landley.net" <rob@landley.net>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>, "arnd@arndb.de" <arnd@arndb.de>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>, "jussi.kivilinna@iki.fi" <jussi.kivil>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kalluripunnaiahchoudary@gmail.com" <kalluripunnaiahchoudary@gmail.com>, "kpc528@gmail.com" <kpc528@gmail.com>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

>From: Punnaiah Choudary Kalluri [mailto:punnaiah.choudary.kalluri@xilinx.com]
>
>Add pl353 static memory controller devicetree binding information.
>
>Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
>---
> .../bindings/memory-controllers/pl353-smc.txt      |   53 ++++++++++++++++++++
> 1 files changed, 53 insertions(+), 0 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
>
>diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-
>controllers/pl353-smc.txt
>new file mode 100644
>index 0000000..623c1c6
>--- /dev/null
>+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
>@@ -0,0 +1,53 @@
>+Device tree bindings for ARM PL353 static memory controller
>+
>+PL353 static memory controller supports two kinds of memory
>+interfaces.i.e NAND and SRAM/NOR interfaces.
>+The actual devices are instantiated from the child nodes of pl353 smc node.
>+
>+Required properties:
>+- compatible		: Should be "arm,pl353-smc-r2p1"
>+- reg			: Controller registers map and length.
>+- clock-names		: List of input clock names - "ref_clk", "aper_clk"
>+			  (See clock bindings for details).
>+- clocks		: Clock phandles (see clock bindings for details).
>+- address-cells	: Address cells, must be 1.
>+- size-cells		: Size cells. Must be 1.
>+
>+Child nodes:
>+ For NAND the "arm,pl353-nand-r2p1" and for NOR the "cfi-flash" drivers are
>+supported as child nodes.
>+
>+Mandatory timing properties for child nodes:
>+- arm,nand-cycle-t0	: Read cycle time(t_rc).
>+- arm,nand-cycle-t1	: Write cycle time(t_wc).
>+- arm,nand-cycle-t2	: re_n assertion delay(t_rea).
>+- arm,nand-cycle-t3	: we_n de-assertion delay(t_wp).
>+- arm,nand-cycle-t4	: Status read time(t_clr)
>+- arm,nand-cycle-t5	: ID read time(t_ar)
>+- arm,nand-cycle-t6	: busy to re_n(t_rr)
>+

It would be good to have DT-bindings with meaningful names,
and suffixed with timing units like "ns" | "ps".
Also, as many of these timing parameters are common across NAND device
vendors, so why not get them added to  generic NAND bindings list.
	Documentation/devicetree/bindings/mtd/nand.txt

Another driver using similar bindings for NAND device timings
	[RFC 13/47] mtd: nand: stm_nand_bch: provide Device Tree support
	http://lists.infradead.org/pipermail/linux-mtd/2014-March/052890.html


with regards, pekon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
