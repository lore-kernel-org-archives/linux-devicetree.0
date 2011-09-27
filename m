From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 5/9] regulator: helper routine to extract
 fixed_voltage_config
Date: Tue, 27 Sep 2011 17:13:27 +0100
Message-ID: <20110927161327.GP4289@opensource.wolfsonmicro.com>
References: <1317118372-17052-1-git-send-email-rnayak@ti.com>
 <1317118372-17052-6-git-send-email-rnayak@ti.com>
 <20110927121622.GD4289@opensource.wolfsonmicro.com>
 <4E81E25C.5080500@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E81E25C.5080500@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@ti.com>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tony@atomide.com, lrg@ti.com, b-cousson@ti.com, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 27, 2011 at 08:19:00PM +0530, Rajendra Nayak wrote:
> On Tuesday 27 September 2011 05:46 PM, Mark Brown wrote:
> >On Tue, Sep 27, 2011 at 03:42:48PM +0530, Rajendra Nayak wrote:

> >>+Optional properties:
> >>+- regulator-fixed-supply: Name of the regulator supply

> >This is going to be confusing with respect to the generic regulator
> >supply property.

> Yes, I guess. Any suggestions on how to make it less
> confusing? :-)

Call it display-name or something?
