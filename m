From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 3/5] PCI: st: Provide support for the sti PCIe controller
Date: Wed, 6 May 2015 08:29:14 -0500
Message-ID: <CAErSpo7_ev1oYptvBObK2dS9_LXkU2_W_OMD825POE6L5Yh7Lw@mail.gmail.com>
References: <1428657168-12495-1-git-send-email-gabriel.fernandez@linaro.org>
 <1428657168-12495-4-git-send-email-gabriel.fernandez@linaro.org>
 <20150505221646.GE24643@google.com> <CAG374jAv9aHBPGV+x+xs2MyRGz+fw1ymwu78fqNXDPtPqehgZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAG374jAv9aHBPGV+x+xs2MyRGz+fw1ymwu78fqNXDPtPqehgZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry
List-Id: devicetree@vger.kernel.org

On Wed, May 6, 2015 at 4:14 AM, Gabriel Fernandez
<gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Bjorn,
>
> On 6 May 2015 at 00:16, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
>> On Fri, Apr 10, 2015 at 11:12:46AM +0200, Gabriel FERNANDEZ wrote:
>>> sti pcie is built around a Synopsis Designware PCIe IP.
>>>
>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
>>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>>> +/* ST PCIe driver does not allow module unload */
>>
>> Is there something that prevents module unload, or is it just untested?
>>
> Yes we haven't tested
>
>>> +static int __init pcie_init(void)
>>> +{
>>> +     return platform_driver_probe(&st_pcie_driver, st_pcie_probe);
>>> +}
>>> +device_initcall(pcie_init);
>>
>> Can you use module_platform_driver_probe() or module_init() here?
>>
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

I don't really care which solution you end up with here.  But please
do take a look at how the other drivers solve the same problem.  Using
"device_initcall()" is unique in drivers/pci/host, and I don't believe
the problem is unique.  If several drivers have the same issue, they
should solve it the same way.

> If you are ok i will send a v4 ?

I think I'll have a few questions about the designware changes, too,
so you might want to wait a day or two.

>>> +MODULE_AUTHOR("Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>");
>>> +MODULE_DESCRIPTION("PCI express Driver for ST SoCs");
>>> +MODULE_LICENSE("GPL v2");
>>> --
>>> 1.9.1
>>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
