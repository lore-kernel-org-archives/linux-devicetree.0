Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37686 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfDLL6k (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 07:58:40 -0400
Received: by mail-lf1-f66.google.com with SMTP id o19so2961277lfl.4
        for <devicetree@vger.kernel.org>; Fri, 12 Apr 2019 04:58:38 -0700 (PDT)
Date: Fri, 12 Apr 2019 13:58:36 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 1/2] media: rcar-vin: Make the number of VIN SoC-dependent
Message-ID: <20190412115836.GA1980@bigcity.dyn.berto.se>
References: <20190412113832.30075-1-jacopo+renesas@jmondi.org>
 <20190412113832.30075-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190412113832.30075-2-jacopo+renesas@jmondi.org>
Sender: devicetree-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: laurent.pinchart@ideasonboard.com, horms@verge.net.au, sergei.shtylyov@cogentembedded.com, geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Jacopo,

Thanks for your work.

On 2019-04-12 13:38:31 +0200, Jacopo Mondi wrote:
> In preparation to add ids to VIN's device tree nodes for the V3H SoC
> which features up to 16 VIN instances, remove the hardcoded number of
> VINs and make it a per-SoC property.
> 
> Enlarge the existing RCAR_VIN_NUM definition, which is used to
> statically allocate the number of vin devices to 16, to accommodate
> SoCs with that many instances as V3H.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Nacked-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

This is wrong for two reasons, as explained on irc.

- The RCAR_VIN_NUM checks are bounds check for the array and not to 
  validate that the renesas,id property in the DT is correct. Making it 
  dynamic only serves to complicate the driver for no gain.

- It's true that the V3H have 16 VINs, but VIN8-15 are only connected to 
  the ISP for which there exists no upstream driver and no support in 
  the rcar-vin parsing code to handle it. With this change the rcar-vin 
  would probe for such VINs but the result would be use-less as it can 
  not get hold of the ISP, even if a driver would exist for it.

  I might be convinced to accept a patch which would allow DT to 
  describe all 16 VIN's of the V3H but where the rcar-vin would still 
  fail to probe if the renesas,id is above 7 but with a different 
  dev_err() informing the user why it failed.

  I would of course also be happy about a driver for the ISP and added 
  support for it in rcar-vin ;-)

> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 23 +++++++++++++++------
>  drivers/media/platform/rcar-vin/rcar-vin.h  |  5 ++++-
>  2 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 64519b3097f7..6e9c6c8471e9 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -188,7 +188,7 @@ static int rvin_group_link_notify(struct media_link *link, u32 flags,
>  		 * we can return here.
>  		 */
>  		sd = media_entity_to_v4l2_subdev(link->source->entity);
> -		for (i = 0; i < RCAR_VIN_NUM; i++) {
> +		for (i = 0; i <= vin->info->vin_max_id ; i++) {
>  			if (group->vin[i] && group->vin[i]->parallel &&
>  			    group->vin[i]->parallel->subdev == sd) {
>  				group->vin[i]->is_csi = false;
> @@ -319,7 +319,7 @@ static int rvin_group_get(struct rvin_dev *vin)
>  		return -EINVAL;
>  	}
> 
> -	if (id >= RCAR_VIN_NUM) {
> +	if (id > vin->info->vin_max_id) {
>  		vin_err(vin, "%pOF: Invalid renesas,id '%u'\n",
>  			vin->dev->of_node, id);
>  		return -EINVAL;
> @@ -662,7 +662,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>  	}
> 
>  	/* Register all video nodes for the group. */
> -	for (i = 0; i < RCAR_VIN_NUM; i++) {
> +	for (i = 0; i <= vin->info->vin_max_id; i++) {
>  		if (vin->group->vin[i] &&
>  		    !video_is_registered(&vin->group->vin[i]->vdev)) {
>  			ret = rvin_v4l2_register(vin->group->vin[i]);
> @@ -720,7 +720,7 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
>  	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
>  	unsigned int i;
> 
> -	for (i = 0; i < RCAR_VIN_NUM; i++)
> +	for (i = 0; i <= vin->info->vin_max_id; i++)
>  		if (vin->group->vin[i])
>  			rvin_v4l2_unregister(vin->group->vin[i]);
> 
> @@ -809,7 +809,7 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
>  	mutex_lock(&vin->group->lock);
> 
>  	/* If not all VIN's are registered don't register the notifier. */
> -	for (i = 0; i < RCAR_VIN_NUM; i++) {
> +	for (i = 0; i <= vin->info->vin_max_id; i++) {
>  		if (vin->group->vin[i]) {
>  			count++;
>  			vin_mask |= BIT(i);
> @@ -830,7 +830,7 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
>  	 * overlap but the parser function can handle it, so each subdevice
>  	 * will only be registered once with the group notifier.
>  	 */
> -	for (i = 0; i < RCAR_VIN_NUM; i++) {
> +	for (i = 0; i <= vin->info->vin_max_id ; i++) {
>  		if (!(vin_mask & BIT(i)))
>  			continue;
> 
> @@ -884,6 +884,7 @@ static int rvin_mc_init(struct rvin_dev *vin)
>  static const struct rvin_info rcar_info_h1 = {
>  	.model = RCAR_H1,
>  	.use_mc = false,
> +	.vin_max_id = 3,
>  	.max_width = 2048,
>  	.max_height = 2048,
>  };
> @@ -891,6 +892,7 @@ static const struct rvin_info rcar_info_h1 = {
>  static const struct rvin_info rcar_info_m1 = {
>  	.model = RCAR_M1,
>  	.use_mc = false,
> +	.vin_max_id = 1,
>  	.max_width = 2048,
>  	.max_height = 2048,
>  };
> @@ -898,6 +900,7 @@ static const struct rvin_info rcar_info_m1 = {
>  static const struct rvin_info rcar_info_gen2 = {
>  	.model = RCAR_GEN2,
>  	.use_mc = false,
> +	.vin_max_id = 5,
>  	.max_width = 2048,
>  	.max_height = 2048,
>  };
> @@ -941,6 +944,7 @@ static const struct rvin_group_route rcar_info_r8a7795_routes[] = {
>  static const struct rvin_info rcar_info_r8a7795 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
> +	.vin_max_id = 7,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a7795_routes,
> @@ -995,6 +999,7 @@ static const struct rvin_group_route rcar_info_r8a7795es1_routes[] = {
>  static const struct rvin_info rcar_info_r8a7795es1 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
> +	.vin_max_id = 7,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a7795es1_routes,
> @@ -1035,6 +1040,7 @@ static const struct rvin_group_route rcar_info_r8a7796_routes[] = {
>  static const struct rvin_info rcar_info_r8a7796 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
> +	.vin_max_id = 7,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a7796_routes,
> @@ -1079,6 +1085,7 @@ static const struct rvin_group_route rcar_info_r8a77965_routes[] = {
>  static const struct rvin_info rcar_info_r8a77965 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
> +	.vin_max_id = 7,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a77965_routes,
> @@ -1098,6 +1105,7 @@ static const struct rvin_group_route rcar_info_r8a77970_routes[] = {
>  static const struct rvin_info rcar_info_r8a77970 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
> +	.vin_max_id = 3,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a77970_routes,
> @@ -1126,6 +1134,7 @@ static const struct rvin_group_route rcar_info_r8a77980_routes[] = {
>  static const struct rvin_info rcar_info_r8a77980 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
> +	.vin_max_id = 15,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a77980_routes,
> @@ -1142,6 +1151,7 @@ static const struct rvin_group_route rcar_info_r8a77990_routes[] = {
>  static const struct rvin_info rcar_info_r8a77990 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
> +	.vin_max_id = 5,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a77990_routes,
> @@ -1154,6 +1164,7 @@ static const struct rvin_group_route rcar_info_r8a77995_routes[] = {
>  static const struct rvin_info rcar_info_r8a77995 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
> +	.vin_max_id = 4,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a77995_routes,
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index 0b13b34d03e3..2726c56935e4 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -28,7 +28,8 @@
>  #define HW_BUFFER_MASK 0x7f
> 
>  /* Max number on VIN instances that can be in a system */
> -#define RCAR_VIN_NUM 8
> +#define RCAR_VIN_NUM 16
> +
> 
>  struct rvin_group;
> 
> @@ -126,6 +127,7 @@ struct rvin_group_route {
>   * struct rvin_info - Information about the particular VIN implementation
>   * @model:		VIN model
>   * @use_mc:		use media controller instead of controlling subdevice
> + * @vin_max_id:		id of the last VIN instance
>   * @max_width:		max input width the VIN supports
>   * @max_height:		max input height the VIN supports
>   * @routes:		list of possible routes from the CSI-2 recivers to
> @@ -135,6 +137,7 @@ struct rvin_info {
>  	enum model_id model;
>  	bool use_mc;
> 
> +	unsigned int vin_max_id;
>  	unsigned int max_width;
>  	unsigned int max_height;
>  	const struct rvin_group_route *routes;
> --
> 2.21.0
> 

-- 
Regards,
Niklas S�derlund
