From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v4 3/4] drivers/amba: create devices from device tree
Date: Fri, 10 Jun 2011 16:30:42 -0600
Message-ID: <20110610223042.GE28994@ponder.secretlab.ca>
References: <1307738923-7564-1-git-send-email-robherring2@gmail.com>
	<1307738923-7564-4-git-send-email-robherring2@gmail.com>
	<201106102304.06279.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201106102304.06279.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2011 at 11:04:06PM +0200, Arnd Bergmann wrote:
> On Friday 10 June 2011 22:48:42 Rob Herring wrote:
> > 
> > +#ifdef CONFIG_OF
> > +int of_amba_device_create(struct device_node *node, struct device *parent);

Actually, it would probably be good to have of_amba_device_create()
return a pointer to the created amba_device.

> > +#endif
> > +
> > +#else
> > +
> > +#ifdef CONFIG_OF
> > +static inline int of_amba_device_create(struct device_node *node, 
> > +                                       struct device *parent)
> > +{
> > +       return 0;
> > +}
> > +#endif
> > +
> 
> We normally don't use #ifdef around declarations like this, it doesn't
> hurt to have them even when the code is not there. Otherwise the patch
> looks good.

Yes, this hook will never get called or referenced by anything if
CONFIG_OF is not selected.  The only real user of it will be
drivers/of/platform.c

g.
