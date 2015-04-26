From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] iio: magn: bmc150_magn: Add devicetree binding
 documentation
Date: Sun, 26 Apr 2015 18:20:45 +0100
Message-ID: <553D1E6D.9040508@kernel.org>
References: <1429814048-22808-1-git-send-email-irina.tirdea@intel.com> <1429814048-22808-3-git-send-email-irina.tirdea@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429814048-22808-3-git-send-email-irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23/04/15 19:34, Irina Tirdea wrote:
> Add binding documentation for Bosch BMC150 magnetometer.
> 
> Signed-off-by: Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
This is trivial enough that I'll happily take it once the 3 weeks from first
posting are up (I'm guessing that still applies to device tree bindings).
> ---
>  .../bindings/iio/magnetometer/bmc150_magn.txt      | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/bmc150_magn.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/magnetometer/bmc150_magn.txt b/Documentation/devicetree/bindings/iio/magnetometer/bmc150_magn.txt
> new file mode 100644
> index 0000000..9f263b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/magnetometer/bmc150_magn.txt
> @@ -0,0 +1,22 @@
> +* Bosch BMC150 magnetometer sensor
> +
> +http://ae-bst.resource.bosch.com/media/products/dokumente/bmc150/BST-BMC150-DS000-04.pdf
> +
> +Required properties:
> +
> +  - compatible : should be "bosch,bmc150_magn"
> +  - reg : the I2C address of the magnetometer
> +
> +Optional properties:
> +
> +  - interrupt-parent : phandle to the parent interrupt controller
> +  - interrupts : interrupt mapping for GPIO IRQ
> +
> +Example:
> +
> +bmc150_magn@12 {
> +        compatible = "bosch,bmc150_magn";
> +        reg = <0x12>;
> +        interrupt-parent = <&gpio1>;
> +        interrupts = <0 1>;
> +};
> 
