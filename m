From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] PCIe: Designware: Do not allow config space through ranges
Date: Mon, 22 Dec 2014 09:30:13 +0100
Message-ID: <5459567.EisgEvQXh9@wuerfel>
References: <7dcdee69eb7db8336829e6085d736a3ac7e68ad4.1419229126.git.panand@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <7dcdee69eb7db8336829e6085d736a3ac7e68ad4.1419229126.git.panand@redhat.com>
Sender: linux-pci-owner@vger.kernel.org
To: Pratyush Anand <panand@redhat.com>
Cc: mohit.kumar@st.com, jg1.han@samsung.com, l.stach@pengutronix.de, shawn.guo@freescale.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 22 December 2014 12:09:04 Pratyush Anand wrote:
> Config space is need to be allocated using reg property. This patch
> removes possibility of config space allocation through ranges property.
> 
> To: Mohit Kumar <mohit.kumar@st.com>
> To: Jingo Han <jg1.han@samsung.com>
> To: Lucas Stach <l.stach@pengutronix.de>
> To: Shawn Guo <shawn.guo@freescale.com>
> Cc: linux-pci@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Pratyush Anand <panand@redhat.com>
> ---
>  arch/arm/boot/dts/imx6qdl.dtsi     |  3 +--
>  arch/arm/boot/dts/imx6sx.dtsi      |  8 ++++----

changing the DT files is probably ok.

> diff --git a/drivers/pci/host/pcie-designware.c b/drivers/pci/host/pcie-designware.c
> index df781cdf13c1..0b22b42e1ff9 100644
> --- a/drivers/pci/host/pcie-designware.c
> +++ b/drivers/pci/host/pcie-designware.c
> @@ -409,19 +409,6 @@ int __init dw_pcie_host_init(struct pcie_port *pp)
>  			pp->mem_mod_base = of_read_number(parser.range -
>  							  parser.np + na, ns);
>  		}
> -		if (restype == 0) {
> -			of_pci_range_to_resource(&range, np, &pp->cfg);
> -			pp->cfg0_size = resource_size(&pp->cfg)/2;
> -			pp->cfg1_size = resource_size(&pp->cfg)/2;
> -			pp->cfg0_base = pp->cfg.start;
> -			pp->cfg1_base = pp->cfg.start + pp->cfg0_size;
> -
> -			/* Find the untranslated configuration space address */
> -			pp->cfg0_mod_base = of_read_number(parser.range -
> -							   parser.np + na, ns);
> -			pp->cfg1_mod_base = pp->cfg0_mod_base +
> -					    pp->cfg0_size;
> -		}
>  	}

Since we've allowed this for so long, it may be better to leave this
in for compatibility with old dts files. It would however be good to
print a warning message. We could also limit it to those machines that
are known to have been used with this property in the past.

	Arnd
