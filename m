From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 06/20] usb: host: xhci-plat: Add support for the Armada
 38x
Date: Tue, 06 May 2014 13:57:44 +0200
Message-ID: <61061197.hLhKsFqJLF@wuerfel>
References: <1399335255-589-1-git-send-email-gregory.clement@free-electrons.com>
 <1399335255-589-7-git-send-email-gregory.clement@free-electrons.com>
 <1584794.IM1uiSkBdk@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1584794.IM1uiSkBdk@amdc1032>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, linux-usb@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Nadav Haklai <nadavh@marvell.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, Tawfik Bayouk <tawfik@marvell.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 06 May 2014 13:34:46 Bartlomiej Zolnierkiewicz wrote:
> On Tuesday, May 06, 2014 02:14:01 AM Gregory CLEMENT wrote:
> > For the Armada 38x SoCs which come with an xhci controller, specific
> > initialization must be done during probe related to the MBus windows
> > configuration. This patch adds the support of this quirk.
> > 
> > Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> > ---
> >  drivers/usb/host/Kconfig      |  7 +++++
> >  drivers/usb/host/Makefile     |  1 +
> >  drivers/usb/host/xhci-mvebu.c | 71 +++++++++++++++++++++++++++++++++++++++++++
> >  drivers/usb/host/xhci-mvebu.h | 21 +++++++++++++
> >  drivers/usb/host/xhci-plat.c  |  6 ++++
> >  5 files changed, 106 insertions(+)
> >  create mode 100644 drivers/usb/host/xhci-mvebu.c
> >  create mode 100644 drivers/usb/host/xhci-mvebu.h
> > 
> > diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> > index 3d9e54062d62..e70943fac4a1 100644
> > --- a/drivers/usb/host/Kconfig
> > +++ b/drivers/usb/host/Kconfig
> > @@ -29,6 +29,13 @@ if USB_XHCI_HCD
> >  config USB_XHCI_PLATFORM
> >       tristate
> >  
> > +config USB_XHCI_MVEBU
> > +     tristate "xHCI support for Marvell Armada 38x"
> 
> Please limit this driver to mvebu arch and compile testing, i.e.
> 
>         depends on ARCH_MVEBU || COMPILE_TEST

I think it actually needs a dependency on MVEBU_MBUS.

You probably need something like

	depends on MVEBU_MBUS=y || (MVEBU_MBUS=m && USB_XHCI=m)

Also, having the option 'tristate' makes no sense, since you
can't have it as a loadable module.

	Arnd
