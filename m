From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v12 2/6] fpga: add bindings document for simple fpga bus
Date: Wed, 28 Oct 2015 18:40:27 -0500
Message-ID: <CAL_JsqK2twfWzCKucuSLrsD2rL3=ReUXt3uPdFcsf8B0Tg42Lg@mail.gmail.com>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com> <1445983755-24007-3-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1445983755-24007-3-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, delicious.quinoa@gmail.com, Dinh Nguyen <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 27, 2015 at 5:09 PM,  <atull@opensource.altera.com> wrote:
> From: Alan Tull <atull@opensource.altera.com>
>
> New bindings document for simple fpga bus.
>
> Signed-off-by: Alan Tull <atull@opensource.altera.com>
> ---
> v9:  initial version added to this patchset
> v10: s/fpga/FPGA/g
>      replace DT overlay example with slightly more complicated example
>      move to staging/simple-fpga-bus
> v11: No change in this patch for v11 of the patch set
> v12: Moved out of staging.
>      Changed to use FPGA bridges framework instead of resets
>      for bridges.
> ---
>  .../devicetree/bindings/fpga/simple-fpga-bus.txt   |   81 ++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt
>
> diff --git a/Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt b/Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt
> new file mode 100644
> index 0000000..2e742f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt
> @@ -0,0 +1,81 @@
> +Simple FPGA Bus
> +===============
> +
> +A Simple FPGA Bus is a bus that handles configuring an FPGA and its bridges
> +before populating the devices below its node.  All this happens when a device
> +tree overlay is added to the live tree.  This document describes that device
> +tree overlay.
> +
> +Required properties:
> +- compatible : should contain "simple-fpga-bus"
> +- #address-cells, #size-cells, ranges: must be present to handle address space
> +  mapping for children.
> +
> +Optional properties:
> +- fpga-mgr : should contain a phandle to a FPGA manager.
> +- fpga-firmware : should contain the name of a FPGA image file located on the
> +  firmware search path.

Putting firmware filename in DT has come up in other cases recently[1]
and we concluded it should not be in the DT. Maybe the conclusion
would be different here, and if so we should have a common property
here.

> +- partial-reconfig : boolean property should be defined if partial
> +  reconfiguration of the FPGA is to be done, otherwise full reconfiguration
> +  is done.
> +- fpga-bridges : should contain a list of bridges that the bus will disable
> +  before   programming the FPGA and then enable after the FPGA has been
> +
> +Example:
> +
> +/dts-v1/;
> +/plugin/;
> +/ {
> +       fragment@0 {
> +               target-path="/soc";
> +               __overlay__ {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       bridge@0xff200000 {
> +                               compatible = "simple-fpga-bus";
> +                               reg = <0xc0000000 0x20000000>,
> +                                     <0xff200000 0x00200000>;

You have registers for the bus, so therefore it is not simple. I think
the bus or bridge needs a specific compatible

Rob

[1] http://www.spinics.net/lists/devicetree/msg92462.html
