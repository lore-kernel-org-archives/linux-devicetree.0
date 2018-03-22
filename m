From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v3 1/6] PCI: rockchip: Create individual folder for
 rockchip drivers
Date: Thu, 22 Mar 2018 09:47:35 +0100
Message-ID: <20180322084735.GC6211@kroah.com>
References: <1520304173-231081-1-git-send-email-shawn.lin@rock-chips.com>
 <1520304202-232891-1-git-send-email-shawn.lin@rock-chips.com>
 <20180320174633.GA137590@bhelgaas-glaptop.roam.corp.google.com>
 <879a4862-d0d5-21fd-6c47-029c795fe78e@rock-chips.com>
 <20180321181940.GA9760@e107981-ln.cambridge.arm.com>
 <7275bd77-016a-2729-482d-2855703d9b56@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7275bd77-016a-2729-482d-2855703d9b56-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 22, 2018 at 09:03:58AM +0800, Shawn Lin wrote:
> [+ Greg]

Why me?

> > It would be OK for me to keep files separate too; a separate question
> > would then be whether we have to rename drivers/pci/host if we add
> > endpoint drivers in there, do we have to?
> > 
> > At that stage we could well move drivers/pci/dwc and drivers/pci/cadence
> > in there too.
> > 
> 
> I add Greg to this thread, and hope he could shed a light here.
> 
> That is completely the same situation annoying me when looking into
> drivers/usb where they have drivers/usb/host/ for host drivers,
> drivers/usb/gadget/ for device framwork, drivers/usb/gaget/udc for
> device drivers, and even surprisingly drivers/usb/dwc2/,
> drivers/usb/dwc3/ and drivers/usb/renesas_usbhs/ for supporting both of
> host and device functional drivers....

USB is "messy" in that we have hardware that acts both as a host and a
gadget controller.  Don't use our directory scheme as an example to do
anything :)

Do what is right for the PCI subsystem, if a driver is too "complex"
that it needs lots of different files, make a subdirectory to make it
easier to manage.  That's all we did for USB, nothing really complex.

good luck!

greg k-h
