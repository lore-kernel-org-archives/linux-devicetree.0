From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH 1/1] Documentation: Add dt-binding for TI-btwilink driver
Date: Sun, 26 Apr 2015 21:31:58 -0700
Message-ID: <AE3797AF-6797-44E0-828C-6498DB73980F@holtmann.org>
References: <1430106433-7132-1-git-send-email-gigi.joseph@ti.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430106433-7132-1-git-send-email-gigi.joseph@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gigi Joseph <gigi.joseph@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Gigi Joseph <gigi.joseph@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Gigi,

> btwilink binds bluetooth hci0 interface with the shared transport driver
> 
> Signed-off-by: Gigi Joseph <gigi.joseph@ti.com>
> ---
> Documentation/devicetree/bindings/btwilink.txt | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/btwilink.txt
> 
> diff --git a/Documentation/devicetree/bindings/btwilink.txt b/Documentation/devicetree/bindings/btwilink.txt
> new file mode 100644
> index 0000000..d286aea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/btwilink.txt
> @@ -0,0 +1,15 @@
> +btwilink
> +--------
> +
> +Required properties:
> +
> +	- compatible : must be "ti,btwilink"
> +
> +Example:
> +
> +Enable the btwilink driver to bind the bluetooth hci0 interface with
> +ti-st shared transport driver
> +
> +btwilink {
> +	compatible = "ti,btwilink";
> +};

actually I wonder if someone finally starts re-writing the TI-ST driver to integrate with the new Bluetooth subsystem features (like hdev->setup, __hci_cmd_sync and h4_recv_buf) so that this complicated setup is no longer needed.

I do not think we actually would need a shared transport at all. We should have a Bluetooth HCI driver that can have children for FM radio and GPS exposed. Exposing proper platform devices with Bluetooth HCI as parent makes sense. The shared transport is not really a parent. First and foremost, this is a Bluetooth chip. The FM radio and GPS features are just glued on top of it.

Regards

Marcel
