From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] PCI: keystone: update to support multiple pci ports
Date: Fri, 05 Sep 2014 21:00:19 +0200
Message-ID: <3654923.JrIGV2dJ70@wuerfel>
References: <1409938782-31460-1-git-send-email-m-karicheri2@ti.com> <7260053.FoBVhTXVfj@wuerfel> <540A0212.6060303@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <540A0212.6060303-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 05 September 2014 14:33:54 Murali Karicheri wrote:
> > This looks like it's a shared register of some sort that doesn't
> > really belong into the registers of a particular port. Could it
> > be that it's actually for the PHY?
> >
> This a shared device configuration register between the two ports the 
> desciption states it is bootstrap configuration of the PCIe module as 
> Endpoint or Root complex and Not Phy. Hope below text will help.

Ok. Why do you want to have this user-selectable though? Can't it
just be set by the boot loader before starting Linux?

	Arnd

> Table 3-23 Device Configuration Register (DEVCFG)
> 
> 
> PCIESSMODE[1:0] 00b PCIESSMODE is used to control the
> functionality of PCIESS module out of
> reset. This MMR output is connected to
> DEVTYPE input of PCIESS
> (Changes from
> Nysh) : Note that in Nysh this value came
> from a bootstrap pin.
> 00 : Endpoint
> 01 : Legacy Endpoint
> 10 : Rootcomplex
> 11 : Reserved
> PCIESS_1_MODE[1:0
> ]
> 00b PCIESSMODE is used to control the
> functionality of PCIE_1 module out of
> reset. This MMR output is connected to
> DEVTYPE input of PCIE_1
> 00 : Endpoint
> 01 : Legacy Endpoint
> 10 : Rootcomplex
> 11 : Reserv
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
