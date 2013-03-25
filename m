From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH 1/2] pwm: pwm-tiecap: Update device-tree binding document
Date: Mon, 25 Mar 2013 08:09:13 +0100
Message-ID: <87ip4gez1i.fsf@dell.be.48ers.dk>
References: <1364195093-1357-1-git-send-email-avinashphilip@ti.com>
	<1364195093-1357-2-git-send-email-avinashphilip@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1364195093-1357-2-git-send-email-avinashphilip@ti.com> (Philip
	Avinash's message of "Mon, 25 Mar 2013 12:34:52 +0530")
Sender: linux-doc-owner@vger.kernel.org
To: Philip Avinash <avinashphilip@ti.com>
Cc: thierry.reding@avionic-design.de, nsekhar@ti.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, prakash.pm@ti.com, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>
List-Id: devicetree@vger.kernel.org

>>>>> "Philip" == Philip Avinash <avinashphilip@ti.com> writes:

 Philip> Update binding document of pwm-tiecap to reflect the usage of similar
 Philip> modules in da850 and am3xx SOCs.

Acked-by: Peter Korsgaard <jacmet@sunsite.dk>

 Philip> Signed-off-by: Philip Avinash <avinashphilip@ti.com>
 Philip> Cc: Grant Likely <grant.likely@secretlab.ca>
 Philip> Cc: Rob Herring <rob.herring@calxeda.com>
 Philip> Cc: Rob Landley <rob@landley.net>
 Philip> ---
 Philip>  .../devicetree/bindings/pwm/pwm-tiecap.txt         |   12 ++++++++++--
 Philip>  1 file changed, 10 insertions(+), 2 deletions(-)

 Philip> diff --git a/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt b/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt
 Philip> index 131e8c1..43c4e81 100644
 Philip> --- a/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt
 Philip> +++ b/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt
 Philip> @@ -1,7 +1,9 @@
 Philip>  TI SOC ECAP based APWM controller
 
 Philip>  Required properties:
 Philip> -- compatible: Must be "ti,am33xx-ecap"
 Philip> +- compatible: Must be "ti,<soc>-ecap".
 Philip> +  for am33xx - compatible = "ti,am33xx-ecap";
 Philip> +  for da850  - compatible = "ti,da850-ecap", "ti,am33xx-ecap";
 Philip>  - #pwm-cells: Should be 3. Number of cells being used to specify PWM property.
 Philip>    First cell specifies the per-chip index of the PWM to use, the second
 Philip>    cell is the period in nanoseconds and bit 0 in the third cell is used to
 Philip> @@ -15,9 +17,15 @@ Optional properties:
 
 Philip>  Example:
 
 Philip> -ecap0: ecap@0 {
 Philip> +ecap0: ecap@0 {  /* ECAP on am33xx */
 Philip>  	compatible = "ti,am33xx-ecap";
 Philip>  	#pwm-cells = <3>;
 Philip>  	reg = <0x48300100 0x80>;
 Philip>  	ti,hwmods = "ecap0";
 Philip>  };
 Philip> +
 Philip> +ecap0: ecap@0 { /* ECAP on da850 */
 Philip> +	compatible = "ti,da850-ecap", "ti,am33xx-ecap";
 Philip> +	#pwm-cells = <3>;
 Philip> +	reg = <0x306000 0x80>;
 Philip> +};
 Philip> -- 
 Philip> 1.7.9.5



-- 
Bye, Peter Korsgaard
