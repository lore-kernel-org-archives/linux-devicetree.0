From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: vexpress: initial device tree support
Date: Wed, 21 Sep 2011 16:49:39 +0100
Message-ID: <20110921154939.GF2872@arm.com>
References: <1316596786-2539-1-git-send-email-dave.martin@linaro.org>
	<4E79E588.6010703@gmail.com> <20110921142425.GE2872@arm.com>
	<1316615590.4611.624.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316615590.4611.624.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-CfjtxxwdHycX+EX/Zwu52A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2011 at 03:33:10PM +0100, Pawel Moll wrote:
> > OK, I'll try to propose documentation for these:
> >         * arm,pl180
> 
> You can skip this one - I'll add the description together with the MMCI
> driver bindings (it will be 180 and 181, by the way :-)

Done.

> > > > +			// Timer init is hardcoded in v2m_timer_init(), for now.
> > > > +			// timer@11000 {
> > > > +			//	compatible = "arm,arm-sp804";
> > > 
> > > arm,sp804 is more consistent. I believe the sp804 does have the periphid
> > > registers, so arm,primecell should also be added.
> > 
> > Do you mean "does not have"?  If so, the periphid will be needed -- thanks for
> > pointing it out in that case.
> 
> I think Rob meant it should be
> 	compatible = "arm,sp804", "arm,primecell",
> as SP804 contains the PrimeCell periphid registers, so will be
> recognized by amba bus driver.

Oh, right -- misunderstanding, sorry for that.

> > I will make the names consistent.  These were pasted from someone Lorenzo's
> > older patches, and failed to sport e the inconsistency since I wasn't
> > actually making use of these entries yet.
> > 
> > > > +			//	reg = <0x11000 0x1000>;
> > > > +			//	interrupts = <2>;
> > > > +			// };
> > > > +
> > > > +			// timer@12000 {
> > > > +			//	compatible = "arm,arm-sp804";
> > > > +			//	reg = <0x12000 0x1000>;
> > > > +			// };
> > > 
> > > Just because Linux is not using it, doesn't mean you should comment it out.
> > 
> > From the point of view of describing the hardware, yes.  However, I was
> > a bit worried that if sp804 is turned into a full driver, it will get
> > initialised twice -- once explicitly and once in of_platform_populate()...
> > at least until the baord code is adapted to work properly with the new
> > driver.
> > 
> > Commenting these entries out for now seemed a good idea to avoid the flag-day
> > hazard.  Am I being too cautious?
> 
> I think you are ;-) Besides my static-mapping-rework is already using
> those...

OK, I will uncomment it then.

Cheers
---Dave
