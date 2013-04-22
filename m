From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] drivers: bus: add ARM CCI support
Date: Mon, 22 Apr 2013 11:18:58 -0400 (EDT)
Message-ID: <alpine.LFD.2.03.1304221118100.17375@syhkavp.arg>
References: <1365691679-28674-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1365691679-28674-2-git-send-email-lorenzo.pieralisi@arm.com>
 <51702B70.9000908@codeaurora.org>
 <alpine.LFD.2.03.1304181341020.17375@syhkavp.arg>
 <20130422142457.GM14496@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130422142457.GM14496-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 22 Apr 2013, Russell King - ARM Linux wrote:

> On Thu, Apr 18, 2013 at 01:54:04PM -0400, Nicolas Pitre wrote:
> > On Thu, 18 Apr 2013, Stephen Boyd wrote:
> > 
> > > On 04/11/13 07:47, Lorenzo Pieralisi wrote:
> > > > diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
> > > > new file mode 100644
> > > > index 0000000..81953de
> > > > --- /dev/null
> > > > +++ b/drivers/bus/arm-cci.c
> > > [...]
> > > > +static void notrace cci_port_control(unsigned int port, bool enable)
> > > > +{
> > > > +	void __iomem *base = ports[port].base;
> > > > +
> > > > +	if (!base)
> > > > +		return;
> > > > +
> > > > +	writel_relaxed(enable, base + CCI_PORT_CTRL);
> > > > +	while (readl_relaxed(cci_ctrl_base + CCI_CTRL_STATUS) & 0x1)
> > > > +			;
> > > 
> > > cpu_relax()?
> > 
> > In some cases there is no more cache coherence when this is called and 
> > the hardware might not be in a good state to cope with whatever action 
> > people might be tempted to insert into cpu_relax().  After the CCI is 
> > disabled it is important to keep a low profile and not touch anything 
> > global. With some early hardware revision, even a DMB here was harmful.
> 
> It would be useful if there was a comment in the code explaining this.
> As it stands, you _will_ get a stream of patches from kernel janitors
> itching to add cpu_relax() there.

Absolutely right.


Nicolas
