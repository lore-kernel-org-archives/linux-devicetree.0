From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [GIT PULL v3] ARM: kirkwood: fdt: convert kirkwood init funcs to
 fdt
Date: Mon, 5 Mar 2012 15:16:56 +0100
Message-ID: <20120305141656.GA14449@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> On Sun, Mar 04, 2012 at 10:41:13PM -0500, Jason Cooper wrote:
> >       rtc-mv: more accurate compatible strings
> >       orion-wdt: more accurate compatible strings
> ...
> >  arch/arm/boot/dts/kirkwood-dreamplug.dts |   34 +++++++++++++++
> >  arch/arm/boot/dts/kirkwood.dtsi          |   12 +++++
> 
> This is still bugging me.  If, say, orion_wdt.c is common to all of
> plat-orion/ shouldn't it be in an 'orion.dtsi'?  With compatible =
> "marvell,orion-wdt"?  Then, if hypothetically, kirkwood used the same
> driver but had a small tweak, then kirkwood.dtsi would have
> "marvell,kirkwood-wdt"?  Which would let the driver know that it needed
> to apply the tweak because it was kirkwood.
> 
> In this scenario, since kirkwood and dreamplug currently need no
> modifications to the default wdt driver, they would just inherit
> orion.dtsi's "marvell,orion-wdt", right?
> 
> On the driver side, since it currently has no subarch or board specific
> tweaks, then it is *only* good for the generic case,
> "marvell,orion-wdt", and thus should only match it for now.
> 
> If the above is correct, then I should create orion.dtsi, which is
> included by kirkwood.dtsi.  orion.dtsi should hold "marvell,orion-wdt"
> and "marvell,orion-rtc".  The corresponding drivers should only match
> those generic strings, since there are no specific tweaks.

Hi Jason

I would agree with you in principal, that most of the drivers used by
kirkwood are generic orion drivers. There is one clear exception to
this, and that is the audio driver, which is specific to Kirkwood.

However, what differs between all the different plat-orion SoC is the
address map and interrupts. So the dove wdt is in a different place to
the orion5x wdt, and uses a different interrupt line, etc.

So i expect in the end we have a dove.dtsi, a orion5x.dtsi, a
mv78xx0.dtsi and a kirkwood.dtsi which all look very similar, but have
different values for addresses and interrupts.

Maybe DT has some why to handle this? 

As to naming, i think you are correct. It should be
"marvell,orion-wdt" in all the different .dtsi files, since its the
same SoC IP in all Orion devices. Same with "marvell,orion-rtc" since
all orion based SoC have the same built in RTC IP.

    Andrew
