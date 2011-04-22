From: "Steven A. Falco" <sfalco-7/gz0mrWfc7QT0dZR+AlfA@public.gmane.org>
Subject: [Question] PCIe bridge representation
Date: Fri, 22 Apr 2011 12:57:31 -0400
Message-ID: <4DB1B37B.90806@harris.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

I have a custom embedded board using the PPC405EX.  On one of the PCIe
controllers, there is a PLX PCIe switch (PEX8613).  Downstream from that
are two ASICs.

When I attempt to load the driver for the ASICs, I get an error:

0001:43:00.0: device not available because of BAR 0 [0xa1000000-0xa1ffffff] collisions

My device tree is basically copied from the Kilauea evaluation board.
The ranges property for the host bridge is:

ranges = <0x02000000 0x00000000 0x80000000 0x90000000 0x00000000 0x10000000
          0x01000000 0x00000000 0x00000000 0xe8010000 0x00000000 0x00010000>;

The strange thing is, the ASICs should be assigned addresses in the
0x90000000 space, not 0xa1000000.

So I'm wondering if I need something explicit in the device tree to
describe the PCIe switch, and possibly the ASICs as well.

I'll note in passing that a previous custom board we built used a PCI bridge
chip instead of the PCIe switch.  On that board, nothing special was needed.
The addresses were allocated in 0x90000000 as expected.

	Steve

-- 
A: Because it makes the logic of the discussion difficult to follow.
Q: Why shouldn't I top post?
A: No.
Q: Should I top post?
