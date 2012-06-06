From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 00/12] add imx usb driver for mx28/6x
Date: Wed, 6 Jun 2012 10:27:22 +0800
Message-ID: <20120606022714.GA2667@S2101-09.ap.freescale.net>
References: <1337912665-16615-1-git-send-email-richard.zhao@freescale.com>
 <20120605150209.GZ28631@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120605150209.GZ28631-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
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
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: marex-ynQEQJNshbs@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 05, 2012 at 06:02:13PM +0300, Felipe Balbi wrote:
> Hi,
> 
> On Fri, May 25, 2012 at 10:24:13AM +0800, Richard Zhao wrote:
> > The work is based on  ci13xxx rework done by Alexander Shishkin.
> > 
> > Status:
> >   - this version only support host
> >   - usbotg controler works at host role
> > 
> > Changes since V2:
> >   - Rebase to Alex's tree
> >   - Use regulator to control vbus power
> >   - Remove ARCH check in Kconfig, but add OF_DEV check.
> >   - Other changes according laster version comments.
> > 
> > Richard Zhao (12):
> >   usb: otg: add notify_connect/notify_disconnect callback
> >   usb: chipidea: permit driver bindings pass phy pointer
> >   usb: ehci-hcd: notify phy when connect change
> >   usb: otg: add basic mxs phy driver support
> >   usb: chipidea: add imx platform driver
> >   ARM: imx6q: correct device name of usbphy and usb controller clock
> >     export
> >   ARM: imx6q: add config-on-boot gpios
> >   ARM: imx6q: add usbphy clocks
> >   ARM: imx6q: disable usb charger detector
> >   ARM: dts: imx6q-sabrelite: add usb devices
> >   ARM: mxs: clk_register_clkdev mx28 usb clocks
> >   ARM: dts: imx28-evk: add usb devices
> 
> how are we going to handle these series ? drivers/usb/otg/* parts are
> mostly ok (I need to look deeper) but if I take drivers/usb/otg/* we
> will have to delay drivers/usb/chipidea I guess...
> 
> So someone would have to take the whole series ? Who will be that
> person? Alex, will it be you ?
> 
I'm unsure about drivers/usb part, but arch/arm part should go via
arm-soc tree.

-- 
Regards,
Shawn
