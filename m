From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: PCI device bindings - Help needed
Date: Wed, 6 Mar 2013 17:17:06 -0500
Message-ID: <5137C062.5020208@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4264228269766362790=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "Chemparathy, Cyril" <cyril-l0cyMroinI0@public.gmane.org>
Cc: device-tree <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============4264228269766362790==
Content-Type: multipart/alternative;
	boundary="------------080906040007050208000000"

--------------080906040007050208000000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Grant,

I am developing a PCI Host driver for Keystone devices. I am trying to 
understand how the device bindings work for PCI Root Complex (RC) Host 
controller and corresponding  devices on the bus. There are no DT based 
implementation I can find for the ARM architecture. I have seen some 
patches posted by Nvidia for Tegra processors. Trying to understand how 
I write bindings for the host controller,  the interrupt mappings and 
the driver to parse these bindings.

Address start /Size information from the device spec is given below.

                        0x21800000 0x8000            /* pcie-regs */
                        0x50000000 0x10000000   /* pcie-nonprefetch 
memory */
                        0x70000000 0x4000            /* pcie-io */
                        0x80000000 0x20000000>; /* pcie-inbound0 */

Need 1:1 mapping between the Root complex address space and the PCI 
memory address space. In the above it is starting at address 0x50000000 
and size 0x10000000. I see following bindings from a power PC dts file 
(powerpc/boot/dts/mpc8541cds.dts)

         pci1: pci@e0009000 {
                 interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
                 interrupt-map = <

                         /* IDSEL 0x15 */
                         0xa800 0x0 0x0 0x1 &mpic 0xb 0x1
                         0xa800 0x0 0x0 0x2 &mpic 0xb 0x1
                         0xa800 0x0 0x0 0x3 &mpic 0xb 0x1
                         0xa800 0x0 0x0 0x4 &mpic 0xb 0x1>;
                 interrupt-parent = <&mpic>;
                 interrupts = <25 2>;
                 bus-range = <0 0>;
                 ranges = <0x2000000 0x0 0xa0000000 0xa0000000 0x0 
0x20000000
                           0x1000000 0x0 0x0 0xe3000000 0x0 0x100000>;
                 clock-frequency = <66666666>;
                 #interrupt-cells = <1>;
                 #size-cells = <2>;
                 #address-cells = <3>;
                 reg = <0xe0009000 0x1000>;
                 compatible = "fsl,mpc8540-pci";
                 device_type = "pci";
         };

How do I interpret the ranges in the above bindings? I need to implement 
only Root complex functionality.Last two cell seem to represent size in 
64 bit format (2 cells). But what does the first 4 cells represent?

I also need to support Legacy and MSI IRQs. There are 4 legacy IRQs 
going to GIC. There are 8 MSI IRQs. How does the interrupt map work?

If you could point me to any documentation that explain these, it will 
be really helpful. Do you think the above bindings  represent a Root 
Complex Host controllerthat I can re-use for my work?Based on my 
research so far, it appears that DT based driver configurationon an ARM 
architecture would involve development ofOF helper functions (currently 
implemented at different arch level) as well to support the driver. I 
believe Nvdia and Marvell are currently doing this for ARM and I may be 
able to re-use their work.

Thanks

Murali Karicheri



--------------080906040007050208000000
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Grant,<br>
    <br>
    I am developing a PCI Host driver for Keystone devices. I am trying
    to understand how the device bindings work for PCI Root Complex (RC)
    Host controller and corresponding&nbsp; devices on the bus. There are no
    DT based implementation I can find for the ARM architecture. I have
    seen some patches posted by Nvidia for Tegra processors. Trying to
    understand how I write bindings for the host controller,&nbsp; the
    interrupt mappings and the driver to parse these bindings.<br>
    <br>
    Address start /Size information from the device spec is given below.<br>
    <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x21800000 0x8000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; /* pcie-regs
    */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x50000000 0x10000000&nbsp;&nbsp; /* pcie-nonprefetch
    memory */&nbsp;&nbsp;&nbsp;&nbsp; <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x70000000 0x4000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* pcie-io
    */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80000000 0x20000000&gt;; /* pcie-inbound0
    */ <br>
    <br>
    Need
    <meta http-equiv="Content-Type" content="text/html;
      charset=ISO-8859-1">
    <font size="-1"><span style="font-family: Arial; color: black;">1:1
        mapping between the Root compl<font size="-1">ex</font>
        address space and the PCI memory address space</span>. In the
      above it is starti<font size="-1">ng at address 0x50000000 and
        size 0x10000000.&nbsp; <font size="-1">I see following bindings from
          a power PC dts file (powerpc/boot/dts/mpc8541cds.dts)</font><br>
      </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
      <font size="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci1: pci@e0009000 {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupt-map-mask = &lt;0xf800 0x0 0x0 0x7&gt;;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupt-map = &lt;<br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* IDSEL 0x15 */<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xa800 0x0 0x0 0x1 &amp;mpic 0xb 0x1<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xa800 0x0 0x0 0x2 &amp;mpic 0xb 0x1<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xa800 0x0 0x0 0x3 &amp;mpic 0xb 0x1<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xa800 0x0 0x0 0x4 &amp;mpic 0xb
        0x1&gt;;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupt-parent = &lt;&amp;mpic&gt;;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupts = &lt;25 2&gt;;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bus-range = &lt;0 0&gt;;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ranges = &lt;0x2000000 0x0 0xa0000000 0xa0000000
        0x0 0x20000000<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1000000 0x0 0x0 0xe3000000 0x0
        0x100000&gt;;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock-frequency = &lt;66666666&gt;;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #interrupt-cells = &lt;1&gt;;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #size-cells = &lt;2&gt;;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #address-cells = &lt;3&gt;;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg = &lt;0xe0009000 0x1000&gt;;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible = "fsl,mpc8540-pci";<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_type = "pci";<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
      </font><br>
      <font size="-1">How do I <font size="-1"><font size="-1">interpret</font>
          the ranges in the above bindings? I need to implement onl<font
            size="-1">y Root complex functionality.<font size="-1">&nbsp; <font
                size="-1">Last two cell seem to repre<font size="-1">sent
                  size in 64 bit format (2 cells). But what does the
                  first 4 cells represent?<br>
                  <br>
                  <font size="-1"><font size="-1"><font size="-1">I also
                        need to support Legacy and MSI IRQs. There are 4
                        leg<font size="-1">acy IRQs going to GIC<font
                            size="-1">. There are 8 MSI IR<font
                              size="-1">Qs. How does the interrupt map
                              work?<br>
                              <br>
                              <font size="-1">I<font size="-1">f you
                                  could poin<font size="-1">t me to a</font></font></font>ny
                              documentation that explain these, it <font
                                size="-1"><font size="-1"><font
                                    size="-1">will be really helpful.&nbsp;
                                    Do you t<font size="-1">hink the
                                      above bindings&nbsp; represent a R<font
                                        size="-1">oot Complex Host
                                        controller<font size="-1"> that
                                          I can re-use for my work?<font
                                            size="-1"> Based on my
                                            research so far, it app<font
                                              size="-1">ears t<font
                                                size="-1">hat</font> <font
                                                size="-1">DT based dr<font
                                                  size="-1"><font
                                                    size="-1">iver
                                                    configuration<font
                                                      size="-1"> o<font
                                                        size="-1">n an</font>
                                                      ARM architec<font
                                                        size="-1">ture
                                                        would involve
                                                        devel<font
                                                          size="-1">opment
                                                          of</font><font
                                                          size="-1"><font
                                                          size="-1"> </font>OF
                                                          helper
                                                          functions
                                                          (currently <font
                                                          size="-1"><font
                                                          size="-1">implemented</font>
                                                          at different
                                                          arch level) as
                                                          well to
                                                          support the dr<font
                                                          size="-1">iver.
                                                          I believe <font
                                                          size="-1">N<font
                                                          size="-1">vdia
                                                          <font
                                                          size="-1">and
                                                          Marvell are
                                                          currently <font
                                                          size="-1">doing
                                                          this f<font
                                                          size="-1">or</font>
                                                          ARM and I <font
                                                          size="-1">may
                                                          be able to
                                                          re-use the<font
                                                          size="-1">ir
                                                          work. <br>
                                                          <br>
                                                          <font
                                                          size="-1"><font
                                                          size="-1">Thanks<br>
                                                          <br>
                                                          <font
                                                          size="-1">Murali
                                                          Karic<font
                                                          size="-1">heri<br>
                                                          <br>
                                                          </font></font><font
                                                          size="-1"></font></font></font></font></font></font></font></font></font></font></font></font></font></font></font></font></font></font></font>
                                        </font></font></font><br>
                                  </font></font></font></font></font></font></font></font></font></font></font></font></font></font></font></font>
  </body>
</html>

--------------080906040007050208000000--

--===============4264228269766362790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4264228269766362790==--
