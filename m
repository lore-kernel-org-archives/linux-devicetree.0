From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v6 4/4] of/fdt: mark hotpluggable memory
Date: Wed, 9 Nov 2016 12:12:55 -0600
Message-ID: <CAL_JsqLmAv4Pueq9XveeWMD3Jn_o6mGUcyztx8OajBGTrEd0aQ@mail.gmail.com>
References: <1478562276-25539-1-git-send-email-arbab@linux.vnet.ibm.com> <1478562276-25539-5-git-send-email-arbab@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478562276-25539-5-git-send-email-arbab@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Reza Arbab <arbab@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>, Frank Rowand <frowand.list@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>"linux-kernel@vger.kernel.org" <linux->
List-Id: devicetree@vger.kernel.org

On Mon, Nov 7, 2016 at 5:44 PM, Reza Arbab <arbab@linux.vnet.ibm.com> wrote:
> When movable nodes are enabled, any node containing only hotpluggable
> memory is made movable at boot time.
>
> On x86, hotpluggable memory is discovered by parsing the ACPI SRAT,
> making corresponding calls to memblock_mark_hotplug().
>
> If we introduce a dt property to describe memory as hotpluggable,
> configs supporting early fdt may then also do this marking and use
> movable nodes.
>
> Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
> ---
>  drivers/of/fdt.c | 6 ++++++
>  mm/Kconfig       | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index c89d5d2..2cf1d66 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1015,6 +1015,7 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
>         const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
>         const __be32 *reg, *endp;
>         int l;
> +       bool hotpluggable;
>
>         /* We are scanning "memory" nodes only */
>         if (type == NULL) {
> @@ -1034,6 +1035,7 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
>                 return 0;
>
>         endp = reg + (l / sizeof(__be32));
> +       hotpluggable = of_get_flat_dt_prop(node, "linux,hotpluggable", NULL);

Memory being hotpluggable doesn't seem like a linux property to me.
I'd drop the linux prefix. Also, this needs to be documented.

Rob
