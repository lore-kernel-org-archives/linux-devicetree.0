From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH v2 12/13] ARM: mach-vt8500: cpus/cpu nodes dts updates
Date: Tue, 23 Apr 2013 10:16:18 +0100
Message-ID: <20130423091618.GB22946@e102568-lin.cambridge.arm.com>
References: <1366644455-16550-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366644455-16550-13-git-send-email-lorenzo.pieralisi@arm.com>
 <5175EE3E.7080809@prisktech.co.nz>
 <5175EFFE.7020903@prisktech.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5175EFFE.7020903-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
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
To: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 23, 2013 at 03:20:46AM +0100, Tony Prisk wrote:
> On 23/04/13 14:13, Tony Prisk wrote:
> > On 23/04/13 03:27, Lorenzo Pieralisi wrote:
> >> This patch updates the in-kernel dts files according to the latest cpus
> >> and cpu bindings updates for ARM.
> >>
> >> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> >> ---
> >>   arch/arm/boot/dts/wm8505.dtsi | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm/boot/dts/wm8505.dtsi 
> >> b/arch/arm/boot/dts/wm8505.dtsi
> >> index e74a1c0..a470808 100644
> >> --- a/arch/arm/boot/dts/wm8505.dtsi
> >> +++ b/arch/arm/boot/dts/wm8505.dtsi
> >> @@ -13,7 +13,7 @@
> >>         cpus {
> >>           cpu@0 {
> >> -            compatible = "arm,arm926ejs";
> >> +            compatible = "arm,arm926";
> >>           };
> >>       };
> > As the only author for that file, and the arch-vt8500 maintainer, a CC 
> > would have been nice :)
> >
> > This binding is still incomplete.device_type, compatible and reg are 
> > all required properties.
> > Also, you seem to have only fixed the wm8505.dtsi, while vt8500.dtsi, 
> > wm8650.dtsi and wm8850.dtsi are all left incorrect.
> >
> > I am already carrying a patch to fix all this properly so could you 
> > drop the arch-vt8500 related patch and I will send in a more complete 
> > version for 3.11
> >
> > Regards
> > Tony Prisk
> 
> I didn't notice the rules had been changed in the last patch - shouldn't 
> you be changing the rules (read: binding) before changing the devicetree 
> files?

Fair enough, point taken.

> Request still stands - please drop this patch and I will submit a more 
> complete one with the other SoCs updated as well.

Great, thanks,
Lorenzo
