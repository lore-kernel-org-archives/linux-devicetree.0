From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 3/5] PCI: st: Provide support for the sti PCIe controller
Date: Wed, 06 May 2015 17:33:33 +0200
Message-ID: <12753608.WrdVVJIhrQ@wuerfel>
References: <1428657168-12495-1-git-send-email-gabriel.fernandez@linaro.org> <CAErSpo7_ev1oYptvBObK2dS9_LXkU2_W_OMD825POE6L5Yh7Lw@mail.gmail.com> <CAG374jCfo1165cbMrip5SrYigjNkXPyc-dqgmRbTQ0Yaw3wmDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAG374jCfo1165cbMrip5SrYigjNkXPyc-dqgmRbTQ0Yaw3wmDA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry
List-Id: devicetree@vger.kernel.org

On Wednesday 06 May 2015 15:40:39 Gabriel Fernandez wrote:
> On 6 May 2015 at 15:29, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> > I don't really care which solution you end up with here.  But please
> > do take a look at how the other drivers solve the same problem.  Using
> > "device_initcall()" is unique in drivers/pci/host, and I don't believe
> > the problem is unique.  If several drivers have the same issue, they
> > should solve it the same way.
>
> I agree with last reply of Arnd.
>  I will mark the probe function as __init and use
> platform_driver_probe() to prevent the probe function from being
> deferred.
> And to prevent module unloading, i will use module_init only.
> 
> Ok i will wait before sending a v4.

I think in order to address Bjorn's concern, you should modify make sure
that the keystone and imx6 drivers that call hook_fault_code() do it
the same way. I think imx6 already does, but keystone does not, so
please send a patch for it, explaining why it's needed.

Conversely, I think the other dw-pcie based drivers should be changed
not to use an __init annotation at all, and instead use
module_platform_driver().

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
