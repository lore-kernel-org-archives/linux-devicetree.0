From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Subject: Re: [RFC] Machine description as data
Date: Thu, 12 Feb 2009 13:49:39 +0100
Message-ID: <49941AE3.1000806@gmx.net>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>	<1234378228.28751.79.camel@slate.austin.ibm.com>	<20090212040138.GD31142@yookeroo.seuss>
	<87iqng0x3t.fsf@pike.pond.sub.org>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <87iqng0x3t.fsf@pike.pond.sub.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/pipermail/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: qemu-devel@nongnu.org
Cc: devicetree-discuss@ozlabs.org, Hollis Blanchard <hollisb@us.ibm.com>
List-Id: devicetree@vger.kernel.org

On 12.02.2009 11:26, Markus Armbruster wrote:
> David Gibson <dwg@au1.ibm.com> writes:
>
>   
>> On Wed, Feb 11, 2009 at 12:50:28PM -0600, Hollis Blanchard wrote:
>>     
>>> On Wed, 2009-02-11 at 16:40 +0100, Markus Armbruster wrote:
>>>       
>>>> I briefly examined the DT source format and the tree structure it
>>>> describes for the purpose of QEMU configuration.  I decided against
>>>> using it in my prototype because I found it awfully low-level and
>>>> verbose for that purpose (I'm sure it serves the purpose it was designed
>>>> for just fine).  Issues include:
>>>>
>>>> * Since the DT is designed for booting kernels, not configuring QEMU,
>>>>   there's information that has no place in QEMU configuration, and
>>>>   required QEMU configuration isn't there.
>>>>         
>>> What's needed is a "binding" in IEEE1275-speak: a document that
>>> describes qemu-specific nodes/properties and how they are to be
>>> interpreted.
>>>
>>> As an example, you could require that block devices contain properties
>>> named "qemu,path", "qemu,backend", etc.
>>>> * Property "reg", which encodes address ranges, does so in terms of
>>>>   "cells": #address-cells 32-bit words (big endian) for the address,
>>>>   followed by #size-cells words for the size, where #address-cells and
>>>>   #size-cells are properties of the enclosing bus.  If this sounds
>>>>   like gibberish to you, well, that's my point.
>>>>         
>> #address-cells and #size-cells takes a little getting used to, but
>> it's really not that bad.  It's just a way of representing the fact
>> that different busses have different sized address encodings.
>>     
>
> I didn't mean to say they are a bad idea for FDTs, just that they're on
> an awkward level of abstraction for QEMU configuration.  There, I'd
> rather express a PCI address as "02:01.0" than as <0x00000220>.
> Translating text to binary is the machine's job, not the user's.
>   

Coreboot v3 is using some device tree variant which is IMHO a bit more
user friendly. The tree below is incomplete (for example, it leaves out
the PCI bus number and assumes that it is zero by default), but you
surely get the idea.

/{
    mainboard_vendor = "Gigabyte";
    mainboard_name = "M57SLI";
    cpus { };
    apic@0 {
    };
    domain@0 {
        pci@0,0 { /* MCP55 RAM? */ 
        };
        pci@1,0 {
            /config/("southbridge/nvidia/mcp55/lpc.dts");
            ioport@2e {
                /config/("superio/ite/it8716f/dts");
                com1enable = "1";
                ecenable = "1";
                kbenable = "1";
                mouseenable = "1";
                gpioenable = "1";
            };
        };
        pci@1,1 { /* smbus */
        };
        pci@2,0 { /* usb */
        };
        pci@2,1 { /* usb */
        };
        pci@4,0 {
            /config/("southbridge/nvidia/mcp55/ide.dts");
            ide0_enable = "1";
        };
        pci@5,0 {
            /config/("southbridge/nvidia/mcp55/sata.dts");
            sata0_enable = "1";
        };
        pci@5,1 {
            /config/("southbridge/nvidia/mcp55/sata.dts");
            sata1_enable = "1";
        };
        pci@6,0 { /* PCI */
        };
        pci@6,1 {
            /*/config/("southbridge/nvidia/mcp55/audio.dts"); */
        };
        pci@8,0 {
        /*
            /config/("southbridge/nvidia/mcp55/nic.dts");
            mac_eeprom_smbus = "3";
            mac_eeprom_addr = "0x51";
        */
        };
        pci@f,0 { /* PCIe */ 
        };
        pci@18,0 {
            /config/("northbridge/amd/k8/pci");
        };
        pci@18,1 {};
        pci@18,2 {};
        pci@18,3 {
            /config/("northbridge/amd/k8/mcf3");
        };
    };
};


The /config/("...") statements are basically comparable to #include
"..." in C.

While the syntax pci@dev,fn is different to the bus:dev.fn you're used
to, it's IMHO a lot more readable than <0x00000220>.

Regards,
Carl-Daniel

-- 
http://www.hailfinger.org/
