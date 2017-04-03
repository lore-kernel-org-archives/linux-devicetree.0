From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] regulator: Add driver for voltage controlled
 regulators
Date: Mon, 3 Apr 2017 11:59:55 -0500
Message-ID: <20170403165955.3s4uenr64m3kmf3q@rob-hp-laptop>
References: <20170331205035.126001-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170331205035.126001-1-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 31, 2017 at 01:50:35PM -0700, Matthias Kaehlcke wrote:
> The output voltage of a voltage controlled regulator can be controlled
> through the voltage of another regulator. The current version of this
> driver assumes that the output voltage is a linear function of the control
> voltage.
> 
> Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v3:
> - Pre-calculate limits for OVP-safe downward transitions with a discrete
>   control regulator
> - Use regulator_get_linear_step() and regulator_count_voltages() to
>   determine if the control regulator is continuous or discrete
> - Changed some log messages to start with lowercase character for
>   consistency
> - Misc formatting fixes
> 
> Changes in v2:
> - Don't configure control regulator as supply
> - Added enable/disable ops to turn control regulator on/off
> - Use regulator_has_continuous_voltage_range() to determine if control
>   regulator is continuous or discrete
> - Use regulator-min/max-microvolt as output voltage range
> - Updated and fixed example in DT bindings
> - Updated commit message
> 
>  .../devicetree/bindings/regulator/vctrl.txt        |  50 ++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> 

>  drivers/regulator/Kconfig                          |   7 +
>  drivers/regulator/Makefile                         |   1 +
>  drivers/regulator/vctrl-regulator.c                | 553 +++++++++++++++++++++
>  4 files changed, 611 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/vctrl.txt
>  create mode 100644 drivers/regulator/vctrl-regulator.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
