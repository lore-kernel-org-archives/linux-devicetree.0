From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/3] OF: properties: add missing of_node_put
Date: Wed, 16 Jan 2019 13:03:29 -0600
Message-ID: <CAL_Jsq+H_0=mQ3hMg2BWKMZfPo+is53zvx6kpSHUMfKpSW=zJw@mail.gmail.com>
References: <1547372691-28324-1-git-send-email-Julia.Lawall@lip6.fr> <1547372691-28324-3-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547372691-28324-3-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 13, 2019 at 4:21 AM Julia Lawall <Julia.Lawall@lip6.fr> wrote:
>
> Add an of_node_put when the result of of_graph_get_remote_port_parent is
> not available.
>
> The semantic match that finds this problem is as follows
> (http://coccinelle.lip6.fr):
>
> // <smpl>
> @r exists@
> local idexpression e;
> expression x;
> @@
> e = of_graph_get_remote_port_parent(...);
> ... when != x = e
>     when != true e == NULL
>     when != of_node_put(e)
>     when != of_fwnode_handle(e)
> (
> return e;
> |
> *return ...;
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>  drivers/of/property.c |    1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Rob
