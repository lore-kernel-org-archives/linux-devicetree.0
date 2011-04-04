From: "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>
Subject: Re: [PATCH] uio/pdrv_genirq: Add OF support
Date: Mon, 4 Apr 2011 19:04:38 +0200
Message-ID: <20110404170437.GA4830@local>
References: <1301574600-4861-1-git-send-email-monstr@monstr.eu>
	<1301574600-4861-2-git-send-email-monstr@monstr.eu>
	<20110331124925.GA2202@pengutronix.de> <4D948189.9070606@monstr.eu>
	<20110331170321.GA2734@local> <4D94C09B.4070506@monstr.eu>
	<20110331192302.GD2734@local>
	<AANLkTin6iSVQtKo602hceod+4=cVUMG=GR7cCZvHg4nO@mail.gmail.com>
	<20110331203024.GE2734@local>
	<20110402103550.GA21760@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110402103550.GA21760-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 02, 2011 at 12:35:50PM +0200, Wolfram Sang wrote:
> 
> > For UIO, it is not enough to just know "we have this chip using that driver",
> > at least not for a generic driver like the one proposed in this patch.
> 
> So, what about setting this string to a default (e.g. '0' or 'generic' or
> whatever). Then, userspace knows this is the unmodified upstream version of the
> generic driver.

A "generic driver" should always be unmodified since you don't know who else
might be using it. With uio_pdrv_genirq it is different when used with
platform devices (which is its original purpose), since in the same file where
you setup your struct uio_info you can also have code to initialize the device.

Therefore, platform devices need the ability to adjust the version attribute.
Device tree code should probably don't touch it and leave it at a default value
as you suggested.

> If the generic driver is not sufficent for a user and he
> patches it, he can simply patch the version string, too?

Or better write a dedicated driver. Patching a generic thing like uio_pdrv_genirq
can only be done in specialized drivers in a project. That's hackery that won't
make it into mainline anyway.

> 
> Or can we use the notifiers to set up an individual version? That could also be
> the place to do special board-setup connected to the selected version.

How could that look like? If you have an idea for a generic solution, you're
welcome.

Thanks,
Hans
