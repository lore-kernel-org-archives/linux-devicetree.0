From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: designware: add binding for
 Designware PCIe in ECAM mode
Date: Thu, 24 Aug 2017 15:02:35 -0500
Message-ID: <CAL_JsqJTGeLv-c0wXCvMZggU4yzo__s-pD7qEZ7Q3w8=uUuu4Q@mail.gmail.com>
References: <20170824184321.19432-1-ard.biesheuvel@linaro.org> <20170824184321.19432-4-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170824184321.19432-4-ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Graeme Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joao Pinto <Joao.Pinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cc the DT list for bindings please.

On Thu, Aug 24, 2017 at 1:43 PM, Ard Biesheuvel
<ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Describe the binding for firmware-configured instances of the Synopsys
> Designware PCIe controller in RC mode.
>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/pci/designware-pcie-ecam.txt | 56 ++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pci/designware-pcie-ecam.txt b/Documentation/devicetree/bindings/pci/designware-pcie-ecam.txt
> new file mode 100644
> index 000000000000..b8127b19c220
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/designware-pcie-ecam.txt
> @@ -0,0 +1,56 @@
> +* Synopsys Designware PCIe root complex in ECAM mode
> +
> +In some cases, firmware may already have configured the Synopsys Designware
> +PCIe controller in RC mode with static ATU window mappings that cover all
> +config, MMIO and I/O spaces in a [mostly] ECAM compatible fashion.
> +In this case, there is no need for the OS to perform any low level setup
> +of clocks or device registers, nor is there any reason for the driver to
> +reconfigure ATU windows for config and/or IO space accesses at runtime.
> +
> +Such hardware configurations should be described as "pci-host-ecam-generic"
> +if they are truly ECAM compatible. Configurations that require no low-level
> +setup by the OS nor any ATU window reconfiguration at runtime, but do
> +require special handling for type 0 config TLPs may instead be described as
> +"snps,dw-pcie-ecam".

Humm, what happens when we have the next exception that's SoC specific
or another vendor? Seems like perhaps "firmware initialized" should
have been a separate property flag for bootloaders to add rather than
a compatible string.

I'd rather see this done in a way that does not require DT updates if
quirks have to be handled/added later.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
