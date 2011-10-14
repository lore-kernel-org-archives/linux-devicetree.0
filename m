From: "Robert Sciuk" <robert.sciuk-AJFDzwRlY/g@public.gmane.org>
Subject: P4080 device tree problems with fsl dpaa ...
Date: Fri, 14 Oct 2011 17:26:34 -0400
Message-ID: <2DD52030B5146141BEB762A11AE97C4CF6E0E6@SPQCEXC05.exfo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
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

I've just joined the list, and I hope that this is not an inappropriate
question, but I'm looking for some direction with respect to device
trees, and the fsl, dpaa Ethernet drivers.

I'm wondering if anyone has had any experience with the FreeScale DPAA
drivers for the 1g dtsec interface.  We are getting interfaces defined,
and the tx count increases, but we are not seeing packets on the "wire".

...
[    0.911592] Freescale FM module (Oct 13 2011:14:41:07)
[    0.916745] cpu6/6: fsl_mac: FSL FMan MAC API based driver ()
[    0.923077] cpu6/6: fsl_mac: ffe4e0000.ethernet: FMan dTSEC version:
0x08240101
[    0.930403] cpu6/6: fsl_mac: ffe4e0000.ethernet: FMan MAC address:
00:a0:a9:be:ef:10
...
[    1.015863] cpu6/6: fsl_dpa: FSL DPAA Ethernet driver ()
[    1.021446] cpu6/6: fsl_dpa: ethernet.23:
dpaa_eth.c:1684:dpa_bp_create() eth%d: Using private BM buffer pools
[    1.032263] cpu6/6: Using dynamic RX QM frame queues
[    1.037242] cpu6/6: Using dynamic TX QM frame queues
[    1.042263] cpu6/6: > WARNING (FM)
[/export2/rd2/dev/robsci1/Work/gold/wr4linux-layer/obj/hotwire1/hotwire1
/build/linux/drivers/n
et/dpa/NetCommSw/Peripherals/FM/fm.c:911 FmGetSetPortParams]:
[    1.059138] cpu6/6: FIFO size enlarged to 11008
[    1.063670] cpu6/6:
[    1.066672] cpu6/6: fsl_dpa: ethernet.23:
dpaa_eth.c:2327:dpaa_oh_probe() no OH port bindings on node
/fsl,dpaa/ethernet@0
[    1.077806] cpu6/6: fsl_dpa: ethernet.24:
dpaa_eth.c:1684:dpa_bp_create() eth%d: Using private BM buffer pools
[    1.087826] cpu6/6: Using dynamic RX QM frame queues
[    1.092798] cpu6/6: Using dynamic TX QM frame queues
...

Our device tree defines the top level Ethernet as:
ethernet@0 {
 compatible = "fsl,p4080?dpa?ethernet", "fsl,dpa?ethernet";
 fsl,qman?channel = <0x13>; 
 fsl,fman?mac = <0x50>;
};

And the mac and phys are defined as follows:

ethernet@e0000 {
 cell?index = <0x0>;
 compatible = "fsl,p4080?fman?1g?mac", "fsl,fman?1g?mac";
 reg = <0xe0000 0x1000>;
 fsl,port?handles = <0x22 0x23>;
 tbi?handle = <0x24>;
 phy?handle = <0x25>;
 phy?connection?type = "sgmii";
 ptimer?handle = <0x26>;
 linux,phandle = <0x50>;
};
mdio@e1120 {
 #address?cells = <0x1>;
 #size?cells = <0x0>;
 compatible = "fsl,fman?mdio";
 reg = <0xe1120 0xee0>;
 interrupts = <0x64 0x1 0x0 0x0>;
 gpios = <0x27 0x0 0x0 0x27 0x1 0x0>;
 linux,phandle = <0x28>;
 tbi?phy@8 {
  reg = <0x8>;
  device_type = "tbi?phy";
  linux,phandle = <0x24>;
 };
 phy0: ethernet?phy@0 {
  device_type="ethernet?phy";
  compatible="broadcom,BCM5482";
  reg = <0>;
  linux,phandle = <0x25>;
 };
};


I have no idea what an OH binding is, what it might look like, and what
it entails, but I think that it might be a significant factor in our not
seeing a working interface.  Has anyone any experience with dpaa device
trees, and configuration?  Any pointers?  Any docs? Shots in the dark? 

Robert Sciuk
Senior Designer, R&D.
905.738.3741 xt 22621
