From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC] early init and DT platform devices allocation/registration
Date: Tue, 25 Jun 2013 18:07:00 +0100
Message-ID: <20130625170700.GB28654@e102568-lin.cambridge.arm.com>
References: <20130624163340.GB26084@e102568-lin.cambridge.arm.com>
 <CACxGe6sPaV-sBz=SF46KdUexjAhWKGrMpG_ty+K26f6ZU5iKdg@mail.gmail.com>
 <51C9AF96.3040107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51C9AF96.3040107-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2013 at 03:56:22PM +0100, Stephen Warren wrote:
> On 06/25/2013 05:45 AM, Grant Likely wrote:
> > On Mon, Jun 24, 2013 at 5:33 PM, Lorenzo Pieralisi
> > <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> >> Hi all,
> >>
> >> I am dealing with a lingering problem related to init and probing of platform
> >> devices early (before initcalls) in the kernel boot process. The problem,
> >> which is nothing new, is related to how platform devices are created in the
> >> kernel from DT and when they become available. Platform devices are created
> >> through (assuming any legacy static initialization is removed from the kernel)
> >>
> >> of_platform_populate()
> >>
> >> at arch_initcall time on ARM. This is a problem for drivers that need to be
> >> probed and initialized before arch_initcall (ie early_initcall) because
> >> the corresponding platform_device has not been created yet.
> 
> What's the use-case here; why does the driver /have/ to be
> allocated/probed so early? Can't drivers all be allocated from DT in the
> usual fashion, and any dependencies resolved using deferred probe? In
> almost all cases, that should work.

The driver must be initialized in order to boot secondary CPUs, so
very very early, its initialization cannot be deferred.
Otherwise we would end up with MCPM back-end having to add ad-hoc
kludges to boot secondary CPUs, and then replace the early function calls
to the power controller drivers when the power controller has been
properly initialized. Feasible, but really horrible.

On top of that, the HW component is an IP that provides functionality
beyond power management, so we really want it to be initialized and
running after boot, we cannot just hide a couple of function calls in
the MCPM back-end to boot the CPUs and forget about that IP afterwards.

> ...
> >> How this problem is supposed to be solved in the kernel ?
> >>
> >> 1- drivers that are to be up and running at early_initcall time must not
> >>    rely on the device/driver model (but then they cannot use any API that
> >>    requires a struct device to function (eg regmap))
> >> 2- the driver should allocate a platform device at early initcall from
> >>    a DT compatible node. Do not know how to deal with platform device
> >>    duplication though, since of_platform_populate() will create another
> >>    platform device when the node is parsed
> > 
> > While I've resisted it in the past, I would be okay with adding struct
> > device pointer in the device_node structure. I've resisted because I
> > don't want drivers following the device_node pointer and making an
> > assumption about what /kind/ of device is pointed to by it. However,
> > this is an important use case and it makes it feasible to use an early
> > platform device with of_platform_populate.
> 
> Hiroshi (who I have CC'd here) has also been asking about this same
> issue downstream. The issue for us is that we need to initialize an SMMU
> driver before any devices that are translated by the SMMU. One option is
> to force the register/probe of the SMMU driver explicitly, early in the
> machine's .init_machine() callback, before of_platform_populate(), to
> ensure the ordering. Then, we run into the same duplicate device issue,
> and the change Grant mentions above would help solve this.

Good to hear we are not alone. I still do not know if we are dealing
with specific use cases or this is a problem that should be solved
generically at kernel level. I think it is best to solve it once for
all, otherwise we will all come up with workarounds to make things work,
possibly violating the driver/device model usage guidelines.

Lorenzo
