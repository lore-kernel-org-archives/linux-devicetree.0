From: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: UIO / of_genirq driver
Date: Thu, 28 Jan 2010 17:13:00 +1000
Message-ID: <1d3f23371001272313i62fc9158se4cd9173f196fb12@mail.gmail.com>
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
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: gregkh-l3A5Bk7waGM@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I came across this thread/patchset from around June last year:

http://lists.ozlabs.org/pipermail/linuxppc-dev/2009-June/073086.html

where Wolfgang proposed a generic OF-driven UIO driver.  The
discussion seemed to stall after Grant Likely indicated he didn't like
the use of a linux-specific compatible binding in the device tree
(compatible="generic-uio").

I guess I have a couple of questions:

 * did this patchset go anywhere?  I've been using it here the last
few days and it works great.

and more generally:

 * Is there a better way to handle the OF bindings for this sort of thing?

Grant's complaint seems to come up often - when you have generic
controllers in a system (SPI/I2C also spring to mind), we need a way
of signalling somehow to the kernel that each instance has a
particular usage intended.

However, the device-tree guys complain whenever anyone tries to encode
anything non-hardware related into the DTS itself.

I guess I'd like to just open up a discussion, see if there's been any
progress towards a general solution.

Thanks,

John
-- 
John Williams
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com  p: +61-7-30090663  f: +61-7-30090663
