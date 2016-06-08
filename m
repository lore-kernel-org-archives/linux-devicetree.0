From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drivers/of: Fix depth for sub-tree blob in unflatten_dt_nodes()
Date: Wed, 8 Jun 2016 11:46:41 -0500
Message-ID: <CAL_Jsq+D86LbGTiDbokSGNMownTMDteji_NmJNxz4AqTYMpJhw@mail.gmail.com>
References: <1465368654-24170-1-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465368654-24170-1-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, andrew.donnellan-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 8, 2016 at 1:50 AM, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
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

Does this affect anything besides your PCI hotplug stuff? I'd think
overlays/changesets would be broken, but the unittests aren't failing
that I recall.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
