From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 11/12] ARM: mvebu: Relocate Armada 370 PCIe device tree
 nodes
Date: Tue, 18 Jun 2013 18:29:35 +0200
Message-ID: <201306181829.35514.arnd@arndb.de>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1371554737-25319-12-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1371554737-25319-12-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 18 June 2013, Ezequiel Garcia wrote:
> +                       ranges =
> +                              <0x82000000 0 0x40000    0xffff0001 0x40000 0 0x00002000
> +                               0x82000000 0 0x80000    0xffff0001 0x80000 0 0x00002000
> +                               0x82000000 0 0xe0000000 0xffff0002 0          0 0x08000000
> +                               0x81000000 0 0          0xffff0002 0x8000000  0 0x00100000>;

To clarify my earlier comment, I think it would be nicer to write this as

                       ranges =
                              <0x82000000 0 0x40000    0xffff0001 0x40000 0 0x00002000
                               0x82000000 0 0x80000    0xffff0001 0x80000 0 0x00002000
                               0x82000000 1 0 MBUS_ID(0x12, 0x34) 0  1 0
                               0x82000000 2 0 MBUS_ID(0x13, 0x34) 0  1 0
                               0x81000000 1 0 MBUS_ID(0x12, 0x35) 0 0 0x10000;
                               0x81000000 2 0 MBUS_ID(0x13, 0x35) 0 0 0x10000>;

The MBUS_ID numbers above are made up since I don't know them, but this way you can
describe how the entire 4GB MMIO address space of the PCI bus is mapped into the
MBUS address space.

> +                       pcie@1,0 {
> +                               device_type = "pci";
> +                               assigned-addresses = <0x82000800 0 0x40000 0 0x2000>;
> +                               reg = <0x0800 0 0 0 0>;
> +                               #address-cells = <3>;
> +                               #size-cells = <2>;
> +                               #interrupt-cells = <1>;
> +                               ranges;

Then you do a ranges property for each port with the high-order
address word equal to the port number:

                     ranges = <0x82000000 1 0 0x82000000 0 0 1 0
                               0x81000000 1 0 0x81000000 0 0 0 0x10000>;


> +                               interrupt-map-mask = <0 0 0 0>;
> +                               interrupt-map = <0 0 0 0 &mpic 58>;
> +                               marvell,pcie-port = <0>;
> +                               marvell,pcie-lane = <0>;
> +                               clocks = <&gateclk 5>;
> +                               status = "disabled";
> +                       pcie@2,0 {
> +                               device_type = "pci";
> +                               assigned-addresses = <0x82002800 0 0x80000 0 0x2000>;
> +                               reg = <0x1000 0 0 0 0>;
> +                               #address-cells = <3>;
> +                               #size-cells = <2>;
> +                               #interrupt-cells = <1>;
> +                               ranges;

                     ranges = <0x82000000 2 0 0x82000000 0 0 1 0
                               0x81000000 2 0 0x81000000 0 0 0 0x10000>;

> +                               interrupt-map-mask = <0 0 0 0>;
> +                               interrupt-map = <0 0 0 0 &mpic 62>;
> +                               marvell,pcie-port = <1>;
> +                               marvell,pcie-lane = <0>;
> +                               clocks = <&gateclk 9>;
> +                               status = "disabled";
> +                       };

Does this make sense?

	Arnd
