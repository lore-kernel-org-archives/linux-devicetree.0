From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3] Documentation: add Device tree bindings for
 hwmon/nct7802
Date: Tue, 8 Sep 2015 10:38:12 +0100
Message-ID: <20150908093812.GA19039@leverpostej>
References: <1441664902-32360-1-git-send-email-const@MakeLinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441664902-32360-1-git-send-email-const-GkuDRZ1haSFDPfheJLI6IQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Constantine Shulyupin <const-XSqIthwXjGBDPfheJLI6IQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 07, 2015 at 11:27:47PM +0100, Constantine Shulyupin wrote:
> Add add Device tree bindings for registers
> which are not covered by hwmon ABI and are required to
> configure specific HW.

This doesn't really answer my question [1] of why you need these.

We generally don't encode register values unless there's no other way to
describe the device. Why can we not describe the physical properties of
the device that make these values necessary?

Could you please Cc me on the entire series in future? The driver code
is helpful context.

> ---
> 
> Changed in v3:
> - Fixed vendor prefix
> - Added short registers description,
>   full registers description is available at
> https://www.nuvoton.com/hq/products/cloud-computing/hardware-monitors/desktop-server-series/nct7802y/

This seems to require registration, which is unfortuante (and
familiar)...

> 
> Changed in v2:
> - Removed nct7802,reg-init
> - Added registers initialization by names
> 
> Introduced in v1:
>  - nct7802,reg-init
> 
> Signed-off-by: Constantine Shulyupin <const-GkuDRZ1haSFDPfheJLI6IQ@public.gmane.org>
> ---
>  .../devicetree/bindings/hwmon/nct7802.txt          | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nct7802.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/nct7802.txt b/Documentation/devicetree/bindings/hwmon/nct7802.txt
> new file mode 100644
> index 0000000..5b4c3fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/nct7802.txt
> @@ -0,0 +1,28 @@
> +Nuvoton NCT7802Y Hardware Monitoring IC
> +
> +Required node properties:
> +
> + - "compatible": must be "nuvoton,nct7802"
> + - "reg": I2C bus address of the device
> +
> +Optional properties:
> +
> +One byte registers:
> + - nuvoton,start - Start register at index 0x21
> + - nuvoton,mode - Mode register at index 0x22
> + - nuvoton,en_peci - PECI enable register at index 0x23
> + - nuvoton,en_fan - Fan Enable Register at index 0x24
> + - nuvoton,en_v - voltage monitor enable register
> +		  at index 0x25

Minor nit I missed last time, but s/_/-/ in property names.

That said, as above I don't believe that these properties make sense
as they are. I think this needs properties that describe the HW, rather
than exposing the intricacies of the programming interface.

> +
> +A detailed datasheet for registers and the device is
> +available at Nuvoton web site.
> +
> +Example nct7802 node:
> +
> +nct7802 {
> +	compatible = "nuvoton,nct7802";
> +	reg = <0x2a>;
> +	nuvoton,start = <0x01>;
> +	nuvoton,mode = <0x7E>; // RTD1_MD = 2
> +};
> -- 
> 1.9.1

Thanks,
Mark.

[1] http://lkml.kernel.org/r/20150907123531.GA11540@leverpostej

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
