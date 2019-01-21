Return-Path: <robherring2@gmail.com>
Date: Mon, 21 Jan 2019 09:28:04 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] Bluetooth: dt-bindings: Realtek serial bluetooth
Message-ID: <20190121152804.GA29172@bogus>
References: <20190120124046.6715-1-beagleboard@davidjohnsummers.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190120124046.6715-1-beagleboard@davidjohnsummers.uk>
To: David Summers <beagleboard@davidjohnsummers.uk>
Cc: mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sun, Jan 20, 2019 at 12:40:45PM +0000, David Summers wrote:
> Since v2, the compatible binding names have been changed to end in
> -bt, as requested by robh.

Now you have the same subject for 2 different patches. Again, use 
'git log --oneline drivers/bluetooth/hci_h5.c' and follow the subject 
pattern.

> Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
> ---
>  drivers/bluetooth/hci_h5.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
> index 8eede1197cd2..056ab2decccc 100644
> --- a/drivers/bluetooth/hci_h5.c
> +++ b/drivers/bluetooth/hci_h5.c
> @@ -925,6 +925,22 @@ static struct h5_vnd rtl_vnd = {
>  };
>  #endif
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id h5_of_match[] = {
> +#ifdef CONFIG_BT_HCIUART_RTL
> +       { .compatible = "realtek,rtl8723as-bt"},
> +       { .compatible = "realtek,rtl8723bs-bt"},
> +       { .compatible = "realtek,rtl8723ds-bt"},
> +       { .compatible = "realtek,rtl8761atv"},
> +       { .compatible = "realtek,rtl8821as-bt"},
> +       { .compatible = "realtek,rtl8821cs-bt"},
> +       { .compatible = "realtek,rtl8822bs-bt"},
> +#endif
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, h5_of_match);
> +#endif
> +
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id h5_acpi_match[] = {
>  #ifdef CONFIG_BT_HCIUART_RTL
> -- 
> beagleboard@davidjohnsummers.uk
> 
