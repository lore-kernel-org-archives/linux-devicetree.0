From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/5] drivers/of: introduce of_fdt_is_available()
Date: Mon, 3 Oct 2016 10:28:45 -0500
Message-ID: <CAL_JsqKkYFeENE226QFsoqEMJEPpXET0-xJOWoA0j_tbOPu0_g@mail.gmail.com>
References: <1474828616-16608-1-git-send-email-arbab@linux.vnet.ibm.com> <1474828616-16608-2-git-send-email-arbab@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1474828616-16608-2-git-send-email-arbab@linux.vnet.ibm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Reza Arbab <arbab@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.or>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 25, 2016 at 1:36 PM, Reza Arbab <arbab@linux.vnet.ibm.com> wrote:
> In __fdt_scan_reserved_mem(), the availability of a node is determined
> by testing its "status" property.
>
> Move this check into its own function, borrowing logic from the
> unflattened version, of_device_is_available().
>
> Another caller will be added in a subsequent patch.
>
> Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
> ---
>  drivers/of/fdt.c       | 26 +++++++++++++++++++++++---
>  include/linux/of_fdt.h |  2 ++
>  2 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 085c638..9241c6e 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -151,6 +151,23 @@ int of_fdt_match(const void *blob, unsigned long node,
>         return score;
>  }
>
> +bool of_fdt_is_available(const void *blob, unsigned long node)

of_fdt_device_is_available

[...]

> +bool __init of_flat_dt_is_available(unsigned long node)

And of_flat_dt_device_is_available

With that,

Acked-by: Rob Herring <robh@kernel.org>
