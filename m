From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Bad DT binding (hisi-pcie-almost-ecam)
Date: Fri, 10 Mar 2017 17:40:45 +0000
Message-ID: <20170310174045.GB24571@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dongdong Liu <liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Gabriele Paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

I've just spotted commit:

  a2ec1996098c7da0 ("PCI: hisi: Add DT almost-ECAM support for Hip06/Hip07 host controllers")

... which went in for v4.11-rc1.

I hadn't seen this until now, and as far as I can tell this never went
to the devicetree list.

The commit adds the "hisilicon,pcie-almost-ecam", which goes against the
usual DT conventions, and is non-sensical in that it describes the IP
based on what it isn't.

This binding shouldn't have gone in as-is, and we should fix it before
v4.11.

The binding states that this IP is found in Hip06 and Hip07. For these
cases we'd usually take the name of the first implementation, e.g.
something like "hisilicon,hip06-pcie", which can be used as a fallback
in the compatible list if reused in subsequent SoC generations.

I also see that "hisilicon,hip06-pcie" already exists, so I'm even more
suspicious.

What exactly is the "hisilicon,pcie-almost-ecam" binding trying to
describe? Is it a different IP also found on Hip06, or is it a new
binding for the same IP?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
