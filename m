From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] rtc: ds1374: Add trickle charger device tree binding
Date: Thu, 20 Apr 2017 10:56:34 -0500
Message-ID: <20170420155634.gs7qkufw7j4mfqpx@rob-hp-laptop>
References: <1492468810-17224-1-git-send-email-mdf@kernel.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDJIP47K7MERBNFU4PDQKGQESKH3WRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1492468810-17224-1-git-send-email-mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 17, 2017 at 03:40:10PM -0700, Moritz Fischer wrote:
> Introduce a device tree binding for specifying the trickle charger
> configuration for ds1374. This is based on the code for ds13390.
> 
> Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/rtc/dallas,ds1374.txt      | 18 ++++++++
>  drivers/rtc/rtc-ds1374.c                           | 54 ++++++++++++++++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/dallas,ds1374.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/dallas,ds1374.txt b/Documentation/devicetree/bindings/rtc/dallas,ds1374.txt
> new file mode 100644
> index 0000000..4cf5bd7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/dallas,ds1374.txt
> @@ -0,0 +1,18 @@
> +* Dallas DS1374		I2C Real-Time Clock / WDT

Please remove from trivial-devices.txt, too. (which is moving in 4.12 
BTW)

> +
> +Required properties:
> +- compatible: Should contain "dallas,ds1374".
> +- reg: I2C address for chip
> +
> +Optional properties:
> +- trickle-resistor-ohms : Selected resistor for trickle charger
> +	Values usable for ds1374 are 250, 2000, 4000
> +	Should be given if trickle charger should be enabled
> +- trickle-diode-disable : Do not use internal trickle charger diode
> +	Should be given if internal trickle charger diode should be disabled

These should have vendor prefix unless you think they are common.

> +Example:
> +	ds1374: rtc@0 {
> +		compatible = "dallas,ds1374";
> +		trickle-resistor-ohms = <250>;
> +		reg = <0>;
> +	};

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
