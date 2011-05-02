From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Login prompt on a video console instead of serial port?
Date: Mon, 2 May 2011 14:30:36 -0500
Message-ID: <4DBF065C.3030407@freescale.com>
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
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

I'm using a Freescale P1022DS (PowerPC e500 core) system, which has a built-in
video controller.  I have a framebuffer driver that works fine, and if I add
"video=fslfb:1280x1024-32@60,monitor=0 console=tty0" to the command-line, then
*most* of the kernel boot log appears on the serial port and the video display.

However, the login prompt is always on the serial port.  This happens even if I
delete the "console=ttyS0,115200" from the command-line.  I presume this is
because the "linux,stdout-path" property in the device tree always points to a
serial port node.

So my question is: what do I need to do get the login prompt on the video
console?  That is, stdout goes to /dev/fb0 but stdin is still from /dev/ttyS0.
I presume I need to direct "linux,stdout-path" to the fslfb node in the device
tree, but there doesn't appear to be support for "linux,stdin-path".

-- 
Timur Tabi
Linux kernel developer at Freescale
