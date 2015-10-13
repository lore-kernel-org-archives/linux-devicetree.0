MIME-Version: 1.0
In-Reply-To: <cover.1444288748.git.p.fedin@samsung.com>
References: <cover.1444288748.git.p.fedin@samsung.com>
Date: Tue, 13 Oct 2015 15:09:57 -0500
Message-ID: <CAL_Jsq+Ux339dqAox6jE5psmL4dw7QMVhfKvVuJ2q5b813PJTg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] PCI: of: Fix handling 64-bit PCI resources on
 non-LPAE kernels
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Pavel Fedin <p.fedin@samsung.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>
List-ID: <devicetree@vger.kernel.org>



On Thu, Oct 8, 2015 at 2:24 AM, Pavel Fedin <p.fedin@samsung.com> wrote:
> The initial aim of this series is to fix long-standing problem with generic
> PCI host controller, triggered by ARM "virt" machine in the recent qemu.
> Since v2.4.50 qemu adds support for the second, large PCI MMIO window,
> which resides in 64-bit address space. This series addresses problems,
> which are triggered on non-LPAE kernels by this configuration.
>
> These patches do not depend on each other and can be applied individually.
> The first adds missing recognition of 64-bit resources (which is actually
> a bug). The second one changes the code to ignore unaccessible resources
> instead of completely bailing out. Since it touches generic of_pci code,
> the fix is expected to be applied to all drivers which use
> of_pci_get_host_bridge_resources().
>
> v1 => v2:
> - Dropped #ifndef, use sizeof(resource_size_t) instead
>
> Pavel Fedin (2):
>   PCI: of: Add 64-bit address recognition without LPAE support
>   PCI: of: Ignore resources with failed translation
>
>  drivers/of/address.c | 6 ++++++
>  drivers/of/of_pci.c  | 6 ++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> --
> 2.4.4
>
