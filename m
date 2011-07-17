From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Sun, 17 Jul 2011 15:18:08 +0800
Message-ID: <20110717071807.GC2374@S2100-06.ap.freescale.net>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
	<201107152011.41546.arnd@arndb.de>
	<20110716075748.GI1840@S2100-06.ap.freescale.net>
	<201107161409.46719.arnd@arndb.de> <4E218A4C.8000603@freescale.com>
	<20110716144026.GB2374@S2100-06.ap.freescale.net>
	<4E21A252.4060606@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E21A252.4060606-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 16, 2011 at 10:38:11PM +0800, Tabi Timur-B04825 wrote:
> Shawn Guo wrote:
> > It's not about virtual or physical channel.  I'm asking suggestion on
> > how we bind the channel number for each dma client device in device
> > tree and how they will get the number from device tree when they get
> > probed.
> 
> I guess I'm still confused.  Why do we need to bind the channel number? 
> It's just a resource that can be owned by the driver without needing a 
> device tree.

I should have said it's about how we bind sdma event number for each
client device and how the client device drivers retrieve the number
from device tree.  To be clear, the sdma event number is a sdma client
device specific resource, which is defined by soc.  You may ask why
this virtual number matters, since physical channel number is
dynamically assigned to the client device.  It's related to sdma
hardware design.  sdma is a custom RISC core with SRAM inside.  It
executes firmware to move data between peripheral and system memory.
The sdma event number is actually used to identify the peripheral by
sdma core and firmware.  So whenever a peripheral (sdma client device)
requests sdma service, it has to tell sdma its event number to let
sdma identify it.

For existing non-dt case, the sdma event number is being passed into
sdma client device driver by platform code as resource of
IORESOURCE_DMA.  But the approach is not working for dt case.

-- 
Regards,
Shawn
