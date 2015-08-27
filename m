From: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 3/3] ARM: bcm2835: Add DT for the firmware clocks
 driver.
Date: Thu, 27 Aug 2015 11:48:54 +0100
Message-ID: <20150827104854.GA4796@x1>
References: <1439507142-2965-1-git-send-email-eric@anholt.net>
 <1439507142-2965-4-git-send-email-eric@anholt.net>
 <55CEBC6B.9070001@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55CEBC6B.9070001@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Eric Anholt <eric@anholt.net>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 14 Aug 2015, Stephen Warren wrote:

> On 08/13/2015 05:05 PM, Eric Anholt wrote:
> > Signed-off-by: Eric Anholt <eric@anholt.net>
> > Acked-by: Lee Jones <lee@kernel.org>
> 
> A patch description might be nice, although admittedly the subject seems
> clear enough.

Agreed that the subject is clear enough on this occasion.

> > diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> 
> > +		firmware_clocks: firmware-clocks {
> > +			compatible = "raspberrypi,bcm2835-firmware-clocks";
> > +			#clock-cells = <1>;
> > +			raspberrypi,firmware = <&firmware>;
> > +		};
> 
> No need to resend for this, but just a background note: DT node names
> usually contain a device type not a device identity, so "clocks" not
> "firmware-clocks" would be typical.

Please fix this up when you re-send the set.

> This patch,
> Acked-by: Stephen Warren <swarren@wwwdotorg.org>
