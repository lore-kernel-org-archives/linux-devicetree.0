From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform driver
Date: Mon, 22 Oct 2012 10:07:29 -0600
Message-ID: <50856F41.7000205@wwwdotorg.org>
References: <1350771032-11527-1-git-send-email-linux@prisktech.co.nz> <1350771032-11527-3-git-send-email-linux@prisktech.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1350771032-11527-3-git-send-email-linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/20/2012 04:10 PM, Tony Prisk wrote:
> Add a binding document for ehci-platform driver.
> 
> Signed-off-by: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/ehci-platform.txt      |   27 ++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ehci-platform.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/ehci-platform.txt b/Documentation/devicetree/bindings/usb/ehci-platform.txt
> new file mode 100644
> index 0000000..930b19e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ehci-platform.txt
> @@ -0,0 +1,27 @@
> +Generic Platform EHCI Controller
> +-----------------------------------------------------
> +
> +Required properties:
> +- compatible : "linux,ehci-platform"

That compatible value doesn't look right. The HW isn't defined by Linux.
The binding is supposed to represent HW, not any single OS's use of that
HW or the way its driver works.

Something like "usb,ehci" might be more appropriate. Certainly, the
value should not be "linux,", nor derived from Linux's driver name.

> +Optional properties:
> +- caps-offset : offset to the capabilities register (default = 0)
> +- has-tt : controller has transaction translator(s).
> +- has-synopsys-hc-bug : controller has the synopsys hc bug

That would normally be determined by the driver based on the particular
compatible value that is in device tree.

> +- no-io-watchdog : controller does not need io watchdog
> +
> +- big-endian : descriptors and registers are both big endian. This
> +  is the equivalent of specifying big-endian-desc and big-endian-regs.
> +OR
> +- big-endian-desc : descriptors are in big-endian format
> +- big-endian-regs : mmio is in big-endian format

Hmmm. That looks odd. Presumably if those properties aren't specified,
the default is little-endian? Shouldn't this be a tri-state: big,
little, native, with default native? I don't know what the EHCI
specification mandates here (and if it does mandate something, the
default should match the specification). Isn't this something that
readl/writel would take care of, or are there cases where the register
endianness of just this one HW block mismatches all other HW blocks?

> +Example:
> +	ehci@d8007c00 {
> +		compatible = "ehci-platform";
> +		reg = <0xd8007c00 0x200>;
> +		interrupts = <43>;
> +		has-tt;
> +	};
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
