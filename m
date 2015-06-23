From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of/address: use atomic allocation in pci_register_io_range()
Date: Tue, 23 Jun 2015 10:29:30 -0500
Message-ID: <CAL_JsqJcVuQpCxmmNwMzRu1Ypxdnaijroz7va5CuevJe_M2r+A@mail.gmail.com>
References: <000301d0a910$09d9bd60$1d8d3820$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <000301d0a910$09d9bd60$1d8d3820$@com>
Sender: linux-pci-owner@vger.kernel.org
To: Jingoo Han <jingoohan1@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 17, 2015 at 10:12 AM, Jingoo Han <jingoohan1@gmail.com> wrote:
> When kzalloc() is called under spin_lock(), GFP_ATOMIC should be
> used to avoid sleeping allocation.
> The call tree is:
>   of_pci_range_to_resource()
>     --> pci_register_io_range() <-- takes spin_lock(&io_range_lock);
>        --> kzalloc()
>
> Signed-off-by: Jingoo Han <jingoohan1@gmail.com>

Applied. Thanks.

Rob

> ---
>  drivers/of/address.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 78a7dcb..65c3289 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -712,7 +712,7 @@ int __weak pci_register_io_range(phys_addr_t addr, resource_size_t size)
>         }
>
>         /* add the range to the list */
> -       range = kzalloc(sizeof(*range), GFP_KERNEL);
> +       range = kzalloc(sizeof(*range), GFP_ATOMIC);
>         if (!range) {
>                 err = -ENOMEM;
>                 goto end_register;
> --
> 1.9.1
>
>
