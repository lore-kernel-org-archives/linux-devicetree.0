From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drivers/of: Fix depth for sub-tree blob in unflatten_dt_nodes()
Date: Thu, 9 Jun 2016 17:23:32 -0500
Message-ID: <CAL_JsqJByt53joeveDG0Nij+asQCNhkpmj+d4g21EVERsbg58g@mail.gmail.com>
References: <1465451449-27164-1-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465451449-27164-1-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, andrew.donnellan-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 9, 2016 at 12:50 AM, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
> The function is unflattening device sub-tree blob if @dad passed to
> the function is valid. Currently, this functionality is used by PPC
> PowerNV PCI hotplug driver only. There are possibly multiple nodes
> in the first level of depth, fdt_next_node() bails immediately when
> @depth becomes negative before the second device node can be probed
> successfully. It leads to the device nodes except the first one won't
> be unflattened successfully.
>
> This fixes the issue by setting the initial depth (@inital_depth) to
> 1 when this function is called to unflatten device sub-tree blob. No
> logic changes when this function is used to unflatten non-sub-tree
> blob.
>
> Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Fixes: 78c44d910 ("drivers/of: Fix depth when unflattening devicetree")
> Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> Tested-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Andrew Donnellan <andrew.donnellan-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
> ---
> v2: Change @depth before initializing @fpsizes[depth] and @nps[depth]
> ---
>  drivers/of/fdt.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Applied, thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
