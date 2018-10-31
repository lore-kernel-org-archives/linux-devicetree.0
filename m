From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [PATCH] of: Fix cpu node iterator to not ignore disabled cpu nodes
Date: Wed, 31 Oct 2018 17:40:12 +0100
Message-ID: <60687CA2-AD09-46D8-A317-FB6FA5605996@xenosoft.de>
References: <20181031144226.26747-1-robh@kernel.org>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181031144226.26747-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Thank you. I will test this patch tomorrow.

=E2=80=94 Christian

Sent from my iPhone

> On 31. Oct 2018, at 15:42, Rob Herring <robh@kernel.org> wrote:
>=20
> In most cases, nodes with 'status =3D "disabled";' are treated as if the
> node is not present though it is a common bug to forget to check that.
> However, cpu nodes are different in that "disabled" simply means offline
> and the OS can bring the CPU core online. Commit f1f207e43b8a ("of: Add
> cpu node iterator for_each_of_cpu_node()") followed the common behavior
> of ignoring disabled cpu nodes. This breaks some powerpc systems (at
> least NXP P50XX/e5500). Fix this by dropping the status check.
>=20
> Fixes: 651d44f9679c ("of: use for_each_of_cpu_node iterator")
> Fixes: f1f207e43b8a ("of: Add cpu node iterator for_each_of_cpu_node()")
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christian Zigotzky <chzigotzky@xenosoft.de>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> drivers/of/base.c | 2 --
> 1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index cc62da278663..e47c5ce6cd58 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -776,8 +776,6 @@ struct device_node *of_get_next_cpu_node(struct device=
_node *prev)
>        if (!(of_node_name_eq(next, "cpu") ||
>              (next->type && !of_node_cmp(next->type, "cpu"))))
>            continue;
> -        if (!__of_device_is_available(next))
> -            continue;
>        if (of_node_get(next))
>            break;
>    }
> --=20
> 2.19.1
>=20
