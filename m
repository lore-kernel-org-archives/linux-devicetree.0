From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/2] pci: host: new driver for Marvell Armada 7K/8K
 PCIe controller
Date: Tue, 26 Apr 2016 10:42:08 +0200
Message-ID: <20160426104208.150cbbd0@free-electrons.com>
References: <1460648177-31473-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<20160425154611.3e7e9dc9@free-electrons.com>
	<20160425172846.GB1759@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160425172846.GB1759@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Bjorn,

On Mon, 25 Apr 2016 12:28:46 -0500, Bjorn Helgaas wrote:

> How about if you just shuffle those bits around into
> an armada8k_add_pcie_port() and an armada8k_pcie_establish_link(), and
> we'll call that good for now?

I just sent a v3 which implements this.

However, to be honest, after looking at the other drivers, I found the
XYZ_add_pcie_port() function to not be very useful: it simply
continues the work done by the probe function, and there is really no
reason to split the remaining work of the probe() in a separate
function. The XYZ_add_pcie_port() is called only one time for each
probe() call, so having a separate function is somewhat useless. In
addition, the separation of work between probe() and
XYZ_add_pcie_port() is not very consistent accross drivers. In
pci-imx6, XYZ_add_pcie_port() only sets up the interrupt handler and
calls dw_pcie_host_init(). In pci-dra7xx, XYZ_add_pcie_port() sets up
the interrupt, maps some registers and calls dw_pcie_host_init().

So my v3 implements what you suggested, and creates a
armada8k_add_pcie_port() to make it consistent with the other drivers,
but long term, I'm not sure this particular function is really useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
