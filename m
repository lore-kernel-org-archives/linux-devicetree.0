From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH] of/irq: fix bug in computing output requester-id for
 an msi-map
Date: Mon, 8 Feb 2016 15:47:04 -0800
Message-ID: <56B928F8.3010104@caviumnetworks.com>
References: <1454970623-28781-1-git-send-email-stuart.yoder@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454970623-28781-1-git-send-email-stuart.yoder@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Yoder <stuart.yoder@nxp.com>
Cc: robh@kernel.org, frowand.list@gmail.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, marc.zyngier@arm.com, david.daney@cavium.com, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

On 02/08/2016 02:30 PM, Stuart Yoder wrote:
> From: Stuart Yoder <stuart.yoder@nxp.com>
>
> The binding for msi-map specifies that the output requester id
> should be computed as: (r - rid-base + msi-base)
>
> ...update the code accordingly.

I agree there is a problem  however ...

>
> Signed-off-by: Stuart Yoder <stuart.yoder@nxp.com>
> ---
>   drivers/of/irq.c |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 706e3ff..3f5e5fd 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -589,6 +589,7 @@ static u32 __of_msi_map_rid(struct device *dev, struct device_node **np,
>   	struct device_node *msi_controller_node;
>   	struct device_node *msi_np = *np;
>   	u32 map_mask, masked_rid, rid_base, msi_base, rid_len, phandle;
> +	u32 masked_rid_base;
>   	int msi_map_len;
>   	bool matched;
>   	u32 rid_out = rid_in;
> @@ -654,7 +655,8 @@ static u32 __of_msi_map_rid(struct device *dev, struct device_node **np,
>   	if (!matched)
>   		return rid_out;
>
> -	rid_out = masked_rid + msi_base;
> +	masked_rid_base = map_mask & rid_base;

... The binding document nowhere, that I see, talks about applying the 
mask to the rid-base.

The device tree should already contain the rid-base in the correct range.

If you remove this masking step, I think it may be correct.

If you just do:

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 7ee21ae..92abe01 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -654,7 +654,7 @@ static u32 __of_msi_map_rid(struct device *dev, 
struct device_node **np,
         if (!matched)
                 return rid_out;

-       rid_out = masked_rid + msi_base;
+       rid_out = msi_base + (masked_rid - rid_base);
         dev_dbg(dev,
                 "msi-map at: %s, using mask %08x, rid-base: %08x, 
msi-base: %08x, length: %08x, rid: %08x -> %08x\n",

It think it will be correct.

I have tested it that way.  If you do that,

Acked-by: David Daney <david.daney@cavium.com>

> +	rid_out = msi_base + (masked_rid - masked_rid_base);
>   	dev_dbg(dev,
>   		"msi-map at: %s, using mask %08x, rid-base: %08x, msi-base: %08x, length: %08x, rid: %08x -> %08x\n",
>   		dev_name(parent_dev), map_mask, rid_base, msi_base,
>
