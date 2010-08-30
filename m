From: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: ePAPR 1.1 to do list
Date: Mon, 30 Aug 2010 14:34:44 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA306688C2F@az33exm25.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I've consolidated what I am aware of with respect to errors found in
1.0,
clarifications needed, and new mechanisms to go into ePAPR 1.1 into
a single list.

Let me know if you are aware of anything else.

ePAPR 1.1 To Do
---------------

1. Fix typos, misc cleanup

   -device_type="simple-bus" in 8572 soc node example (p.96)
   -p.51, line 27-- ET_EXEC is 0x2 not 0x1
   -p.41, broken cross reference
   -missing period on virtual reg on ns16550

2. Representation of hw threads in device trees

   -proposal:
 
<http://lists.ozlabs.org/pipermail/devicetree-discuss/2010-March/001927.
html>

3. Provide way for client program to determine type of
   MMU, without parsing device tree

     -proposal:
       -specify an enum value in R8
       -convey MMU type in dev tree as well

4. Define new spin table enable method that specifies
   that spin table is mapped cacheable and coherent
     -proposal:
        -"spin-table-v2"

5. more compact/consolidated representation of CPU nodes
   -if there are 16 or 64 identical CPUs specifying all
    properties in each can get very verbose
   -proposal:
      -move common properties to /cpus

6. Provide mechanism on CPU node to convey non-probeable
   aspects of which Power arch categories are implemented

7. For IMAs clarify
     -some places say virt must equal phys
     -but requirements on p.53 don't say that
     -how do OSes determine the physical address of the IMA
        -initial-mapped-area is optional

8. For DMA devices, define standard property that conveys the
   the address width a device is capable of?  e.g. a PCI
   device that can only address 32-bits.

9. stdout/stdin alias

10. ns16550 binding
   -why is number of interrupt specifiers undefined?

11. Multi-level caches (p. 18)
   -comment saying cache nodes must/shall be under a cpu node
    necessarily doesn't make sense
       -should qualify it saying-- it the node does not have another
place
        to stick it, use one of the cpu nodes

12. "label" property
   -make is standard

Regards,
Stuart
