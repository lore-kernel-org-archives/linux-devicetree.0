From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] Device tree binding documentation for
 chromeos-firmware
Date: Wed, 2 Dec 2015 09:15:52 -0600
Message-ID: <20151202151552.GA11101@rob-hp-laptop>
References: <1448997171-7064-1-git-send-email-martyn.welch@collabora.co.uk>
 <1448997171-7064-2-git-send-email-martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448997171-7064-2-git-send-email-martyn.welch@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 01, 2015 at 07:12:49PM +0000, Martyn Welch wrote:
> This patch adds documentation for the chromeos-firmware binding.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
> ---
>  .../devicetree/bindings/misc/chromeos-firmware.txt | 27 ++++++++++++++++++++++

bindings/firmware/ please.

>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/chromeos-firmware.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/chromeos-firmware.txt b/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
> new file mode 100644
> index 0000000..8240611
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
> @@ -0,0 +1,27 @@
> +Device-Tree bindings for chromeos-firmware.c.

Perhaps a bit more description what this is.

What aspect of this is firmware? How does this relate to the EC?

> +
> +Required properties:
> +	- compatible = "google,gpio-firmware";

No versions?

> +
> +Each signal is represented as a sub-node of "chromeos_firmware":
> +Subnode properties:
> +
> +	- gpios: OF device-tree gpio specification.
> +
> +Example nodes:
> +
> +	chromeos_firmware {

This should go under /firmware

> +		compatible = "google,gpio-firmware";
> +
> +		write-protect {

You need to define what are valid sub nodes. The example is not 
documentation.

> +			gpios = <&gpx3 0 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		developer-switch {
> +			gpios = <&gpx1 3 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		recovery-switch {
> +			gpios = <&gpx0 7 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> -- 
> 2.1.4
> 
