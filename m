From: "Robert Sciuk" <robert.sciuk-AJFDzwRlY/g@public.gmane.org>
Subject: fpga driver on custom PPC target platform (P4080) ...
Date: Wed, 2 Nov 2011 18:43:20 -0400
Message-ID: <2DD52030B5146141BEB762A11AE97C4C0100C4AA@SPQCEXC05.exfo.com>
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
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Tree lovers,

I'm in the process of designing and implementing a Linux device driver
for a Xilinx V6 FPGA which can be loaded from  the CPU (P4080) on our
target board (and optionally 2 additional FPGA's on a riser card).  The
programming pins of the FPGAs are tied to a MUX (PCA9539) on an i2c bus,
and the port is located on the localbus (simplebus).  I'm thinking that
a uio type driver could in theory set the programming bits using the i2c
mux upon open(), and that an mmap() in userspace would perform the .bits
load, and the programming done bit would be returned in the close() of
the device from userland.

I would like to use the device tree to map both the i2c access and the
localbus mappings, and I've yet to start coding, though this may start
RSN.  My questions to the list, are:

	- am I barking up the wrong tree here?
	- is there anyone who has done something similar before which
can be shared?
	- Is there an impedance problem having the device accessed on
both I2c and localbus?
	- Is there a problem combining device tree and uio drivers?
	- How does one specify in the device tree an FPGA which uses
both I2c bus and localbus for programming?

This is kind of an interesting project, as I've never written a
device-tree driver before, and I've yet to use uio type drivers, but it
does seem a good match for the problem.  Any comments or pointers would
be well received.

Thanks in advance, and sorry for cross-posting, I'm sure that some of
you may well see this message twice, and for that I'm sorry.

Robert Sciuk
Senior Designer, R&D.
905.738.3741 xt 22621
