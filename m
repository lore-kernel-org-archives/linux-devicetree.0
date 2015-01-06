From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v8 1/4] doc: add bindings document for altera fpga manager
Date: Tue, 6 Jan 2015 16:05:37 -0600
Message-ID: <CAL_JsqKRe2YquSmi01wa5b=Ctns+1ek-PdSHDLuxyCfKasTw5g@mail.gmail.com>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com> <1420575219-27061-2-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1420575219-27061-2-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "H. Peter Anvin" <hpa@zytor.com>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Pavel Machek <pavel@denx.de>, Mark Brown <broonie@kernel.org>, Philip Balister <philip@balister.org>, Alessandro Rubini <rubini@gnudd.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kyle Teske <kyle.teske@ni.com>, Nicolas Pitre <nico@linaro.org>, Felipe Balbi <balbi>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 6, 2015 at 2:13 PM,  <atull@opensource.altera.com> wrote:
> From: Alan Tull <atull@opensource.altera.com>
>
> New bindings document for Altera fpga manager.
>
> Signed-off-by: Alan Tull <atull@opensource.altera.com>

Acked-by: Rob Herring <robh@kernel.org>

Like I said, this binding doesn't look like it will change other than
perhaps additional optional properties, so it can go into
Documentation. Perhaps .../bindings/fpga/. I'm happy to merge this
thru DT tree if you want.

Rob

> ---
> v5 : Move bindings to drivers/staging/fpga/Documentation/bindings
>
> v6 : No change in this patch for v6 of the patch set
>
> v7 : No change in this patch for v7 of the patch set
>
> v8 : Make compatible string and name of bindings doc more chip
>      specific
> ---
>  .../bindings/altera-socfpga-fpga-mgr.txt           |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 drivers/staging/fpga/Documentation/bindings/altera-socfpga-fpga-mgr.txt
>
> diff --git a/drivers/staging/fpga/Documentation/bindings/altera-socfpga-fpga-mgr.txt b/drivers/staging/fpga/Documentation/bindings/altera-socfpga-fpga-mgr.txt
> new file mode 100644
> index 0000000..9b027a6
> --- /dev/null
> +++ b/drivers/staging/fpga/Documentation/bindings/altera-socfpga-fpga-mgr.txt
> @@ -0,0 +1,17 @@
> +Altera SOCFPGA FPGA Manager
> +
> +Required properties:
> +- compatible : should contain "altr,socfpga-fpga-mgr"
> +- reg        : base address and size for memory mapped io.
> +               - The first index is for FPGA manager register access.
> +               - The second index is for writing FPGA configuration data.
> +- interrupts : interrupt for the FPGA Manager device.
> +
> +Example:
> +
> +       hps_0_fpgamgr: fpgamgr@0xff706000 {
> +               compatible = "altr,socfpga-fpga-mgr";
> +               reg = <0xFF706000 0x1000
> +                      0xFFB90000 0x1000>;
> +               interrupts = <0 175 4>;
> +       };
> --
> 1.7.9.5
>
