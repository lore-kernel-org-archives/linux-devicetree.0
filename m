From: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: IMA proposal
Date: Fri, 17 Sep 2010 07:08:55 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA30674BBBA@az33exm25.fsl.freescale.net>
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

-Scott Wood, Dan Hettena, and myself discussed IMAs and have
 a proposal for ePAPR 1.1

-there are a number of issues/questions/inconsistencies  around IMAs
 (initial mapped areas) as described in ePAPR 1.0
    -5.3 says IMAs are applicable to book III-E only, but
     in 5.4.4 real mode CPUs have a 'boot IMA'
    -real mode CPUs appear have no way to determine starting
     address of the IMA
    -why is there a natural alignment constraint?
    -some vague references to identity mappings
   
-what a client program needs to know is the initial memory
 region it can use without fiddling with the MMU

-IMA proposal for ePAPR 1.1

   -IMA refers to 'initial memory area'
    (i.e. applicable to both real mode and Book III-E)

   -size of the IMA is passed to the client program in r7

   -the 'effective address' of the IMA is passed to the 
    client program in r8

   -the physical address range corresponding to the IMA
    must consist entirely of normal RAM and must not overlap
    any memory reservations specified in the device tree.

   -no requirement for
      -being mapped to lowest physical address
      -natural alignment to size of IMA

   -Book III-E client determines physical address of IMA by
    searching for EA in TLB

-Thus, all memory in the IMA is free to be used by the client
 program, though the client program should be careful not to
 overwrite its own image or the device tree.

Regards,
Stuart Yoder
