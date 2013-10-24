From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] twl4030_charger: add devicetree support.
Date: Thu, 24 Oct 2013 11:06:52 +0100
Message-ID: <20131024100652.6B31DC4039D@trevor.secretlab.ca>
References: <20131024165005.78bc8740@notabene.brown> <1C8E8D31-1261-45ED-BBD0-161DFD627ACF@codeaurora.org>
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1C8E8D31-1261-45ED-BBD0-161DFD627ACF@codeaurora.org>
Sender: linux-omap-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, NeilBrown <neilb@suse.de>
Cc: Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org, linux-omap@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Belisko Marek <marek.belisko@gmail.com>, "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
List-Id: devicetree@vger.kernel.org

On Thu, 24 Oct 2013 04:44:03 -0500, Kumar Gala <galak@codeaurora.org> wrote:
> 
> On Oct 24, 2013, at 12:50 AM, NeilBrown wrote:
> 
> > 
> > [my first device-tree related patch.  Please let me know what I got wrong so
> > I wont repeat the mistake in all the others I have queued]
> > 
> > This allows the charger to be enabled with devicetree, and
> > allows the parameters for charging the backup battery to be set.
> > 
> > Signed-off-by: NeilBrown <neilb@suse.de>
> > 
> > diff --git a/Documentation/devicetree/bindings/power/twl-charger.txt b/Documentation/devicetree/bindings/power/twl-charger.txt
> > new file mode 100644
> > index 0000000..8afaa9a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/power/twl-charger.txt
> > @@ -0,0 +1,20 @@
> > +TWL BCI (Battery Charger Interface)
> > +
> > +Required properties:
> > +- compatible:
> > +  - "ti,twl4030-bci"
> > +- interrupts: two interrupt lines from the TWL SIH (secondary
> > +  interrupt handler) - interrupts 9 and 2.
> > +
> > +Optional properties:
> > +- bb-uvolt: microvolts for charging the backup battery.
> > +- bb-uamp: microamps for charging the backup battery.
> 
> prop should have vendor prefix.
> 
> ti,bb-uvolt, ti,bb-uamp

Agreed. Otherwise:

Acked-by: Grant Likely <grant.likely@linaro.org>

> 
> - k
> 
> > +
> > +Examples:
> > +
> > +bci {
> > +   compatible = "ti,twl4030-bci";
> > +   interrupts = <9>, <2>;
> > +   bb-uvolt = <3200000>;
> > +   bb-uamp = <150>;
> > +};
> 
> -- 
> Employee of Qualcomm Innovation Center, Inc.
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
> 

