From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 1/4] mailbox: arm_mhuv2: add device tree binding documentation
Date: Sun, 21 Jul 2019 16:58:04 -0500
Message-ID: <CABb+yY04vW-i35N6P57KSKgmMAYkrA2CDyUvA-bLCZMxiZaocw@mail.gmail.com>
References: <20190717192616.1731-1-tushar.khandelwal@arm.com> <20190717192616.1731-2-tushar.khandelwal@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190717192616.1731-2-tushar.khandelwal@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tushar Khandelwal <tushar.khandelwal@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, tushar.2nov@gmail.com, morten_bp@live.dk, nd@arm.com, Morten Borup Petersen <morten.petersen@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 17, 2019 at 2:26 PM Tushar Khandelwal
<tushar.khandelwal@arm.com> wrote:

> diff --git a/Documentation/devicetree/bindings/mailbox/arm,mhuv2.txt b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.txt
> new file mode 100644
> index 000000000000..3a05593414bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.txt
> @@ -0,0 +1,108 @@
> +Arm MHUv2 Mailbox Driver
> +========================
> +
> +The Arm Message-Handling-Unit (MHU) Version 2 is a mailbox controller that has
> +between 1 and 124 channel windows to provide unidirectional communication with
> +remote processor(s).
> +
> +Given the unidirectional nature of the device, an MHUv2 mailbox may only be
> +written to or read from. If a pair of MHU devices is implemented between two
> +processing elements to provide bidirectional communication, these must be
> +specified as two separate mailboxes.
> +
> +A device tree node for an Arm MHUv2 device must specify either a receiver frame
> +or a sender frame, indicating which end of the unidirectional MHU device which
> +the device node entry describes.
> +
> +An MHU device must be specified with a transport protocol. The transport
> +protocol of an MHU device determines the method of data transmission as well as
> +the number of provided mailboxes.
> +Following are the possible transport protocol types:
> +- Single-word: An MHU device implements as many mailboxes as it
> +               provides channel windows. Data is transmitted through
> +               the MHU registers.
> +- Multi-word:  An MHU device implements a single mailbox. All channel windows
> +               will be used during transmission. Data is transmitted through
> +               the MHU registers.
> +- Doorbell:    An MHU device implements as many mailboxes as there are flag
> +               bits available in its channel windows. Optionally, data may
> +               be transmitted through a shared memory region, wherein the MHU
> +               is used strictly as an interrupt generation mechanism.
> +
> +Mailbox Device Node:
> +====================
> +
> +Required properties:
> +--------------------
> +- compatible:  Shall be "arm,mhuv2" & "arm,primecell"
> +- reg:         Contains the mailbox register address range (base
> +               address and length)
> +- #mbox-cells  Shall be 1 - the index of the channel needed.
> +- mhu-frame    Frame type of the device.
> +               Shall be either "sender" or "receiver"
> +- mhu-protocol Transport protocol of the device. Shall be one of the
> +               following: "single-word", "multi-word", "doorbell"
> +
> +Required properties (receiver frame):
> +-------------------------------------
> +- interrupts:  Contains the interrupt information corresponding to the
> +               combined interrupt of the receiver frame
> +
> +Example:
> +--------
> +
> +       mbox_mw_tx: mhu@10000000 {
> +               compatible = "arm,mhuv2","arm,primecell";
> +               reg = <0x10000000 0x1000>;
> +               clocks = <&refclk100mhz>;
> +               clock-names = "apb_pclk";
> +               #mbox-cells = <1>;
> +               mhu-protocol = "multi-word";
> +               mhu-frame = "sender";
> +       };
> +
> +       mbox_sw_tx: mhu@10000000 {
> +               compatible = "arm,mhuv2","arm,primecell";
> +               reg = <0x11000000 0x1000>;
> +               clocks = <&refclk100mhz>;
> +               clock-names = "apb_pclk";
> +               #mbox-cells = <1>;
> +               mhu-protocol = "single-word";
> +               mhu-frame = "sender";
> +       };
> +
> +       mbox_db_rx: mhu@10000000 {
> +               compatible = "arm,mhuv2","arm,primecell";
> +               reg = <0x12000000 0x1000>;
> +               clocks = <&refclk100mhz>;
> +               clock-names = "apb_pclk";
> +               #mbox-cells = <1>;
> +               interrupts = <0 45 4>;
> +               interrupt-names = "mhu_rx";
> +               mhu-protocol = "doorbell";
> +               mhu-frame = "receiver";
> +       };
> +
> +       mhu_client: scb@2e000000 {
> +       compatible = "fujitsu,mb86s70-scb-1.0";
> +       reg = <0 0x2e000000 0x4000>;
> +       mboxes =
> +               // For multi-word frames, client may only instantiate a single
> +               // mailbox for a mailbox controller
> +               <&mbox_mw_tx 0>,
> +
> +               // For single-word frames, client may instantiate as many
> +               // mailboxes as there are channel windows in the MHU
> +                <&mbox_sw_tx 0>,
> +                <&mbox_sw_tx 1>,
> +                <&mbox_sw_tx 2>,
> +                <&mbox_sw_tx 3>,
> +
> +               // For doorbell frames, client may instantiate as many mailboxes
> +               // as there are bits available in the combined number of channel
> +               // windows ((channel windows * 32) mailboxes)
> +                <mbox_db_rx 0>,
> +                <mbox_db_rx 1>,
> +                ...
> +                <mbox_db_rx 17>;
> +       };

If the mhuv2 instance implements, say, 3 channel windows between
sender (linux) and receiver (firmware), and Linux runs two protocols
each requiring 1 and 2-word sized messages respectively. The hardware
supports that by assigning windows [0] and [1,2] to each protocol.
However, I don't think the driver can support that. Or does it?

Also I see problem with implementing "protocol modes" in the
controller driver - 'mhu-protocol' property should go away.  And
'mhu-frame' is unncessary - presence of interrupt property could imply
'receiver', otherwise 'sender'.

Cheers!
