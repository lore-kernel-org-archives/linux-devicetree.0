From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v2 2/5] clocksource: time-armada-370-xp: add local
 timer support
Date: Fri, 15 Feb 2013 16:48:06 -0500
Message-ID: <20130215214806.GH14746@titan.lakedaemon.net>
References: <1359135165-32108-1-git-send-email-gregory.clement@free-electrons.com>
 <1359135165-32108-3-git-send-email-gregory.clement@free-electrons.com>
 <20130215212130.GC14746@titan.lakedaemon.net>
 <511EAB9F.9060609@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <511EAB9F.9060609-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jani Monoses <jani.monoses-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Leif Lindholm <leif.lindholm-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Van Hoof <vanhoof-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 15, 2013 at 10:41:51PM +0100, Gregory CLEMENT wrote:
> On 02/15/2013 10:21 PM, Jason Cooper wrote:
> > On Fri, Jan 25, 2013 at 06:32:42PM +0100, Gregory CLEMENT wrote:
> >> On the SOCs Armada 370 and Armada XP, each CPU comes with two private
> >> timers. This patch use the timer 0 of each CPU as local timer for the
> >> clockevent if CONFIG_LOCAL_TIMER is selected. In the other case, use
> >> only the private Timer 0 of CPU 0.
> >>
> >> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >> ---
> >>  drivers/clocksource/time-armada-370-xp.c |  150 ++++++++++++++++++++++--------
> >>  1 file changed, 112 insertions(+), 38 deletions(-)
> > 
> > After applying the first two patches in this series to mvebu/drivers I get:
> > 
> >   CC      arch/arm/mach-mvebu/irq-armada-370-xp.o
> > arch/arm/mach-mvebu/irq-armada-370-xp.c: In function 'armada_370_xp_mpic_irq_map':
> > arch/arm/mach-mvebu/irq-armada-370-xp.c:87:11: error: 'ARMADA_370_XP_MAX_PER_CPU_IRQS' undeclared (first use in this function)
> > arch/arm/mach-mvebu/irq-armada-370-xp.c:87:11: note: each undeclared identifier is reported only once for each function it appears in
> > make[1]: *** [arch/arm/mach-mvebu/irq-armada-370-xp.o] Error 1
> > make: *** [arch/arm/mach-mvebu] Error 2
> > 
> > with mvebu_defconfig.
> > 
> > Is there a dependency I missed?  I'm not finding anything obvious.  The
> > same occurs if I enable LOCAL_TIMER.
> 
> It depends on "arm: mvebu: Improve the SMP support of the interrupt controller"
> 
> As you have pulled this patch few weeks ago I forgot to this dependency, sorry.

Cool, thanks!

Jason.
