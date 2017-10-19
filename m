From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH 08/10] PCI: dwc: artpec6: add support for endpoint mode
Date: Thu, 19 Oct 2017 00:59:12 -0700
Message-ID: <20171019075912.GA10089@infradead.org>
References: <20171013160914.3220-1-niklas.cassel@axis.com>
 <20171013160914.3220-9-niklas.cassel@axis.com>
 <20171016234326.GM25517@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171016234326.GM25517-1RhO1Y9PlrlHTL0Zs8A6p5iNqAH0jzoTYJqu5kTmcBRl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>, Niklas Cassel <niklass-VrBV9hrLPhE@public.gmane.org>, Jesper Nilsson <jespern-VrBV9hrLPhE@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Xiaowei Song <songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomasz Nowicki <tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Gabriele Paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>, linux-arm-kernel-VrBV9hrLPhE@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 16, 2017 at 06:43:26PM -0500, Bjorn Helgaas wrote:
> understand it.  I guess the idea is to build pcie-artpec6.o if either
> CONFIG_PCIE_ARTPEC6_HOST or CONFIG_PCIE_ARTPEC6_EP is set (or both).
> 
> Is this really the simplest way to express that in Kconfig?  Both the
> "if PCIE_ARTPEC6" and this ifneq thing are complicated and relatively
> unusual.

I thĳnk the right style is to make PCIE_ARTPEC6 a hidden kconfig
symbol without help text, and then have PCIE_ARTPEC6_HOST and
PCIE_ARTPEC6_EP select it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
