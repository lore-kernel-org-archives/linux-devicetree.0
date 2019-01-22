Return-Path: <SRS0=b32q=P6=gmail.com=wens213@kernel.org>
MIME-Version: 1.0
References: <20190121203928.32723-1-beagleboard@davidjohnsummers.uk>
In-Reply-To: <20190121203928.32723-1-beagleboard@davidjohnsummers.uk>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 22 Jan 2019 10:42:20 +0800
Message-ID: <CAGb2v64pnz=uHBUCYESM-gM=c7pRc22MCP12pvNvT2wYgxx87Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Bluetooth: hci_h5: Add the Realtek compatible
 flags for the device tree
Content-Type: text/plain; charset="UTF-8"
To: David Summers <beagleboard@davidjohnsummers.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jan 22, 2019 at 4:39 AM David Summers
<beagleboard@davidjohnsummers.uk> wrote:
>
> With the changes requested by Marcel Holtmann and Rob Herring.
>
> The patch is unchanged, but subject changed to the norm.

Same stuff with the commit log.

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

You added the list of compatibles, but you aren't actually
referencing the list in the driver. Which means this patch
actually does nothing in terms of functionality.

ChenYu

>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id h5_acpi_match[] = {
>  #ifdef CONFIG_BT_HCIUART_RTL
> --
> beagleboard@davidjohnsummers.uk
>
