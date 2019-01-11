From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2] Description of the realtek bluetooth device tree hooks
Date: Fri, 11 Jan 2019 10:34:20 -0600
Message-ID: <20190111163420.GA20311@bogus>
References: <20181229115513.31153-1-beagleboard@davidjohnsummers.uk>
 <20190103163538.6575-1-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190103163538.6575-1-beagleboard@davidjohnsummers.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Summers <beagleboard@davidjohnsummers.uk>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, johan.hedberg@gmail.com, marcel@holtmann.org, linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 03, 2019 at 04:35:37PM +0000, David Summers wrote:
> This adds the desrciption file that describes the hooks for the
> realtek bluetooth serial devices, as needed to refer to the interface
> in the device tree.

Please follow conventions for patch subjects. 'git log --oneline 
--no-merges -- path/to/file' usually gives a good clue. In this case, 
something like:

dt-bindings: net: Add Realtek serial bluetooth binding

> 
> Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
> ---
>  .../bindings/net/realtek-bluetooth-serial.txt | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt b/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
> new file mode 100644
> index 000000000000..0aabca1fc002
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
> @@ -0,0 +1,28 @@
> +Realtek bluetooth devices connected via a UART
> +
> +- compatible: should be "realtek,<name>-bluetooth"
> +  except for "realtek,trl8761atv" - which only has a serial bluetooth connection
> +       "realtek,rtl8723as-bluetooth"
> +       "realtek,rtl8723bs-bluetooth"
> +       "realtek,rtl8723ds-bluetooth"
> +       "realtek,rtl8761atv"
> +       "realtek,rtl8821as-bluetooth"
> +       "realtek,rtl8821cs-bluetooth"
> +       "realtek,rtl8822bs-bluetooth"

Arguably, '-bluetooth' is not necessary as nothing else is attached to 
the serial port. At least shorten it to '-bt'.

> +- These device are bluetooth devices, that connect via a uart

s/device/devices/

> +- all devices (except for rtl8761atv) are also wifi devices, this is connected
> +  seperatly via sdio - and is not covered by this compatible node

Really, this should be up above the property list in a description of 
the device(s).

> +- ideally these will be referenced in a device tree serial node via serdev

Not ideally, but it is only valid for this to be a child of a UART.

serdev is a kernel thing, and shouldn't be part of the binding doc.

> + http://events17.linuxfoundation.org/sites/events/files/slides/serdev-elce-2017-2.pdf

Useful, but again, not part of this binding.

There's no interrupts, GPIO control lines, power supplies, etc. for 
these chips? The binding should be complete even if your platform 
doesn't need these.

> +
> +Example:
> +
> +&uart0 {
> +	status = "okay";

Don't show status in examples.

> +       	pinctrl-0 = <&uart0_xfer>, <&uart0_cts>;
> +       	bluetooth {
> +               	  compatible = "realtek,rtl8723bs-bluetooth";
> +       	};

Mixed tabs and spaces. Use tabs.

> +};
> +
> +this ensures that the bluetooth device is tied to the correct uart
> -- 
> beagleboard@davidjohnsummers.uk
> 
