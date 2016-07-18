From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 03/22] usb: ulpi: Support device discovery via device
 properties
Date: Sun, 17 Jul 2016 21:23:55 -0500
Message-ID: <20160718022355.GA8568@rob-hp-laptop>
References: <20160707222114.1673-1-stephen.boyd@linaro.org>
 <20160707222114.1673-4-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160707222114.1673-4-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 07, 2016 at 03:20:54PM -0700, Stephen Boyd wrote:
> The qcom HSIC ULPI phy doesn't have any bits set in the vendor or
> product ID registers. This makes it impossible to make a ULPI
> driver match against the ID registers. Add support to discover
> the ULPI phys via DT/device properties to help alleviate this
> problem. In the DT case, we'll look for a ULPI bus node
> underneath the device registering the ULPI viewport (or the
> parent of that device to support chipidea's device layout) and
> then match up the phy node underneath that with the ULPI device
> that's created.
> 
> The side benefit of this is that we can use standard properties
> in the phy node like clks, regulators, gpios, etc. because we
> don't have firmware like ACPI to turn these things on for us. And
> we can use the DT phy binding to point our phy consumer to the
> phy provider.
> 
> Furthermore, this avoids any problems with reading the ID
> registers before the phy is powered up. The ULPI bus supports
> native enumeration by reading the vendor ID and product ID
> registers at device creation time, but we can't be certain that
> those register reads will succeed if the phy is not powered.
> 
> If the ULPI spec had some generic power sequencing for these
> registers we could put that into the ULPI bus layer and power up
> the device before reading the ID registers. Unfortunately this
> doesn't exist and the power sequence is usually device specific.
> By having the vendor and product ID properties in ACPI or DT, we
> can match up devices with drivers without having to read the
> hardware before it's powered up and avoid this problem.
> 
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/ulpi.txt | 35 ++++++++++++
>  drivers/usb/common/ulpi.c                      | 74 +++++++++++++++++++++++++-
>  2 files changed, 107 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/ulpi.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/ulpi.txt b/Documentation/devicetree/bindings/usb/ulpi.txt
> new file mode 100644
> index 000000000000..c649ca5b0996
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ulpi.txt
> @@ -0,0 +1,35 @@
> +ULPI bus binding
> +----------------
> +
> +Phys that are behind a ULPI connection can be described with the following
> +binding. The host controller shall have a "ulpi" named node as a child, and
> +that node shall have one enabled node underneath it representing the ulpi
> +device on the bus.
> +
> +PROPERTIES
> +----------
> +
> +- ulpi-vendor:
> +    Usage: optional
> +    Value type: <u16>
> +    Definition: The USB-IF assigned vendor id for this device
> +
> +- ulpi-product:
> +    Usage: required if ulpi-vendor is present
> +    Value type: <u16>
> +    Definition: The vendor assigned product id for this device
> +
> +EXAMPLE
> +-------
> +
> +usb {
> +	compatible = "vendor,usb-controller";
> +
> +	ulpi {
> +		phy {
> +			compatible = "vendor,phy";
> +			ulpi-vendor = /bits/ 16 <0x1d6b>;
> +			ulpi-product = /bits/ 16 <0x0002>;
> +		};
> +	};

I'm still having concerns about describing both phys and devices. If I 
have a controller with 2 ports and 2 devices attached, I'd have 
something like this under the USB controller:

ulpi {
	phy@1 {
	};
	phy@2 {
	};
};

dev@1 {
...
};

dev@2 {
...
};


That doesn't seem the best, but I don't have a better suggestion. Maybe 
the device nodes need to go under the phy nodes?

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
