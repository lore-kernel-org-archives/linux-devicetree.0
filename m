From: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: "status" property checks
Date: Fri, 08 Jan 2010 11:45:28 -0800
Message-ID: <1262979928.31871.81.camel@localhost.localdomain>
References: <1262905673.11702.16.camel@localhost.localdomain>
	<1262918143.2716.8.camel@ccs-laptop>
	<1262975655.31871.67.camel@localhost.localdomain>
	<4B478747.8070009@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4B478747.8070009-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Hunter Cobbs <hunter.cobbs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2010-01-08 at 13:28 -0600, Scott Wood wrote:
> Hollis Blanchard wrote:
> > On Thu, 2010-01-07 at 20:35 -0600, Hunter Cobbs wrote:
> >> I think that is definitely a solution.  It does centralize the testing
> >> for this particular issue.  The only thing question I have is if its
> >> really better to have the upper level do the check.  Shouldn't the
> >> driver itself handle the hardware and device node status?
> > 
> > Practically speaking, all drivers doing the checks today just return
> > -ENODEV. They don't try to do anything to "handle" the situation.
> > 
> > The definition of the status property implies it's outside of software's
> > control, for example:
> >         "disabled"
> >         "Indicates that the device is not presently operational, but it
> >         might become operational in the future (for example, something
> >         is not plugged in, or switched off)."
> > 
> > If a device is "not operational" in this sense, I don't think there's
> > anything for a device driver to do.
> 
> I could see situations where there is some software action that could 
> enable the device (e.g. multiple devices sharing pins, where only one 
> can be active at a time) -- but it's likely to not be the driver itself 
> that knows how to do that.
> 
> If the need arises, there could be a mechanism where the enabling entity 
> can tell the platform bus that it has enabled a previously-disabled 
> device, overriding the status in the device tree (and likewise if it 
> wants take down a device that was previously enabled).

OK, that makes sense to me. I'll put together a patch for the original
idea, and the enable/disable part can come later as needed.

-- 
Hollis Blanchard
Mentor Graphics, Embedded Systems Division
