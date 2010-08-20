From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 09/14] ARM: ARM flash driver DT port
Date: Fri, 20 Aug 2010 11:29:49 +0100
Message-ID: <1282300189.3888.4.camel@e102109-lin.cambridge.arm.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-10-git-send-email-lorenzo.pieralisi@arm.com>
	<AANLkTik2gPYrP+xh-jhFLWjVbr8dwCuCMnVXXvYP56e4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTik2gPYrP+xh-jhFLWjVbr8dwCuCMnVXXvYP56e4-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Philippe Robin <philippe.robin-5wv7dgnIgG8@public.gmane.org>, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2010-08-18 at 22:22 +0100, Grant Likely wrote:
> On Wed, Aug 18, 2010 at 12:59 PM, Lorenzo Pieralisi
> <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> > When OF is enabled drivers should initialize the driver match table
> > to allow the kernel to find and recognise drivers suitable for
> > devices. The initialization is carried out through a static inline
> > function at driver init time.
> >
> > This patch adds a match table and relative init code to support
> > device tree probing methodology for the ARM flash driver.
> >
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  drivers/mtd/maps/integrator-flash.c |    6 ++++++
> >  1 files changed, 6 insertions(+), 0 deletions(-)
> >
> > diff --git a/drivers/mtd/maps/integrator-flash.c b/drivers/mtd/maps/integrator-flash.c
> > index 2aac41b..aa9a556 100644
> > --- a/drivers/mtd/maps/integrator-flash.c
> > +++ b/drivers/mtd/maps/integrator-flash.c
> > @@ -291,6 +291,11 @@ static int armflash_remove(struct platform_device *dev)
> >        return 0;
> >  }
> >
> > +static struct of_device_id armflash_matches[] = {
> > +       { .compatible = "arm,arm-flash"},
> 
> (Assuming I'm reading the integrator-flash driver correctly...) When
> using the device tree, the entire flash map should be encoded in the
> tree, and this mapping driver is no longer needed.  See
> mtd/maps/physmap_of.c.

BTW, I managed to get the RealView boards working with physmap.c instead
of the integrator flash (same functionality, just different drivers). We
could do the same for Versatile Express and get rid of the integrator
flash entirely.

-- 
Catalin
