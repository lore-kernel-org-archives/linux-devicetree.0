Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58885 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfDLMNH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 08:13:07 -0400
Date: Fri, 12 Apr 2019 14:13:52 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 1/2] media: rcar-vin: Make the number of VIN SoC-dependent
Message-ID: <20190412121352.6hozzx4lm3ql2j2j@uno.localdomain>
References: <20190412113832.30075-1-jacopo+renesas@jmondi.org>
 <20190412113832.30075-2-jacopo+renesas@jmondi.org>
 <20190412115836.GA1980@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="673vbjpt34j3tvk4"
Content-Disposition: inline
In-Reply-To: <20190412115836.GA1980@bigcity.dyn.berto.se>
Sender: devicetree-owner@vger.kernel.org
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, laurent.pinchart@ideasonboard.com, horms@verge.net.au, sergei.shtylyov@cogentembedded.com, geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--673vbjpt34j3tvk4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Fri, Apr 12, 2019 at 01:58:36PM +0200, Niklas S=C3=B6derlund wrote:
> Hi Jacopo,
>
> Thanks for your work.
>
> On 2019-04-12 13:38:31 +0200, Jacopo Mondi wrote:
> > In preparation to add ids to VIN's device tree nodes for the V3H SoC
> > which features up to 16 VIN instances, remove the hardcoded number of
> > VINs and make it a per-SoC property.
> >
> > Enlarge the existing RCAR_VIN_NUM definition, which is used to
> > statically allocate the number of vin devices to 16, to accommodate
> > SoCs with that many instances as V3H.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Nacked-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> This is wrong for two reasons, as explained on irc.
>
> - The RCAR_VIN_NUM checks are bounds check for the array and not to
>   validate that the renesas,id property in the DT is correct. Making it
>   dynamic only serves to complicate the driver for no gain.

Regardless of V3H support, validating that the renesas,id property is
valid for the current SoC is worth the "complication" imho.
Why is bound checking different now? (we could discuss if allocating 8
vin devices more for all SoC is worth, that I agree)
Not to mention having that value fixed it means we alway cycle on all
8 vin devices instances, even if the SoC supports less than that.
>
> - It's true that the V3H have 16 VINs, but VIN8-15 are only connected to
>   the ISP for which there exists no upstream driver and no support in
>   the rcar-vin parsing code to handle it. With this change the rcar-vin
>   would probe for such VINs but the result would be use-less as it can
>   not get hold of the ISP, even if a driver would exist for it.
>

Let's remove them from DT then?

>   I might be convinced to accept a patch which would allow DT to
>   describe all 16 VIN's of the V3H but where the rcar-vin would still
>   fail to probe if the renesas,id is above 7 but with a different
>   dev_err() informing the user why it failed.

I cannot test on V3H but I think all VINs (included 0-7, which are
connected to a CSI-2 receiver) fail to probe without a "renesas,id"
property, and this should be fixed. I like less the idea of having a special
failure path for the VIN[8-15] instances than removing them completely
tbh.

>
>   I would of course also be happy about a driver for the ISP and added
>   support for it in rcar-vin ;-)
>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c | 23 +++++++++++++++------
> >  drivers/media/platform/rcar-vin/rcar-vin.h  |  5 ++++-
> >  2 files changed, 21 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/medi=
a/platform/rcar-vin/rcar-core.c
> > index 64519b3097f7..6e9c6c8471e9 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -188,7 +188,7 @@ static int rvin_group_link_notify(struct media_link=
 *link, u32 flags,
> >  		 * we can return here.
> >  		 */
> >  		sd =3D media_entity_to_v4l2_subdev(link->source->entity);
> > -		for (i =3D 0; i < RCAR_VIN_NUM; i++) {
> > +		for (i =3D 0; i <=3D vin->info->vin_max_id ; i++) {
> >  			if (group->vin[i] && group->vin[i]->parallel &&
> >  			    group->vin[i]->parallel->subdev =3D=3D sd) {
> >  				group->vin[i]->is_csi =3D false;
> > @@ -319,7 +319,7 @@ static int rvin_group_get(struct rvin_dev *vin)
> >  		return -EINVAL;
> >  	}
> >
> > -	if (id >=3D RCAR_VIN_NUM) {
> > +	if (id > vin->info->vin_max_id) {
> >  		vin_err(vin, "%pOF: Invalid renesas,id '%u'\n",
> >  			vin->dev->of_node, id);
> >  		return -EINVAL;
> > @@ -662,7 +662,7 @@ static int rvin_group_notify_complete(struct v4l2_a=
sync_notifier *notifier)
> >  	}
> >
> >  	/* Register all video nodes for the group. */
> > -	for (i =3D 0; i < RCAR_VIN_NUM; i++) {
> > +	for (i =3D 0; i <=3D vin->info->vin_max_id; i++) {
> >  		if (vin->group->vin[i] &&
> >  		    !video_is_registered(&vin->group->vin[i]->vdev)) {
> >  			ret =3D rvin_v4l2_register(vin->group->vin[i]);
> > @@ -720,7 +720,7 @@ static void rvin_group_notify_unbind(struct v4l2_as=
ync_notifier *notifier,
> >  	struct rvin_dev *vin =3D v4l2_dev_to_vin(notifier->v4l2_dev);
> >  	unsigned int i;
> >
> > -	for (i =3D 0; i < RCAR_VIN_NUM; i++)
> > +	for (i =3D 0; i <=3D vin->info->vin_max_id; i++)
> >  		if (vin->group->vin[i])
> >  			rvin_v4l2_unregister(vin->group->vin[i]);
> >
> > @@ -809,7 +809,7 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *=
vin)
> >  	mutex_lock(&vin->group->lock);
> >
> >  	/* If not all VIN's are registered don't register the notifier. */
> > -	for (i =3D 0; i < RCAR_VIN_NUM; i++) {
> > +	for (i =3D 0; i <=3D vin->info->vin_max_id; i++) {
> >  		if (vin->group->vin[i]) {
> >  			count++;
> >  			vin_mask |=3D BIT(i);
> > @@ -830,7 +830,7 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *=
vin)
> >  	 * overlap but the parser function can handle it, so each subdevice
> >  	 * will only be registered once with the group notifier.
> >  	 */
> > -	for (i =3D 0; i < RCAR_VIN_NUM; i++) {
> > +	for (i =3D 0; i <=3D vin->info->vin_max_id ; i++) {
> >  		if (!(vin_mask & BIT(i)))
> >  			continue;
> >
> > @@ -884,6 +884,7 @@ static int rvin_mc_init(struct rvin_dev *vin)
> >  static const struct rvin_info rcar_info_h1 =3D {
> >  	.model =3D RCAR_H1,
> >  	.use_mc =3D false,
> > +	.vin_max_id =3D 3,
> >  	.max_width =3D 2048,
> >  	.max_height =3D 2048,
> >  };
> > @@ -891,6 +892,7 @@ static const struct rvin_info rcar_info_h1 =3D {
> >  static const struct rvin_info rcar_info_m1 =3D {
> >  	.model =3D RCAR_M1,
> >  	.use_mc =3D false,
> > +	.vin_max_id =3D 1,
> >  	.max_width =3D 2048,
> >  	.max_height =3D 2048,
> >  };
> > @@ -898,6 +900,7 @@ static const struct rvin_info rcar_info_m1 =3D {
> >  static const struct rvin_info rcar_info_gen2 =3D {
> >  	.model =3D RCAR_GEN2,
> >  	.use_mc =3D false,
> > +	.vin_max_id =3D 5,
> >  	.max_width =3D 2048,
> >  	.max_height =3D 2048,
> >  };
> > @@ -941,6 +944,7 @@ static const struct rvin_group_route rcar_info_r8a7=
795_routes[] =3D {
> >  static const struct rvin_info rcar_info_r8a7795 =3D {
> >  	.model =3D RCAR_GEN3,
> >  	.use_mc =3D true,
> > +	.vin_max_id =3D 7,
> >  	.max_width =3D 4096,
> >  	.max_height =3D 4096,
> >  	.routes =3D rcar_info_r8a7795_routes,
> > @@ -995,6 +999,7 @@ static const struct rvin_group_route rcar_info_r8a7=
795es1_routes[] =3D {
> >  static const struct rvin_info rcar_info_r8a7795es1 =3D {
> >  	.model =3D RCAR_GEN3,
> >  	.use_mc =3D true,
> > +	.vin_max_id =3D 7,
> >  	.max_width =3D 4096,
> >  	.max_height =3D 4096,
> >  	.routes =3D rcar_info_r8a7795es1_routes,
> > @@ -1035,6 +1040,7 @@ static const struct rvin_group_route rcar_info_r8=
a7796_routes[] =3D {
> >  static const struct rvin_info rcar_info_r8a7796 =3D {
> >  	.model =3D RCAR_GEN3,
> >  	.use_mc =3D true,
> > +	.vin_max_id =3D 7,
> >  	.max_width =3D 4096,
> >  	.max_height =3D 4096,
> >  	.routes =3D rcar_info_r8a7796_routes,
> > @@ -1079,6 +1085,7 @@ static const struct rvin_group_route rcar_info_r8=
a77965_routes[] =3D {
> >  static const struct rvin_info rcar_info_r8a77965 =3D {
> >  	.model =3D RCAR_GEN3,
> >  	.use_mc =3D true,
> > +	.vin_max_id =3D 7,
> >  	.max_width =3D 4096,
> >  	.max_height =3D 4096,
> >  	.routes =3D rcar_info_r8a77965_routes,
> > @@ -1098,6 +1105,7 @@ static const struct rvin_group_route rcar_info_r8=
a77970_routes[] =3D {
> >  static const struct rvin_info rcar_info_r8a77970 =3D {
> >  	.model =3D RCAR_GEN3,
> >  	.use_mc =3D true,
> > +	.vin_max_id =3D 3,
> >  	.max_width =3D 4096,
> >  	.max_height =3D 4096,
> >  	.routes =3D rcar_info_r8a77970_routes,
> > @@ -1126,6 +1134,7 @@ static const struct rvin_group_route rcar_info_r8=
a77980_routes[] =3D {
> >  static const struct rvin_info rcar_info_r8a77980 =3D {
> >  	.model =3D RCAR_GEN3,
> >  	.use_mc =3D true,
> > +	.vin_max_id =3D 15,
> >  	.max_width =3D 4096,
> >  	.max_height =3D 4096,
> >  	.routes =3D rcar_info_r8a77980_routes,
> > @@ -1142,6 +1151,7 @@ static const struct rvin_group_route rcar_info_r8=
a77990_routes[] =3D {
> >  static const struct rvin_info rcar_info_r8a77990 =3D {
> >  	.model =3D RCAR_GEN3,
> >  	.use_mc =3D true,
> > +	.vin_max_id =3D 5,
> >  	.max_width =3D 4096,
> >  	.max_height =3D 4096,
> >  	.routes =3D rcar_info_r8a77990_routes,
> > @@ -1154,6 +1164,7 @@ static const struct rvin_group_route rcar_info_r8=
a77995_routes[] =3D {
> >  static const struct rvin_info rcar_info_r8a77995 =3D {
> >  	.model =3D RCAR_GEN3,
> >  	.use_mc =3D true,
> > +	.vin_max_id =3D 4,
> >  	.max_width =3D 4096,
> >  	.max_height =3D 4096,
> >  	.routes =3D rcar_info_r8a77995_routes,
> > diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media=
/platform/rcar-vin/rcar-vin.h
> > index 0b13b34d03e3..2726c56935e4 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> > +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> > @@ -28,7 +28,8 @@
> >  #define HW_BUFFER_MASK 0x7f
> >
> >  /* Max number on VIN instances that can be in a system */
> > -#define RCAR_VIN_NUM 8
> > +#define RCAR_VIN_NUM 16
> > +
> >
> >  struct rvin_group;
> >
> > @@ -126,6 +127,7 @@ struct rvin_group_route {
> >   * struct rvin_info - Information about the particular VIN implementat=
ion
> >   * @model:		VIN model
> >   * @use_mc:		use media controller instead of controlling subdevice
> > + * @vin_max_id:		id of the last VIN instance
> >   * @max_width:		max input width the VIN supports
> >   * @max_height:		max input height the VIN supports
> >   * @routes:		list of possible routes from the CSI-2 recivers to
> > @@ -135,6 +137,7 @@ struct rvin_info {
> >  	enum model_id model;
> >  	bool use_mc;
> >
> > +	unsigned int vin_max_id;
> >  	unsigned int max_width;
> >  	unsigned int max_height;
> >  	const struct rvin_group_route *routes;
> > --
> > 2.21.0
> >
>
> --
> Regards,
> Niklas S=C3=B6derlund

--673vbjpt34j3tvk4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlywgQAACgkQcjQGjxah
Vjxk8BAApO2MAgI2gRYZUyEfLo8m3G1TslOqhR8Bsf14XR81J5JJRnLlvv2cHlkK
Cdsa1XFlfi9RYCx+z8QKGWKAvfz/B6wg9yinAIvx5wiQDpqw06mTXqzz4ka2ZNqq
Oq6kxAqJG5m60LCaLADeEsdWPCBQpsVyhmB76GKqpHV4AHnyMwkUlBeg+eWey679
FXGgodnG6IehFXLdDuwI8VZj7t7/ZRpAzTbxoS6HN1JiXocUHtsQfU2j6tLUde3H
3iHVIHy0i5q/IKubGdqJi3pr9lJUpBGu9Nmi253Pd4oF9cBZ+E9D5NBiJC2RomRy
SjtzU8r9GBgvtlU7JQA80Q1R3NdLqDeguJkXMaDUPY8jtvzj8+/rt6QwElQACAtI
7husMKSrTHamCFqPWxHndTgBQv4afS4cNrtTT4HxXlNgLKh3nqOkM/AT0y/tZOg5
/phDEp8MCzfNhn9xx6RCO+fii6WTNwDr0HH7kHVbYy1XSE+F7JOYZyUWLkjpoHsm
VUdXpESXEkBNPdc6D3nClgRsVSUKSjaL17tDXbU+wMChOp96oGtIltmQ8KOkczYX
1To4qUFkPnF2Wxv0QXI8OeTK8DpJRC5jTvMWcfRW/CE7QGoJxNOpl17FBNeZ3MO2
FWcxDQDEZeovq7TFLYu/MjKzP8Q/sz2YA5j6kIWYLto8n3ftqDQ=
=aH2P
-----END PGP SIGNATURE-----

--673vbjpt34j3tvk4--
