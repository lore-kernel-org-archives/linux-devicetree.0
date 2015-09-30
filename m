From: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/4] PCI: st: Provide support for the sti PCIe controller
Date: Wed, 30 Sep 2015 11:18:45 +0200
Message-ID: <CAG374jAx8DN8GXkv7O0jcgnvVTnH4U3LegX-hPq5RWo1_cy+OQ@mail.gmail.com>
References: <1440678857-27118-1-git-send-email-gabriel.fernandez@linaro.org>
 <1440678857-27118-4-git-send-email-gabriel.fernandez@linaro.org> <CAHM4w1=g=UFoz=R-6hxJC0=fSieN1WDvZT97ykL1b3_YPhBjZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHM4w1=g=UFoz=R-6hxJC0=fSieN1WDvZT97ykL1b3_YPhBjZg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding@>
List-Id: devicetree@vger.kernel.org

Hi Pratyush,

Thanks for the review.

Best regards

Gabriel

On 27 August 2015 at 19:31, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Gabriel,
>
> Looks good to me.
>
> On Thu, Aug 27, 2015 at 6:04 PM, Gabriel Fernandez
> <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> sti pcie is built around a Synopsis Designware PCIe IP.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
>
>> +static int st_pcie_link_up(struct pcie_port *pp)
>> +{
>> +       u32 status;
>> +       int link_up;
>
> nit: why not bool

i prefer to keep it as 'int' because the prototype of link_up callback
is an 'int'.

>
>> +       int count = 0;
>
> [...]
>
>> +static void st_pcie_board_reset(struct pcie_port *pp)
>> +{
>> +       struct st_pcie *pcie = to_st_pcie(pp);
>> +
>> +       if (!gpio_is_valid(pcie->reset_gpio))
>> +               return;
>> +
>> +       if (gpio_direction_output(pcie->reset_gpio, 0)) {
>> +               dev_err(pp->dev, "Cannot set PERST# (gpio %u) to output\n",
>> +                       pcie->reset_gpio);
>> +               return;
>> +       }
>> +
>> +       /* From PCIe spec */
>> +       msleep(2);
>> +       gpio_direction_output(pcie->reset_gpio, 1);
>> +
>> +       /*
>> +        * PCIe specification states that you should not issue any config
>> +        * requests until 100ms after asserting reset, so we enforce that here
>> +        */
>> +       msleep(100);
>
> IIRC, specification says to wait after link training completes. So
> shouldn't it be after st_pcie_enable_ltssm. Moreover, I wonder why
> others do not need it.
>
Ok i will fix it.

> Reviewed-by: Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
