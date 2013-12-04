From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/3] ARM: dts: bcm281xx: define real clocks
Date: Wed, 4 Dec 2013 11:19:07 +0000
Message-ID: <20131204111906.GG16025@e106331-lin.cambridge.arm.com>
References: <529EA78E.7060904@linaro.org>
 <529EA813.2070208@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <529EA813.2070208@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Alex Elder <alex.elder@linaro.org>
Cc: Christian Daudt <bcm@fixthebug.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Mike Turquette <mturquette@linaro.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 04, 2013 at 03:57:07AM +0000, Alex Elder wrote:
> Replace the "fake" clocks defined in the "bcm11351.dtsi" device tree
> file with real definitions backed by the new BCM281xx clock driver..
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> Reviewed-by: Matt Porter <matt.porter@linaro.org>
> Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
> ---
>  arch/arm/boot/dts/bcm11351.dtsi |  222
> ++++++++++++++++++++++++++++-----------
>  1 file changed, 161 insertions(+), 61 deletions(-)

[...]

> +		/*
> +		    * This is a place-holder clock for peripheral
> +		    * clocks that set their parent clock to an
> +		    * out-of-range value to explicitly select
> +		    * "no clock" as a parent.
> +		    */
> +		not_selected_clk: not_selected {
>  			#clock-cells = <0>;
> -		};

Huh? This doesn't seem to be used at all in this series. Why is this
here?

Thanks,
Mark.
