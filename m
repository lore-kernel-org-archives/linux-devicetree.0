From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/5] PCI: designware: Add setup bus-related to pcie_host_ops
Date: Thu, 18 Dec 2014 13:58:27 +0900
Message-ID: <000e01d01a7f$47592e20$d60b8a60$%han@samsung.com>
References: <1418812486-12394-1-git-send-email-gabriel.fernandez@linaro.org>
 <1418812486-12394-5-git-send-email-gabriel.fernandez@linaro.org>
 <1507589.aeTeyNn1QF@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1507589.aeTeyNn1QF@wuerfel>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Gabriel FERNANDEZ' <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Cc: 'Arnd Bergmann' <arnd-r2nGTMty4D4@public.gmane.org>, 'Rob Herring' <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Pawel Moll' <pawel.moll-5wv7dgnIgG8@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, 'Ian Campbell' <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, 'Kumar Gala' <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, 'Srinivas Kandagatla' <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Maxime Coquelin' <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, 'Patrice Chotard' <patrice.chotard-qxv4g6HH51o@public.gmane.org>, 'Russell King' <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, 'Bjorn Helgaas' <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, 'Mohit Kumar' <mohit.kumar-qxv4g6HH51o@public.gmane.org>, 'Grant Likely' <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Gabriel Fernandez' <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Fabrice Gasnier' <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, 'Viresh Kumar' <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Thierry Reding' <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, 'Minghuan Lian' <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, 'Magnus Damm' <damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, 'Will Deacon' <will.deacon-5wv7dgnIgG8@public.gmane.org>, 'Tanmay Inamdar' <tinamdar-qTEPVZfXA3Y@public.gmane.org>, 'Murali
List-Id: devicetree@vger.kernel.org

On Thursday, December 18, 2014 7:16 AM, Arnd Bergmann wrote:
> On Wednesday 17 December 2014 11:34:45 Gabriel FERNANDEZ wrote:
> > ST sti SoCs PCIe IPs are built around DesignWare IP Core.
> > But in these SoCs PCIe IP doesn't support IO.

Hi Gabriel,

I cannot understand how ST sti SoCs PCIe IP does not support I/O.
As far as I know, it cannot be selected by the 'parameter'.
Then, H/W engineers dropped out the I/O control logic?

> >
> > To support this, add setup_bus() to pcie_host_ops.


> >
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
> > Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> The dw-pcie driver should be able to tell whether the device has
> an I/O space or not, and do the right thing based on that. Don't
> add an implementation specific callback for that.

I agree with Arnd's opinion.

In addition, I have one more question.
Then, if a device that requires I/O region is connected to
PCIe slot of ST sti SoCs PCIe, what will happen?
It just prints error messages?

Best regards,
Jingoo Han

> 
> 	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
