From: "Yoder Stuart-B08248" <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RFC: proposal to extend the open-pic interrupt specifier definition
Date: Tue, 5 Jan 2010 16:28:12 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E@az33exm25.fsl.freescale.net>
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
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org


The current open-pic binding defines that interrupt specifiers
have 2 cells-- an interrupt number and level/sense encoding.

With chips like the P4080 this is no longer sufficient to
represent the various types of interrupt sources handled by
the interrupt controller.  A linear list of interrupt numbers
doesn't handle all interrupt types-- there are at least 4 different
kinds of interrupts on the P4080.

We have a proposal to extend the open-pic binding in
a backwards compatible way to encode additional information
in the level/sense field.

The current definition of level/sense is:
  0 = low to high edge sensitive type enabled
  1 = active low level sensitive type enabled
  2 = active high level sensitive type enabled
  3 = high to low edge sensitive type enabled

Those 2 bits would retain their current meaning, but the
full encoding would be extended as follows:

     bits      meaning
     ----------------------------------------------
     0-7       interrupt sub-type
     8-15      interrupt type
     16-23     implementation dependent
     24-29     reserved
     30-31     level/sense encoding

     interrupt type
     --------------
     The interrupt type field numberspace is divided as
     follows:

        0x00 to 0x7f - architected interrupt types
        0x80 to 0xff - implementation dependent interrupt
                       types

     The interrupt type determines the meaning of the 
     sub-type.  Implementation dependent types are
     specified by the interrupt controller binding.

     architected interrupt types
     ---------------------------
     0x00 - unspecified / I/O device
     0x01 - interprocessor interrupt
     0x02 - timer interrupt
     0x03 - message signaled interrupt

The advantage of the above approach is backwards compatibility.
Existing interrupt specifiers (and device trees) are valid with
this proposal. 

Regards,
Stuart Yoder
