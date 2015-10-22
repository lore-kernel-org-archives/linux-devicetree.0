From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/4] add missing of_node_put
Date: Thu, 22 Oct 2015 08:04:03 -0500
Message-ID: <CAL_JsqJGS+L=FZAwPs-wBSYiX8kQWqZyaLTGhadYVNT3=Qte_Q@mail.gmail.com>
References: <1445504571-19838-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445504571-19838-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: kernel-janitors@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

+Russell who raised issues with these iterators recently.

On Thu, Oct 22, 2015 at 4:02 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> The various for_each device_node iterators performs an of_node_get on each
> iteration, so a break out of the loop requires an of_node_put.

Thanks for this.

Are there any plans to use coccinelle as a checker that developers can
run to be warned of these problems?

Rob

> The complete semantic patch that fixes this problem is
> (http://coccinelle.lip6.fr):
>
> // <smpl>
> @r@
> local idexpression n;
> expression e1,e2;
> iterator name for_each_node_by_name, for_each_node_by_type,
> for_each_compatible_node, for_each_matching_node,
> for_each_matching_node_and_match, for_each_child_of_node,
> for_each_available_child_of_node, for_each_node_with_property;
> iterator i;
> statement S;
> expression list [n1] es;
> @@
>
> (
> (
> for_each_node_by_name(n,e1) S
> |
> for_each_node_by_type(n,e1) S
> |
> for_each_compatible_node(n,e1,e2) S
> |
> for_each_matching_node(n,e1) S
> |
> for_each_matching_node_and_match(n,e1,e2) S
> |
> for_each_child_of_node(e1,n) S
> |
> for_each_available_child_of_node(e1,n) S
> |
> for_each_node_with_property(n,e1) S
> )
> &
> i(es,n,...) S
> )
>
> @@
> local idexpression r.n;
> iterator r.i;
> expression e;
> expression list [r.n1] es;
> @@
>
>  i(es,n,...) {
>    ...
> (
>    of_node_put(n);
> |
>    e = n
> |
>    return n;
> |
> +  of_node_put(n);
> ?  return ...;
> )
>    ...
>  }
>
> @@
> local idexpression r.n;
> iterator r.i;
> expression e;
> expression list [r.n1] es;
> @@
>
>  i(es,n,...) {
>    ...
> (
>    of_node_put(n);
> |
>    e = n
> |
> +  of_node_put(n);
> ?  break;
> )
>    ...
>  }
> ... when != n
>
> @@
> local idexpression r.n;
> iterator r.i;
> expression e;
> identifier l;
> expression list [r.n1] es;
> @@
>
>  i(es,n,...) {
>    ...
> (
>    of_node_put(n);
> |
>    e = n
> |
> +  of_node_put(n);
> ?  goto l;
> )
>    ...
>  }
> ...
> l: ... when != n// </smpl>
>
> ---
>
>  drivers/of/irq.c      |    7 +++++--
>  drivers/of/overlay.c  |    5 ++++-
>  drivers/of/platform.c |    8 ++++++--
>  drivers/of/unittest.c |    8 ++++++--
>  4 files changed, 21 insertions(+), 7 deletions(-)
