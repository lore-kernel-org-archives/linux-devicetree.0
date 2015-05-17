From: =?windows-1252?Q?Noralf_Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 1/3 v2] dt/bindings: Add binding for the Raspberry Pi
 firmware driver
Date: Sun, 17 May 2015 19:11:51 +0200
Message-ID: <5558CBD7.7010803@tronnes.org>
References: <1431543609-19646-1-git-send-email-eric@anholt.net> <1431543609-19646-2-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431543609-19646-2-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Den 13.05.2015 21:00, skrev Eric Anholt:
> This driver will provide support for calls into the firmware that will
> be used by other drivers like cpufreq and vc4.
>
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
>
> v2: Improve commit message, point to mailbox.txt for how mboxes work.
>
>   .../devicetree/bindings/arm/bcm/raspberrypi,firmware.txt | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmware.txt
>
> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmware.txt b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmware.txt
> new file mode 100644
> index 0000000..33b0043
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmware.txt
> @@ -0,0 +1,16 @@
> +Raspberry Pi VideoCore firmware driver
> +
> +Required properties:
> +
> +- compatible:		Should be "rasbperrypi,firmware"
> +- mboxes:		Single-entry list which specifies which mailbox
> +			  controller and channel is used.  See
> +			  Documentation/devicetree/bindings/mailbox/mailbox.txt
> +			  for the semantics of this property
> +
> +Example:
> +
> +firmware {
> +	compatible = "rasbperrypi,firmware";

Typo: rasbperrypi -> raspberrypi

> +	mboxes = <&mailbox>;
> +};
