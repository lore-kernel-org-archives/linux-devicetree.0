From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH v5 0/1] drivers: mfd: Versatile Express SPC support
Date: Thu, 18 Jul 2013 10:28:09 +0100
Message-ID: <20130718092809.GA29977@e102568-lin.cambridge.arm.com>
References: <1373990743-23106-1-git-send-email-lorenzo.pieralisi@arm.com>
 <20130717210700.GA19864@zurbaran>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130717210700.GA19864@zurbaran>
Content-Disposition: inline
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
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Achin Gupta <Achin.Gupta-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Samuel,

On Wed, Jul 17, 2013 at 10:07:00PM +0100, Samuel Ortiz wrote:
> Hi Lorenzo,
> 
> On Tue, Jul 16, 2013 at 05:05:42PM +0100, Lorenzo Pieralisi wrote:
> > Hello,
> > 
> > version v5 of VExpress SPC driver, please read on the changelog for major
> > changes and explanations.
> > 
> > The probing scheme is unchanged, since after trying the early platform
> > devices approach it appeared that the end result was no better than the
> > current one. The only clean solution relies either on changing how
> > secondaries are brought up in the kernel (later than now) or enable
> > early platform device registration through DT. Please check this
> > thread for the related discussion:
> > 
> > https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-June/036542.html
> > 
> > The interface was adapted to regmap and again reverted to old driver for
> > the following reasons:
> > 
> > - Power down registers locking is hairy and requires arch spinlocks in
> >   the MCPM back end to work properly, normal spinlocks cannot be used
> > - Regmap adds unnecessary code to manage SPC since it is just a bunch of
> >   registers used to control power management flags, the overhead is just
> >   not worth it (talking about power down registers, not the vexpress config
> >   interface)
> > - The locking scheme behind regmap requires all registers in the map
> >   to be protected with the same lock, which is not exactly what we want
> >   here
> > - Given the reasons above, adding a regmap interface buys us nothing from
> >   a driver readability and maintainability perspective (again just talking
> >   about the power interface, a few registers) because for the SPC it would
> >   simply not be used
> > 
> > /drivers/mfd is probably not the right place for this code as it stands (but
> > probably will be when the entire driver, with DVFS and config interface, is
> > complete).
> Could you please elaborate on how will the SPC driver extend into an MFD
> driver?

Reading through the thread I noticed Nico explained details properly, I
was about to mention a possible solution to the directory issue but I am
pretty sure that what he did will turn out for the best.

Usually, or better, historically, these pieces of code that program
PMICs lived in arch/arm/mach-* directories and that's something we could
have done as well (create a static mapping and write some functions to
peek and poke a few registers), but we thought that it was not the proper
way to go.

On top of that, the SPC is part of a component whose register space maps
disparate functions (config interface for voltage, clocks, energy probes,
frequency scaling and power states management) and basically that's the
reason we struggled to partition it properly (with further complexity
implied by the way requests - config and frequency scaling - have to be
serialized).

I hope the end result is reasonable, and overall I think it was a debate
that was worth having.

Thank you,
Lorenzo
