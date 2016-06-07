From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/2] ASoC: cs35l33: Add device tree bindings file for
 cs35l33
Date: Tue, 7 Jun 2016 08:55:41 -0500
Message-ID: <20160607135541.GA25212@rob-hp-laptop>
References: <1464984708-2748-1-git-send-email-Paul.Handrigan@cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464984708-2748-1-git-send-email-Paul.Handrigan-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul.Handrigan-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brian.austin-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 03, 2016 at 03:11:48PM -0500, Paul.Handrigan-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org wrote:
> From: Paul Handrigan <Paul.Handrigan-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org>
> 
> Add device tree bindings file for the cs35l33 8V boosted
> class D amplifier.
> 
> Signed-off-by: Paul Handrigan <Paul.Handrigan-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/sound/cs35l33.txt          | 114 +++++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cs35l33.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/cs35l33.txt b/Documentation/devicetree/bindings/sound/cs35l33.txt
> new file mode 100644
> index 0000000..01fa8fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cs35l33.txt
> @@ -0,0 +1,114 @@
> +CS35L33 Speaker Amplifier
> +
> +Required properties:
> +
> +  - compatible : "cirrus,cs35l33"
> +
> +  - reg : the I2C address of the device for I2C
> +
> +  - VA-supply, VP-supply : power supplies for the device,
> +    as covered in
> +    Documentation/devicetree/bindings/regulator/regulator.txt.
> +
> +Optional properties:
> +
> +  - reset-gpios : gpio used to reset the amplifier
> +
> +  - interrupt-parent : Specifies the phandle of the interrupt controller to
> +    which the IRQs from CS35L33 are delivered to.
> + -  interrupts : IRQ line info CS35L33.
> +    (See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +    for further information relating to interrupt properties)
> +
> +  - boost-ctl : Booster voltage use to supply the amp. If the value is
> +    0, then VBST = VP. If greater than 0, the boost voltage will be 3300mV with
> +    a value of 1 and will increase at a step size of 100mV until a maximum of
> +    8000mV.
> +
> +  - ramp-rate : On power up, it affects the time from when the power
> +    up sequence begins to the time the audio reaches a full-scale output.
> +    On power down, it affects the time from when the power-down sequence
> +    begins to when the amplifier disables the PWM outputs. If this property
> +    is not set then soft ramping will be disabled and ramp time would be
> +    20ms. If this property is set to 0,1,2,3 then ramp times would be 40ms,
> +    60ms,100ms,175ms respectively for 48KHz sample rate.
> +
> +  - boost-ipk : The maximum current allowed for the boost converter.
> +    The range starts at 1850mA (0xF0) and goes to a maximum of 3600mA (0xE0)
> +    with a step size of 15.625mA. The default is 2500mA (0x90).

This is still not in microamps. In other words, instead of 0xF0, use 
1850000.

Similar comment for any other properties where this would make sense.

> +
> +  - hg-algo : Parameters for internal Class H/G algorithm that
> +    controls the amplifier supplies.
> +
> +  - mem-depth : Memory depth for the Class H/G algorithm measured in LRCLK
> +    cycles. If this property is set to 0, 1, 2, or 3 then the memory depths
> +    will be 1, 4, 8, 16 LRCLK cycles.  The default is 16 LRCLK cycles.
> +
> +    release-rate : The number of consecutive LRCLK periods before allowing
> +    release condition tracking updates. The number of LRCLK periods start
> +    at 3 to a maximum of 255.
> +
> +  - ldo-thld : Configures the signal threshold at which the PWM output stage
> +    enters LDO operation. Starts as a default value of 50mV for a value of 1
> +    and increases with a step size of 50mV to a maximum of 750mV (value of
> +    0xF).
> +
> +  - ldo-path-disable : This is a boolean property. If present, the H/G
> +    algorithm uses the max detection path.  If not present, the LDO
> +    detection path is used.
> +
> +  - ldo-entry-delay : The LDO entry delay in milliseconds before the H/G
> +    algorithm switches to the LDO voltage.  This property can be set to values
> +    from 0 to 7 for delays of 5ms, 10ms, 50ms, 100ms, 200ms, 500ms, 1000ms.
> +    The default is 100ms.
> +
> +  - vp-hg-auto : This is a boolean property.  When set, class H/G VPhg
> +    automatic updating is enabled.
> +
> +  - vp-hg :  Class H/G algorithm VPhg.  Controls the H/G algorithm's
> +    reference to the VP voltage for when to start generating a boosted VBST.
> +    The reference voltage starts at 3000mV with a value of 0x3 and is increased
> +    by 100mV per step to a maximum of 5500mV.
> +
> +  - vp-hg-rate : The rate (number of LRCLK periods) at which the VPhg is
> +    allowed to increase to a higher voltage when using VPhg automatic
> +    tracking. This property can be set to values from 0 to 3 with rates of 128
> +    periods, 2048 periods, 32768 periods, and 524288 periods.
> +    The default is 32768 periods.
> +
> +  - vp-hg-va : VA calculation reference for automatic VPhg tracking using VPMON.
> +    This property can be set to values from 0 to 6 starting at 1800mV with a
> +    step size of 50mV up to a maximum value of 1750mV.  Default is 1800mV.

As I said on the last version, all these non-common properties need 
vendor prefixes.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
