From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: socfpga: add bindings doc for arria10 fpga manager
Date: Sun, 17 Jul 2016 13:40:44 -0700
Message-ID: <CAAtXAHdFKOoYa0tWrO8=COZXAFN5rNM2-w6sR3H9cMCpT5uqxw@mail.gmail.com>
References: <20160712190709.5964-1-atull@opensource.altera.com> <20160712190709.5964-2-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160712190709.5964-2-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Acked-By: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>

On Tue, Jul 12, 2016 at 12:07 PM, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> Add a device tree bindings document for the SoCFPGA Arria10
> FPGA Manager driver.
>
> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
>  .../bindings/fpga/altera-socfpga-a10-fpga-mgr.txt     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/altera-socfpga-a10-fpga-mgr.txt
>
> diff --git a/Documentation/devicetree/bindings/fpga/altera-socfpga-a10-fpga-mgr.txt b/Documentation/devicetree/bindings/fpga/altera-socfpga-a10-fpga-mgr.txt
> new file mode 100644
> index 0000000..2fd8e7a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/altera-socfpga-a10-fpga-mgr.txt
> @@ -0,0 +1,19 @@
> +Altera SOCFPGA Arria10 FPGA Manager
> +
> +Required properties:
> +- compatible : should contain "altr,socfpga-a10-fpga-mgr"
> +- reg        : base address and size for memory mapped io.
> +               - The first index is for FPGA manager register access.
> +               - The second index is for writing FPGA configuration data.
> +- resets     : Phandle and reset specifier for the device's reset.
> +- clocks     : Clocks used by the device.
> +
> +Example:
> +
> +       fpga_mgr: fpga-mgr@ffd03000 {
> +               compatible = "altr,socfpga-a10-fpga-mgr";
> +               reg = <0xffd03000 0x100
> +                      0xffcfe400 0x20>;
> +               clocks = <&l4_mp_clk>;
> +               resets = <&rst FPGAMGR_RESET>;
> +       };
> --
> 2.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
