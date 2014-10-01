From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/3] edac: altera: Add Altera L2 Cache and OCRAM EDAC
 Support
Date: Wed, 1 Oct 2014 17:53:53 +0100
Message-ID: <20141001165353.GB28440@leverpostej>
References: <1412181092-27162-1-git-send-email-tthayer@opensource.altera.com>
 <1412181092-27162-3-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412181092-27162-3-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: "dinh-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <dinh-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org" <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, "bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org" <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, "m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 01, 2014 at 05:31:31PM +0100, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> Adding L2 Cache and On-Chip RAM EDAC support for the
> Altera SoCs using the EDAC_DEVICE framework. The EDAC
> manager abstracts the common probe functionality and
> test triggers. The L2 Cache and OCRAM files handle
> the specific memory functions.
> 
> Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
>  .../bindings/arm/altera/socfpga-l2-edac.txt        |   15 ++
>  .../bindings/arm/altera/socfpga-ocram-edac.txt     |   16 ++
>  MAINTAINERS                                        |    1 +
>  drivers/edac/Kconfig                               |   14 ++
>  drivers/edac/Makefile                              |    4 +
>  drivers/edac/altera_edac_mgr.c                     |  261 ++++++++++++++++++++
>  drivers/edac/altera_edac_mgr.h                     |   56 +++++
>  drivers/edac/altera_l2_edac.c                      |  130 ++++++++++
>  drivers/edac/altera_ocram_edac.c                   |  107 ++++++++
>  9 files changed, 604 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-l2-edac.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-ocram-edac.txt
>  create mode 100644 drivers/edac/altera_edac_mgr.c
>  create mode 100644 drivers/edac/altera_edac_mgr.h
>  create mode 100644 drivers/edac/altera_l2_edac.c
>  create mode 100644 drivers/edac/altera_ocram_edac.c
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-l2-edac.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-l2-edac.txt
> new file mode 100644
> index 0000000..35b19e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-l2-edac.txt
> @@ -0,0 +1,15 @@
> +Altera SoCFPGA L2 cache Error Detection and Correction [EDAC]
> +
> +Required Properties:
> +- compatible : Should be "altr,l2-edac"

That string looks too generic.

Given the EDAC seems to be a portion of the L2, is there not already an
L2 binding?

Just because Linux expects two drivers doesn't mean we should partition
the HW description this way.

> +- reg : Address and size for ECC error interrupt clear registers.
> +- interrupts : Should be single bit error interrupt, then double bit error
> +       interrupt. Note the rising edge type.
> +
> +Example:
> +
> +       l2edac@ffd08140 {
> +               compatible = "altr,l2-edac";
> +               reg = <0xffd08140 0x4>;
> +               interrupts = <0 36 1>, <0 37 1>;
> +       };
> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-ocram-edac.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-ocram-edac.txt
> new file mode 100644
> index 0000000..31ab205
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-ocram-edac.txt
> @@ -0,0 +1,16 @@
> +Altera SoCFPGA On-Chip RAM Error Detection and Correction [EDAC]
> +
> +OCRAM ECC Required Properties:
> +- compatible : Should be "altr,ocram-edac"
> +- reg : Address and size for ECC error interrupt clear registers.
> +- iram : phandle to On-Chip RAM definition.

Why not just describe this in the OCRAM node? Surely the register is
within the OCRAM controller?

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
