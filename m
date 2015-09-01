From: Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 5/5] Documentation: dt-bindings: phy: add YAML TI PHY binding
Date: Tue, 1 Sep 2015 10:42:25 -0700
Message-ID: <CA+bK7J5jz0wxgA-0jY4LFUWWoTk4YzGaGSQZsdF83BnomoBx6w@mail.gmail.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
	<1440739433-6799-6-git-send-email-mporter@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440739433-6799-6-git-send-email-mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 27, 2015 at 10:23 PM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Convert the ti-phy.txt binding to standard YAML DT binding
> format. This binding references the YAML generic PHY binding.
>
> Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/phy/ti-phy.yaml | 166 ++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/ti-phy.yaml
>
> diff --git a/Documentation/devicetree/bindings/phy/ti-phy.yaml b/Documentation/devicetree/bindings/phy/ti-phy.yaml
> new file mode 100644
> index 0000000..ec93501
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/ti-phy.yaml
> @@ -0,0 +1,166 @@
> +%YAML 1.2
> +---
> +id: omap-control-phy
> +
> +title: OMAP Control PHY
> +
> +compatible:
> +  - name: "ti,control-phy-otghs"
> +    description: if it has otghs_control mailbox register as on OMAP4.
> +  - name: "ti,control-phy-usb2"
> +    description: if it has Power down bit in control_dev_conf register
> +                 e.g. USB2_PHY on OMAP5.
> +  - name: "ti,control-phy-pipe3"
> +    description: if it has DPLL and individual Rx & Tx power control
> +                 e.g. USB3 PHY and SATA PHY on OMAP5.
> +  - name: "ti,control-phy-pcie"
> +    description: for pcie to support external clock for pcie and to
> +                 set PCS delay value. e.g. PCIE PHY in DRA7x
> +  - name: "ti,control-phy-usb2-dra7"
> +    description: if it has power down register like USB2 PHY on DRA7
> +                 DRA7 platform.
> +  - name: "ti,control-phy-usb2-am437"
> +    description: if it has power down register like USB2 PHY on AM437
> +                 platform.

I'm confused.  If these descriptions are multi-line, don't they need the '>'
syntax?

Also, I'm still confused by the "name:" field in this section.  These are
possible *values* for the compatible property, not the name of the field,
as all other property descriptions are.

...
 -- Tim
