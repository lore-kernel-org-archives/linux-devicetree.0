From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: PCI device bindings - Help needed
Date: Thu, 06 Jun 2013 00:55:06 +0100
Message-ID: <20130605235506.312783E10E4@localhost>
References: <5137C062.5020208@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5137C062.5020208-l0cyMroinI0@public.gmane.org>
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
To: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, "Chemparathy, Cyril" <cyril-l0cyMroinI0@public.gmane.org>
Cc: device-tree <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Murali,

I believe you got a reply on the mailing list pointing you to
devicetree.org. That should have the information you need. You can also
google for the OpenFirmware PCI binding to get more information

g.

On Wed, 6 Mar 2013 17:17:06 -0500, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org> wrote:
> Grant,
> 
> I am developing a PCI Host driver for Keystone devices. I am trying to 
> understand how the device bindings work for PCI Root Complex (RC) Host 
> controller and corresponding  devices on the bus. There are no DT based 
> implementation I can find for the ARM architecture. I have seen some 
> patches posted by Nvidia for Tegra processors. Trying to understand how 
> I write bindings for the host controller,  the interrupt mappings and 
> the driver to parse these bindings.
> 
> Address start /Size information from the device spec is given below.
> 
>                         0x21800000 0x8000            /* pcie-regs */
>                         0x50000000 0x10000000   /* pcie-nonprefetch 
> memory */
>                         0x70000000 0x4000            /* pcie-io */
>                         0x80000000 0x20000000>; /* pcie-inbound0 */
> 
> Need 1:1 mapping between the Root complex address space and the PCI 
> memory address space. In the above it is starting at address 0x50000000 
> and size 0x10000000. I see following bindings from a power PC dts file 
> (powerpc/boot/dts/mpc8541cds.dts)
> 
>          pci1: pci@e0009000 {
>                  interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
>                  interrupt-map = <
> 
>                          /* IDSEL 0x15 */
>                          0xa800 0x0 0x0 0x1 &mpic 0xb 0x1
>                          0xa800 0x0 0x0 0x2 &mpic 0xb 0x1
>                          0xa800 0x0 0x0 0x3 &mpic 0xb 0x1
>                          0xa800 0x0 0x0 0x4 &mpic 0xb 0x1>;
>                  interrupt-parent = <&mpic>;
>                  interrupts = <25 2>;
>                  bus-range = <0 0>;
>                  ranges = <0x2000000 0x0 0xa0000000 0xa0000000 0x0 
> 0x20000000
>                            0x1000000 0x0 0x0 0xe3000000 0x0 0x100000>;
>                  clock-frequency = <66666666>;
>                  #interrupt-cells = <1>;
>                  #size-cells = <2>;
>                  #address-cells = <3>;
>                  reg = <0xe0009000 0x1000>;
>                  compatible = "fsl,mpc8540-pci";
>                  device_type = "pci";
>          };
> 
> How do I interpret the ranges in the above bindings? I need to implement 
> only Root complex functionality.Last two cell seem to represent size in 
> 64 bit format (2 cells). But what does the first 4 cells represent?
> 
> I also need to support Legacy and MSI IRQs. There are 4 legacy IRQs 
> going to GIC. There are 8 MSI IRQs. How does the interrupt map work?
> 
> If you could point me to any documentation that explain these, it will 
> be really helpful. Do you think the above bindings  represent a Root 
> Complex Host controllerthat I can re-use for my work?Based on my 
> research so far, it appears that DT based driver configurationon an ARM 
> architecture would involve development ofOF helper functions (currently 
> implemented at different arch level) as well to support the driver. I 
> believe Nvdia and Marvell are currently doing this for ARM and I may be 
> able to re-use their work.
> 
> Thanks
> 
> Murali Karicheri
> 
> 
Non-text part: text/html

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
