From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 2/2] PCI: keystone: update to support multiple pci ports
Date: Tue, 09 Sep 2014 23:52:34 +0200
Message-ID: <3967092.l9bxcqMaSa@wuerfel>
References: <1410293835-13050-1-git-send-email-m-karicheri2@ti.com> <9042477.aRbAhpkfQ5@wuerfel> <540F75DF.5050904@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <540F75DF.5050904-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 09 September 2014 17:49:19 Murali Karicheri wrote:
> Actually this is an inteded. The vendor ID is in a register indicated by
> reg offset and as per the device spec, it needs to be read and updated 
> by the software. Now since multiple instances of PCI device needs to be 
> read the same register, the reading happens in the probe() and same is 
> unmapped after that.
> 
> +       ks_pcie->device_id = readl(reg_p) >> 16;
> +       devm_iounmap(dev, reg_p);
> +       devm_release_mem_region(dev, res->start, resource_size(res));
> 
> Afetr that in ks_pcie_host_init(), it update the device_id in the RC's 
> config space.

I'm not sure I understand the purpose of this. Do you mean you read
the vendor/device ID of whichever device happens to get probed first
and then program the same ID into all other devices as well?

What if the order changes between two boots? Why does the vendor/device
ID of the host bridge even matter at all?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
