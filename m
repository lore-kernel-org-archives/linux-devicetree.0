From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Fwd: DTS video mode parameters
Date: Mon, 18 Jun 2012 14:03:00 +0200
Message-ID: <4FDF18F4.90307@monstr.eu>
References: <9D79B9A9194389468A922F618415D0A4F515D6@abc.xylon.local>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <9D79B9A9194389468A922F618415D0A4F515D6-AVTXnJZEH6Hrjyi1UH1rQg@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi guys,

not sure why this email didn't go through but let me forward it to mailing list.
Thanks for your comments.

Thanks,
Michal

-------- Original Message --------
Subject: DTS video mode parameters
Date: Thu, 14 Jun 2012 17:29:02 +0200
From: Davor Joja <Davor.Joja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
To: <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
CC: Michal Simek <michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, Goran Pantar <Goran.Pantar-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>

Hello all,

I'm developing framebuffer driver for configurable video controller FPGA
IP
core. Fb driver is getting all hw parameters from dts.
Video controller is used with various flat panels which demands specific
video
timings, so I have created small non-standard videomode "database" for
modes
which are not supported by kernel modedb.c
I have placed database in DTS to avoid fb driver code growing with this
database.

Is there already existing way to place fb videomode parameters (not EDID
parameters) in dts, so that any new specific videomode can easily be
added in
dts and then used by fb driver, without need for recompiling kernel or
module?
This flexible approach would be very useful when working on embedded
systems
with various non-standard resolution flat panels used, if it is
possible.

DT node for videomode parameters that fb driver now reads is based on
fb.h
struct fb_videomode and one of them looks like this:
800x480 {
	name = "800x480";
	refresh = <60>;
	xres = <800>;
	yres = <480>;
	pixclock-khz = <31500>;
	left-margin = <56>;
	right-margin = <64>;
	upper-margin = <14>;
	lower-margin = <28>;
	hsync-len = <80>;
	vsync-len = <3>;
	sync = <0>;
	vmode = <0>;
};
Driver is searching videomode name and if found it reads all parameters,
storing them internally and then initializing hw.

Thanks for any suggestion or help!

Davor


-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
