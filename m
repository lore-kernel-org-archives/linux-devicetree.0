From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v6 1/3] USB: chipidea: add imx usbmisc support
Date: Wed, 29 Aug 2012 18:57:21 +0800
Message-ID: <20120829105720.GC25433@b20223-02.ap.freescale.net>
References: <1346137109-32247-1-git-send-email-richard.zhao@freescale.com>
 <1346137109-32247-2-git-send-email-richard.zhao@freescale.com>
 <871uiqkuhb.fsf@ashishki-desk.ger.corp.intel.com>
 <20120829081020.GX26594@pengutronix.de>
 <87ehmqj925.fsf@ashishki-desk.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87ehmqj925.fsf-qxRn5AmX6ZD9BXuAQUXR0fooFf0ArEBIu+b9c/7xato@public.gmane.org>
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
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: marex-ynQEQJNshbs@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 29, 2012 at 01:18:10PM +0300, Alexander Shishkin wrote:
> Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
> 
> > On Wed, Aug 29, 2012 at 10:50:08AM +0300, Alexander Shishkin wrote:
> >> Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:
> >> 
> >> > i.MX usb controllers shares non-core registers, which may include
> >> > SoC specific controls. We take it as a usbmisc device and usbmisc
> >> > driver set operations needed by ci13xxx_imx driver.
> >> >
> >> > For example, Sabrelite board has bad over-current design, we can
> >> > usbmisc to disable over-current detect.
> >> 
> >> Why does this have to be part of the usb driver instead of SoC specific
> >> code? It looks like you've created a whole new device/driver
> >> infrastructure just to disable overcurrent for a specific board.
> >
> > Richards code indeed only handles overcurrent for a specific board, but
> > there are more bits to configure in the longer run: power pin
> > polarities, ULPI/serial mode select and some more.
> 
> Sounds to me like these things that should be taken care of by the phy
> driver, which will likely be simpler from both driver's and devicetree's
> perspective.
No, it's controlled by a set of usb misc registers, which is not in phy
IP or usb controller IP.

Thanks
Richard
> 
> >
> >> 
> >> And the infrastructure boils down to a complex way of passing a callback
> >> from imx driver to another imx driver, that only works if they are
> >> probed in the right order. I don't see any point in doing it like this
> >> other than inflating the device tree tables even further.
> >> 
> >> Why can't this be part of the SoC code like it is done, for example in
> >> arch/arm/mach-omap2/control.c?
> >
> > The settings are board specific, so there must be some way to configure
> > them in the devicetree.
> 
> But I'm sure there's a way to control board-specific settings/kludges
> from devicetree?
> 
> Regards,
> --
> Alex
> 
