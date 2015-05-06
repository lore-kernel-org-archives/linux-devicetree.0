From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 3/5] PCI: st: Provide support for the sti PCIe controller
Date: Wed, 06 May 2015 11:24:58 +0200
Message-ID: <2236679.A9NfANRyhD@wuerfel>
References: <1428657168-12495-1-git-send-email-gabriel.fernandez@linaro.org> <20150505221646.GE24643@google.com> <CAG374jAv9aHBPGV+x+xs2MyRGz+fw1ymwu78fqNXDPtPqehgZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAG374jAv9aHBPGV+x+xs2MyRGz+fw1ymwu78fqNXDPtPqehgZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, "kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org" <kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Muralidharan Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TasMV2rI37PzA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 06 May 2015 11:14:25 Gabriel Fernandez wrote:
> 
> >> +static int __init pcie_init(void)
> >> +{
> >> +     return platform_driver_probe(&st_pcie_driver, st_pcie_probe);
> >> +}
> >> +device_initcall(pcie_init);
> >
> > Can you use module_platform_driver_probe() or module_init() here?
> >
> 
> Yes we can use module_init() here.
> 
> By the way if figure out i removed __init attribute on st_pcie_probe()
> in previous version to follow Arnd's remark.
> But st_pcie_probe calls hook_fault_code() that has __init attribute.
> So I think we need to keep __init for probe routine ?
> Also, we have to restrict bind/unbind with "suppress_bind_attrs" in
> platform_driver structure.
> This is the main reason to not allow module unload/reload.
> 
> If you are ok i will send a v4 ?
> 

If you mark the probe function as __init, you have to use
module_platform_driver_probe() or platform_driver_probe() instead,
to prevent the probe function from being deferred.

Calling hook_fault_code() also means you need to prevent module
unloading, by providing only a module_init but not a module_exit
function, so module_platform_driver_probe() also won't work.

It may be a good idea to work on improving the hook_fault_code()
infrastructure to make it more usable with loadable device drivers.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
