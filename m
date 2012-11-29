From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [GIT PULL] Exynos DP for v3.8
Date: Thu, 29 Nov 2012 06:42:22 +0000 (GMT)
Message-ID: <631281.130371354171340233.JavaMail.weblogic@epml16>
Reply-To: jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
MIME-version: 1.0
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "FlorianSchandinat-Mmb7MZpHnFY@public.gmane.org" <FlorianSchandinat-Mmb7MZpHnFY@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday, November 29, 2012 4:58 AM, Rob Herring wrote
> On 11/27/2012 05:59 PM, Jingoo Han wrote:
> > On Tuesday, November 27, 2012 6:58 PM, Tomi Valkeinen wrote
> >>
> >> On 2012-11-23 08:37, Jingoo Han wrote:
> >>> Hi Tomi,
> >>>
> >>> Thank you for taking care of pull requests for the v3.8 merge window.
> >>> These patches have been submitted for more than one month,
> >>> and tested with Exynos5250.
> >>>
> >>> The following changes since commit f4a75d2eb7b1e2206094b901be09adb31ba63681:
> >>>
> >>>   Linux 3.7-rc6 (Fri Nov 16 17:42:40 2012 -0800)
> >>>
> >>> are available in the git repository at:
> >>>   git://github.com/jingoo/linux.git exynos-dp-next
> >>>
> >>> ----------------------------------------------------------------
> >>> Exynos DP changes for the 3.8 merge window.
> >>>
> >>> - Device Tree support for Samsung Exynos DP
> >>> - SW Link training is cleaned up.
> >>> - HPD interrupt is supported.
> >>> ----------------------------------------------------------------
> >>>
> >>> Ajay Kumar (5):
> >>>       video: exynos_dp: Add device tree support to DP driver
> >>>       video: exynos_dp: device tree documentation
> >>>       video: exynos_dp: Reset and initialize DP before requesting irq
> >>>       video: exynos_dp: Fix incorrect setting for INT_CTL
> >>>       video: exynos_dp: remove redundant parameters
> >>>
> >>> Sean Paul (8):
> >>>       video: exynos_dp: Check DPCD return codes
> >>>       video: exynos_dp: Clean up SW link training
> >>>       video: exynos_dp: Get pll lock before pattern set
> >>>       video: exynos_dp: Improve EDID error handling
> >>>       video: exynos_dp: Fix bug when checking dp->irq
> >>>       video: exynos_dp: Remove sink control to D0
> >>>       video: exynos_dp: Move hotplug into a workqueue
> >>>       video: exynos_dp: Enable hotplug interrupts
> >>>
> >>>  .../devicetree/bindings/video/exynos_dp.txt        |   80 +++
> >>>  drivers/video/exynos/exynos_dp_core.c              |  697 ++++++++++++--------
> >>>  drivers/video/exynos/exynos_dp_core.h              |   21 +-
> >>>  drivers/video/exynos/exynos_dp_reg.c               |   77 ++-
> >>>  drivers/video/exynos/exynos_dp_reg.h               |    3 +-
> >>>  5 files changed, 583 insertions(+), 295 deletions(-)
> >>>  create mode 100644 Documentation/devicetree/bindings/video/exynos_dp.txt
> >>
> >> Has the DT bindings been reviewed by the device tree people? It would
> >> good to have an ack from them.
> >
> > CC'ed device tree mailing-list, Grant Likely, Rob Herring, Kukjin Kim, Sylwester Nawrocki.
> >
> > Hi Tomi,
> >
> > The DT binding has been posted with device tree mailing-list
> > (devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org) for more than 2 months.
> > Last patch V8 was posted 1 month ago. However, there is no objection.
> > (http://www.spinics.net/lists/linux-fbdev/msg08354.html)
> >
> > Also, Samsung people already reviewed it.
> > In my opinion, there is no need to get Ack from the device tree people.
> 
> Grant and I can't possibly review every binding for every device of
> every subsystem.
> 
> While I think there is possibility to make this more common across
> platforms, I don't have any major issues with the binding, so:
> 
> Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Hi Rob,
I added your Acked-by to DT binding patch. Thank you. :)
(https://github.com/jingoo/linux/commit/825e90d0a138738657509d7460d77edb28fcfdc0)

Tomi,
I have an Ack from a Device tree Maintainer, Rob Herring. 
Please, pull the patches.

Best regards,
Jingoo Han

> 
> Rob
> 
> > Grant, Rob: if you have another opinion, please let me know kindly.
> >
> > Best regards,
> > Jingoo Han
> >
> > _______________________________________________
> > devicetree-discuss mailing list
> > devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > https://lists.ozlabs.org/listinfo/devicetree-discuss
> >
