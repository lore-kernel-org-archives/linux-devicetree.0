Return-Path: <SRS0=zLlM=SM=pengutronix.de=mfe@kernel.org>
Date: Wed, 10 Apr 2019 16:04:02 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v5 05/13] media: tvp5150: add input source selection
 of_graph support
Message-ID: <20190410140401.3ni647aaupcc5qng@pengutronix.de>
References: <20190405060317.11240-1-m.felsch@pengutronix.de>
 <20190405060317.11240-6-m.felsch@pengutronix.de>
 <20190405144542.rinp3jrczlxo3lwf@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190405144542.rinp3jrczlxo3lwf@uno.localdomain>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, p.zabel@pengutronix.de, javierm@redhat.co, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi Jacopo,

On 19-04-05 16:45, Jacopo Mondi wrote:
> Hi Marco,
> 
> On Fri, Apr 05, 2019 at 08:03:09AM +0200, Marco Felsch wrote:
> > This patch adds the of_graph support to describe the tvp connections.
> > Physical the TVP5150 has three ports: AIP1A, AIP1B and YOUT. As result
> > of discussion [1],[2] the device-tree maps these ports 1:1. The svideo
> > connector must be conneted to port@0/endpoint@1, look at the Documentation
> > for more information. Since the TVP5150 is a converter the device-tree
> > must contain at least 1-input and 1-output port. The mc-connectors and
> > mc-links are only created if the device-tree contains the corresponding
> > connector nodes. If more than one connector is available the
> > media_entity_operations.link_setup() callback ensures that only one
> > connector is active.
> >
> > [1] https://www.spinics.net/lists/linux-media/msg138545.html
> > [2] https://www.spinics.net/lists/linux-media/msg138546.html
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > Changelog:
> >
> > [1] https://patchwork.kernel.org/cover/10794703/
> > [2] https://patchwork.kernel.org/cover/10786553/
> >
> > v5:
> > - Fixing build deps:
> >   - tvp5150_mc_init: fix CONFIG_MEDIA_CONTROLLER deps
> >   - struct tvp5150: drop CONFIG_MEDIA_CONTROLLER conditional property
> >     includes. This leads into to complex deps for futher development.
> >   - tvp5150_dt_cleanup: enable function only if CONFIG_OF is enabled
> >   - tvp5150_parse_dt: enable function only if CONFIG_OF is enabled
> >   - tvp5150_probe: call tvp5150_dt_cleanup only if CONFIG_OF is enabled
> >
> > - Simplify link_setup routine:
> >   - use generic connector parsing since both series [1,2] are squashed into
> >     one
> >   - struct tvp5150: drop pads_state and modify_second_link property
> >     due to link_setup() rework.
> >   - tvp5150_link_setup: add more comments
> >   - tvp5150_link_setup: simply the link setup routine a lot. Edit the 2nd
> >     link directly within the driver instead of a recursive media-framework
> >     call (__media_entity_setup_link). This improves the readability and
> >     shrinks the driver code.
> >   - tvp5150_link_setup: disable all active links in case user switches
> >     connectors without disable it first.
> >   - tvp5150_registered: simplify default link enable path due to link_setup()
> >     rework.
> >
> > - General cleanups
> >   - tvp5150_parse_dt: drop unecessary test
> >   - tvp5150_parse_dt: add err message due to misconfiguration
> >   - tvp5150_parse_dt: make use of V4L2_MBUS_UNKNOWN definition
> >   - s/dev_dbg/dev_dbg_lvl
> >
> 
> Great, this looks much nicer!
> 
> > v4:
> >  - rebase on top of media_tree/master, fix merge conflict due to commit
> >    60359a28d592 ("media: v4l: fwnode: Initialise the V4L2 fwnode endpoints
> >    to zero")
> >
> > v3:
> > - probe(): s/err/err_free_v4l2_ctrls
> > - drop MC dependency for tvp5150_pads
> >
> > v2:
> > - adapt commit message
> > - unify ifdef switches
> > - rename tvp5150_valid_input -> tvp5150_of_valid_input, to be more precise
> > - mc: use 2-input and 1-output pad
> > - mc: link svideo connector to both input pads
> > - mc: enable/disable svideo links in one go
> > - mc: change link_setup() behaviour, switch the input src don't require a
> >       explicite disable before.
> > - mc: rename 'local' media_pad param to tvp5150_pad to avoid confusion
> > - mc: enable link to the first available connector and set the
> >       corresponding tvp5150 input src per default during registered()
> > - mc/of: factor out oftree connector allocation
> > - of: drop svideo dt port
> > - of: move svideo connector to port@0/endpoint@1
> > - of: require at least 1-in and 1-out endpoint
> >
> >  drivers/media/i2c/tvp5150.c | 408 ++++++++++++++++++++++++++++++++----
> >  1 file changed, 368 insertions(+), 40 deletions(-)
> >
> > diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> > index 89da921c8886..91504fddb551 100644
> > --- a/drivers/media/i2c/tvp5150.c
> > +++ b/drivers/media/i2c/tvp5150.c
> > @@ -44,16 +44,29 @@ MODULE_PARM_DESC(debug, "Debug level (0-2)");
> >  #define dprintk0(__dev, __arg...) dev_dbg_lvl(__dev, 0, 0, __arg)
> >
> >  enum tvp5150_pads {
> > -	TVP5150_PAD_IF_INPUT,
> > +	TVP5150_PAD_AIP1A = TVP5150_COMPOSITE0,
> > +	TVP5150_PAD_AIP1B,
> >  	TVP5150_PAD_VID_OUT,
> >  	TVP5150_NUM_PADS
> >  };
> >
> > +struct tvp5150_connector {
> > +	struct v4l2_fwnode_connector base;
> > +	struct media_entity ent;
> > +	struct media_pad pad;
> > +};
> > +
> >  struct tvp5150 {
> >  	struct v4l2_subdev sd;
> > -#ifdef CONFIG_MEDIA_CONTROLLER
> > +	/* additional additional endpoint for the svideo connector */
> 
> s/additional additional/additional/

Damn, fixed it.

> > +	struct device_node *endpoints[TVP5150_NUM_PADS + 1];
> > +	unsigned int endpoints_num;
> > +
> > +	/* media-ctl properties */
> >  	struct media_pad pads[TVP5150_NUM_PADS];
> > -#endif
> > +	struct tvp5150_connector *connectors;
> > +	int connectors_num;
> > +
> >  	struct v4l2_ctrl_handler hdl;
> >  	struct v4l2_rect rect;
> >  	struct regmap *regmap;
> > @@ -1167,6 +1180,129 @@ static int tvp5150_enum_frame_size(struct v4l2_subdev *sd,
> >  	return 0;
> >  }
> >
> > +/****************************************************************************
> > + *			Media entity ops
> > + ****************************************************************************/
> > +#if defined(CONFIG_MEDIA_CONTROLLER)
> > +static int tvp5150_set_link(struct media_pad *connector_pad,
> > +			    struct media_pad *tvp5150_pad, u32 flags)
> > +{
> > +	struct media_link *link;
> > +
> > +	link = media_entity_find_link(connector_pad, tvp5150_pad);
> > +	if (!link)
> > +		return -EINVAL;
> > +
> > +	link->flags = flags;
> > +	link->reverse->flags = link->flags;
> > +
> > +	return 0;
> > +}
> > +
> > +static int tvp5150_disable_all_input_links(struct tvp5150 *decoder)
> > +{
> > +	struct media_pad *connector_pad;
> > +	int i, err;
> 
> i can be unsigned here

Okay

> > +
> > +	for (i = 0; i < TVP5150_NUM_PADS - 1; i++) {
> > +		connector_pad = media_entity_remote_pad(&decoder->pads[i]);
> > +		if (!connector_pad)
> > +			continue;
> > +
> > +		err = tvp5150_set_link(connector_pad, &decoder->pads[i], 0);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int tvp5150_s_routing(struct v4l2_subdev *sd, u32 input, u32 output,
> > +			     u32 config);
> > +
> > +static int tvp5150_link_setup(struct media_entity *entity,
> > +			      const struct media_pad *tvp5150_pad,
> > +			      const struct media_pad *remote, u32 flags)
> > +{
> > +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> > +	struct tvp5150 *decoder = to_tvp5150(sd);
> > +	struct media_pad *other_tvp5150_pad =
> > +		&decoder->pads[tvp5150_pad->index ^ 1];
> > +	bool is_svideo = false;
> > +	int i, err;
> 
> i can be unsigned

Okay

> > +
> > +	/*
> > +	 * The TVP5150 state is determined by the enabled sink pad link(s).
> > +	 * Enabling or disabling the source pad link has no effect.
> > +	 */
> > +	if (tvp5150_pad->flags & MEDIA_PAD_FL_SOURCE)
> > +		return 0;
> > +
> > +	/* Check if the svideo connector should be enabled */
> > +	for (i = 0; i < decoder->connectors_num; i++) {
> > +		if (remote->entity == &decoder->connectors[i].ent) {
> > +			is_svideo =
> > +			   decoder->connectors[i].base.type == V4L2_CON_SVIDEO;
> > +			break;
> > +		}
> > +	}
> > +
> > +	dev_dbg_lvl(sd->dev, 1, debug, "link setup '%s':%d->'%s':%d[%d]",
> > +		    remote->entity->name, remote->index,
> > +		    tvp5150_pad->entity->name, tvp5150_pad->index,
> > +		    flags & MEDIA_LNK_FL_ENABLED);
> > +	if (is_svideo)
> > +		dev_dbg_lvl(sd->dev, 1, debug,
> > +			    "link setup '%s':%d->'%s':%d[%d]",
> > +			    remote->entity->name, remote->index,
> > +			    other_tvp5150_pad->entity->name,
> > +			    other_tvp5150_pad->index,
> > +			    flags & MEDIA_LNK_FL_ENABLED);
> > +
> > +	/*
> > +	 * The TVP5150 has a internal mux which allows the following setup:
> 
> an internal

Yes

> > +	 *
> > +	 * comp-connector1  --\
> > +	 *		       |---> AIP1A
> > +	 *		      /
> > +	 * svideo-connector -|
> > +	 *		      \
> > +	 *		       |---> AIP1B
> > +	 * comp-connector2  --/
> > +	 *
> > +	 * We can't rely on user space that the current connector gets disabled
> > +	 * first before enabling the new connector. Disable all active
> > +	 * connector links to be on the safe side.
> > +	 */
> > +	err = tvp5150_disable_all_input_links(decoder);
> > +	if (err)
> > +		return err;
> 
> Not sure here... I think you should refuse, say, to enable
> comp-connector2->AIP1B if S_VIDEO is enabled on AIP1A, or maybe that's not
> possible, as you have a single linke to AIP1B... Another example: you
> should refuse to enable comp-connector1->AIP1A if
> svideo-connector->AIP1A is enabled. These are two distinct links, so
> this should be possible. Am I wrong?

I tought the diagram and prose makes it cleaner, damn.. Thanks for
asking maybe I should think about rewording it..

In short, the svideo needs both links (AIP1A, AIP1B) enabled so there is
no AIP1A or AIP1B case since both are on. In a previouse version of this
series I added the refusing mechanism but Mauro had some concerns about
that. Since the media-api don't cover that he said the dynamic switching
should be the way to go since it is easier for the user space.

So the current solution is that there can be one link enabled (comp1 or
comp2) or two links (svideo). To handle these cases and avoid much
complexity I disable all active links first since it isn't forbidden by
the media-api.

> > +
> > +	tvp5150_s_routing(sd, is_svideo ? TVP5150_SVIDEO : tvp5150_pad->index,
> > +			  flags & MEDIA_LNK_FL_ENABLED ? TVP5150_NORMAL :
> > +			  TVP5150_BLACK_SCREEN, 0);
> > +
> > +	if (flags & MEDIA_LNK_FL_ENABLED) {
> > +		/*
> > +		 * S-Video connector is conneted to both ports AIP1A and AIP1B.
> > +		 * Both links must be enabled in one-shot regardless which link
> > +		 * the user requests.
> > +		 */
> > +		if (is_svideo) {
> > +			err = tvp5150_set_link((struct media_pad *) remote,
> > +					       other_tvp5150_pad, flags);
> > +			if (err)
> > +				return err;
> > +		}
> > +	}
> 
> This is much much nicer than v4! Great job!
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct media_entity_operations tvp5150_sd_media_ops = {
> > +	.link_setup = tvp5150_link_setup,
> > +};
> > +#endif
> >  /****************************************************************************
> >  			I2C Command
> >   ****************************************************************************/
> > @@ -1314,6 +1450,65 @@ static int tvp5150_g_tuner(struct v4l2_subdev *sd, struct v4l2_tuner *vt)
> >  	return 0;
> >  }
> >
> > +static int tvp5150_registered(struct v4l2_subdev *sd)
> > +{
> > +#if defined(CONFIG_MEDIA_CONTROLLER)
> 
> I wonder if it wouldn't make more sense to select MEDIA_CONTROLLER...
> How do you configure the device without MC, since I haven't seen support for
> platform data?

@Mauro
Can you say something about the non MC case?

I know that the em28xx device is using this driver and if I get it right
the em28xx calls the s_routing callback to set the specific input
source.

So in that case the MC mustn't available/enabled.

Luckily the em28xx can use most of the tvp5150 default config values.

> 
> > +	struct tvp5150 *decoder = to_tvp5150(sd);
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	/*
> > +	 * Setup connector pads and links. Enable the link to the first
> > +	 * available connector per default.
> > +	 */
> > +	for (i = 0; i < decoder->connectors_num; i++) {
> > +		struct media_entity *con = &decoder->connectors[i].ent;
> > +		struct media_pad *pad = &decoder->connectors[i].pad;
> > +		unsigned int port = decoder->connectors[i].base.remote_port;
> > +		bool is_svideo =
> > +			decoder->connectors[i].base.type == V4L2_CON_SVIDEO;
> > +		int flags = i ? 0 : MEDIA_LNK_FL_ENABLED;
> > +
> > +		pad->flags = MEDIA_PAD_FL_SOURCE;
> > +		ret = media_entity_pads_init(con, 1, pad);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		ret = media_device_register_entity(sd->v4l2_dev->mdev, con);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		ret = media_create_pad_link(con, 0, &sd->entity, port, flags);
> > +		if (ret < 0) {
> > +			media_device_unregister_entity(con);
> > +			return ret;
> > +		}
> > +
> > +		if (is_svideo) {
> > +			/* svideo links to both aip1a and aip1b */
> > +			ret = media_create_pad_link(con, 0, &sd->entity,
> > +						    port + 1, flags);
> > +			if (ret < 0) {
> > +				media_device_unregister_entity(con);
> > +				return ret;
> > +			}
> > +		}
> > +
> > +		/* enable default input */
> > +		if (flags == MEDIA_LNK_FL_ENABLED) {
> > +			decoder->input =
> > +				is_svideo ? TVP5150_SVIDEO :
> > +				port == 0 ? TVP5150_COMPOSITE0 :
> > +				TVP5150_COMPOSITE1;
> > +
> > +			tvp5150_selmux(sd);
> > +		}
> > +	}
> > +#endif
> > +	return 0;
> > +}
> > +
> > +
> >  /* ----------------------------------------------------------------------- */
> >
> >  static const struct v4l2_ctrl_ops tvp5150_ctrl_ops = {
> > @@ -1367,6 +1562,10 @@ static const struct v4l2_subdev_ops tvp5150_ops = {
> >  	.pad = &tvp5150_pad_ops,
> >  };
> >
> > +static const struct v4l2_subdev_internal_ops tvp5150_internal_ops = {
> > +	.registered = tvp5150_registered,
> > +};
> > +
> >  /****************************************************************************
> >  			I2C Client & Driver
> >   ****************************************************************************/
> > @@ -1515,38 +1714,171 @@ static int tvp5150_init(struct i2c_client *c)
> >  	return 0;
> >  }
> >
> > -static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
> > +#if defined(CONFIG_MEDIA_CONTROLLER)
> > +static int tvp5150_add_of_connectors(struct tvp5150 *decoder)
> >  {
> > -	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
> > -	struct device_node *ep;
> > -	unsigned int flags;
> > -	int ret = 0;
> > +	struct device *dev = decoder->sd.dev;
> > +	struct tvp5150_connector *connectors;
> > +	unsigned int connectors_num = decoder->connectors_num;
> > +	int i, ret;
> > +
> > +	/* Allocate and initialize all available input connectors */
> > +	connectors = devm_kcalloc(dev, connectors_num, sizeof(*connectors),
> > +				  GFP_KERNEL);
> > +	if (!connectors)
> > +		return -ENOMEM;
> >
> > -	ep = of_graph_get_next_endpoint(np, NULL);
> > -	if (!ep)
> > -		return -EINVAL;
> > +	for (i = 0; i < connectors_num; i++) {
> > +		struct v4l2_fwnode_connector *c = &connectors[i].base;
> >
> > -	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
> > -	if (ret)
> > -		goto err;
> > +		ret = v4l2_fwnode_parse_connector(
> > +				   of_fwnode_handle(decoder->endpoints[i]), c);
> > +
> > +		connectors[i].ent.flags = MEDIA_ENT_FL_CONNECTOR;
> > +		connectors[i].ent.function = c->type == V4L2_CON_SVIDEO ?
> > +			MEDIA_ENT_F_CONN_SVIDEO : MEDIA_ENT_F_CONN_COMPOSITE;
> > +		connectors[i].ent.name = c->label;
> 
> This is a bit of a duplication of what you're doing at parse_dt time,
> where you parse_connector() already. I guess you do this in two steps
> because you need to count connectors first, as you allocate their
> descriptor structure dynamically.
> 
> Have you considered allocating them statically (it's up to 4
> connectors, not a big waste) and populate them at parse_dt time? (you
> could re-alloc too, but let's not consider that for now).
> 
> Bonus point, if you parse_dt() then CONFIG_OF is enabled, and you can
> save the
>         if (IS_ENABLED(CONFIG_OF))
> 		ret = tvp5150_add_of_connectors(decoder);
> 
> you now have in tvp5150_mc_init()

Good point and your're right I parse it twice a time. I tought about
your suggestion but then I also tought about the case where it can be
get more complicated. Imagine you have 5 composite connectors: two
connected to AIP1A and 3 connected to AIP1B. Still the same behaviour,
only one link at the time can be enbaled. In that case you can't use
the static allocation. Anyway it isn't supported by the driver right now
but it is easier to add the support if we alloc them dynamic.

My idea between splitting was to have a correct abstraction.
Parsing/validation is done by parse_dt, the tvp5150_add_of_connectors()
relies on that result since it didn't check it again. Of course
v4l2_fwnode_parse_connector() gets parsed twice but this is done during
probe.

But your're right with that

>         if (IS_ENABLED(CONFIG_OF))
> 		ret = tvp5150_add_of_connectors(decoder);

and your last review note. That check isn't correct since it can be the
case where CONFIG_OF and CONFIG_MEDIA_CONTROLLER is enabled but the
device using the driver isn't OF-capable (e.g. em28xx usb-device). So
the check must be:

	if (decoder->connectors_num)
			ret = tvp5150_add_of_connectors(decoder);

This ensures that tvp5150_add_of_connectors() gets called only for
OF-capable devices.

> 
> > +	}
> > +
> > +	decoder->connectors = connectors;
> >
> > -	flags = bus_cfg.bus.parallel.flags;
> > +	return 0;
> > +}
> > +#endif
> >
> > -	if (bus_cfg.bus_type == V4L2_MBUS_PARALLEL &&
> > -	    !(flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH &&
> > -	      flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH &&
> > -	      flags & V4L2_MBUS_FIELD_EVEN_LOW)) {
> > +static int tvp5150_mc_init(struct v4l2_subdev *sd)
> > +{
> > +#if defined(CONFIG_MEDIA_CONTROLLER)
> > +	struct tvp5150 *decoder = to_tvp5150(sd);
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	sd->entity.ops = &tvp5150_sd_media_ops;
> > +	sd->entity.function = MEDIA_ENT_F_ATV_DECODER;
> > +
> > +	/* Initialize all TVP5150 pads */
> > +	for (i = 0; i < TVP5150_NUM_PADS; i++) {
> > +		if (i < TVP5150_NUM_PADS - 1) {
> > +			decoder->pads[i].flags = MEDIA_PAD_FL_SINK;
> > +			decoder->pads[i].sig_type = PAD_SIGNAL_ANALOG;
> > +		} else {
> > +			decoder->pads[i].flags = MEDIA_PAD_FL_SOURCE;
> > +			decoder->pads[i].sig_type = PAD_SIGNAL_DV;
> > +		}
> > +	}
> > +	ret = media_entity_pads_init(&sd->entity, TVP5150_NUM_PADS,
> > +				     decoder->pads);
> > +	if (ret < 0)
> > +		goto out;
> > +
> > +	if (IS_ENABLED(CONFIG_OF))
> > +		ret = tvp5150_add_of_connectors(decoder);
> > +out:
> > +	return ret;
> > +#else
> > +	return 0;
> > +#endif
> 
> This would really read better as:

Good point, I will change that or should I rather change the
tvp5150_mc_init() call during the probe to

tvp5150_probe()
{
	...

	if(IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
		tvp5150_mc_init()

	...
}

> #if defined(CONFIG_MEDIA_CONTROLLER)
> static int tvp5150_mc_init(struct v4l2_subdev *sd)
> {
>         ...
> 
> }
> static int tvp5150_mc_init(struct v4l2_subdev *sd)
> {
>         ....
> }
> #else /* defined(CONFIG_MEDIA_CONTROLLER) */
> static int tvp5150_mc_init(struct v4l2_subdev *sd)
> {
>         return 0;
> }
> static int tvp5150_mc_init(struct v4l2_subdev *sd)
> {
>         return 0;
> }
> #endif /* defined(CONFIG_MEDIA_CONTROLLER) */
> 
> > +}
> > +
> > +#if defined(CONFIG_OF)
> 
> Do you need this? I tried compiling with OF support disabled and this
> #if guard removed and all went fine. After all, all calls to parse_dt
> and dt_cleanup are already guarded by an IS_ENABLED(CONFIG_OF)

My goal was to reduce the code size in case OF isn't enabled since the
call don't depend only on the CONFIG_OF this function won't be threw
away in case CONFIG_OF is disabled if I got it right.

	if (IS_ENABLED(CONFIG_OF) && np)

But you're right I can remove it to reducing the ifdef switches.

> > +static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
> > +{
> > +	struct device *dev = decoder->sd.dev;
> > +	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = V4L2_MBUS_UNKNOWN };
> > +	struct v4l2_fwnode_connector c;
> 
> Could you declare this inside the for loop?

Of course.

> > +	struct device_node *ep_np;
> > +	unsigned int flags;

Moved flags inside the for loop too.

> > +	int ret, i = 0, in = 0;
> 
> i and in could be unsigned

okay

> > +	bool found = false;
> > +
> > +	/* at least 1 output and 1 input */
> > +	decoder->endpoints_num = of_graph_get_endpoint_count(np);
> > +	if (decoder->endpoints_num < 2 || decoder->endpoints_num > 4) {
> > +		dev_err(dev, "At least 1 input and 1 output must be connected to the device.\n");
> >  		ret = -EINVAL;
> >  		goto err;
> >  	}
> >
> > -	decoder->mbus_type = bus_cfg.bus_type;
> > +	for_each_endpoint_of_node(np, ep_np) {
> > +		struct of_endpoint ep;
> > +
> > +		of_graph_parse_endpoint(ep_np, &ep);
> > +		switch (ep.port) {
> > +			/* fall through */
> 
> Move this below the case please

Yes.

> > +		case TVP5150_PAD_AIP1A:
> > +		case TVP5150_PAD_AIP1B:
> > +			ret = v4l2_fwnode_parse_connector(
> > +						   of_fwnode_handle(ep_np), &c);
> > +			if (c.type != V4L2_CON_COMPOSITE &&
> > +			    c.type != V4L2_CON_SVIDEO) {
> > +				dev_err(dev,
> > +					"Invalid endpoint %d on port %d\n",
> > +					c.remote_id, c.remote_port);
> > +				ret = -EINVAL;
> > +				goto err;
> > +			}
> > +			in++;
> > +			break;
> > +		case TVP5150_PAD_VID_OUT:
> > +			ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_np),
> > +							 &bus_cfg);
> > +			if (ret)
> > +				goto err;
> > +
> > +			flags = bus_cfg.bus.parallel.flags;
> > +
> > +			if (bus_cfg.bus_type == V4L2_MBUS_PARALLEL &&
> > +			    !(flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH &&
> > +			      flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH &&
> > +			      flags & V4L2_MBUS_FIELD_EVEN_LOW)) {
> > +				ret = -EINVAL;
> > +				goto err;
> > +			}
> > +
> > +			decoder->mbus_type = bus_cfg.bus_type;
> > +			break;
> > +		default:
> > +			dev_err(dev, "Invalid port %d for endpoint %pOF\n",
> > +				ep.port, ep.local_node);
> > +			ret = -EINVAL;
> > +			goto err;
> > +		}
> > +
> > +		of_node_get(ep_np);
> > +		decoder->endpoints[i] = ep_np;
> > +		i++;
> >
> > +		found = true;
> > +	}
> > +
> > +	decoder->connectors_num = in;
> > +	return found ? 0 : -ENODEV;
> >  err:
> > -	of_node_put(ep);
> >  	return ret;
> >  }
> >
> > +static void tvp5150_dt_cleanup(struct tvp5150 *decoder)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < TVP5150_NUM_PADS; i++)
> > +		of_node_put(decoder->endpoints[i]);
> > +}
> > +
> > +#else /* !defined(CONFIG_OF) */
> > +
> > +static inline int
> > +tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
> > +{
> > +	return 0;
> > +}
> > +
> > +static inline void tvp5150_dt_cleanup(struct tvp5150 *decoder)
> > +{
> > +
> > +}
> > +#endif
> > +
> >  static const char * const tvp5150_test_patterns[2] = {
> >  	"Disabled",
> >  	"Black screen"
> > @@ -1585,7 +1917,7 @@ static int tvp5150_probe(struct i2c_client *c,
> >  		res = tvp5150_parse_dt(core, np);
> >  		if (res) {
> >  			dev_err(sd->dev, "DT parsing error: %d\n", res);
> > -			return res;
> > +			goto err_cleanup_dt;
> >  		}
> >  	} else {
> >  		/* Default to BT.656 embedded sync */
> > @@ -1593,25 +1925,16 @@ static int tvp5150_probe(struct i2c_client *c,
> >  	}
> >
> >  	v4l2_i2c_subdev_init(sd, c, &tvp5150_ops);
> > +	sd->internal_ops = &tvp5150_internal_ops;
> >  	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> >
> > -#if defined(CONFIG_MEDIA_CONTROLLER)
> > -	core->pads[TVP5150_PAD_IF_INPUT].flags = MEDIA_PAD_FL_SINK;
> > -	core->pads[TVP5150_PAD_IF_INPUT].sig_type = PAD_SIGNAL_ANALOG;
> > -	core->pads[TVP5150_PAD_VID_OUT].flags = MEDIA_PAD_FL_SOURCE;
> > -	core->pads[TVP5150_PAD_VID_OUT].sig_type = PAD_SIGNAL_DV;
> > -
> > -	sd->entity.function = MEDIA_ENT_F_ATV_DECODER;
> > -
> > -	res = media_entity_pads_init(&sd->entity, TVP5150_NUM_PADS, core->pads);
> > -	if (res < 0)
> > -		return res;
> > -
> > -#endif
> > +	res = tvp5150_mc_init(sd);
> > +	if (res)
> > +		goto err_cleanup_dt;
> >
> >  	res = tvp5150_detect_version(core);
> >  	if (res < 0)
> > -		return res;
> > +		goto err_cleanup_dt;
> >
> >  	core->norm = V4L2_STD_ALL;	/* Default is autodetect */
> >  	core->detected_norm = V4L2_STD_UNKNOWN;
> > @@ -1637,7 +1960,7 @@ static int tvp5150_probe(struct i2c_client *c,
> >  	sd->ctrl_handler = &core->hdl;
> >  	if (core->hdl.error) {
> >  		res = core->hdl.error;
> > -		goto err;
> > +		goto err_free_v4l2_ctrls;
> >  	}
> >
> >  	tvp5150_set_default(tvp5150_read_std(sd), &core->rect);
> > @@ -1649,19 +1972,24 @@ static int tvp5150_probe(struct i2c_client *c,
> >  						tvp5150_isr, IRQF_TRIGGER_HIGH |
> >  						IRQF_ONESHOT, "tvp5150", core);
> >  		if (res)
> > -			goto err;
> > +			goto err_free_v4l2_ctrls;
> >  	}
> >
> >  	res = v4l2_async_register_subdev(sd);
> >  	if (res < 0)
> > -		goto err;
> > +		goto err_free_v4l2_ctrls;
> >
> >  	if (debug > 1)
> >  		tvp5150_log_status(sd);
> > +
> >  	return 0;
> >
> > -err:
> > +err_free_v4l2_ctrls:
> >  	v4l2_ctrl_handler_free(&core->hdl);
> > +err_cleanup_dt:
> > +	if (IS_ENABLED(CONFIG_OF) && np)
> 
> is there any case where CONFIG_OF is enabled and dev->of_node might be
> NULL ? How did the driver probed in first place if that was the case.

I think that can be the case if you have an embedded device (of-support)
where a tvp5150 is connected directly and an attached em28xx usb device.

> 
> I made to the end of this big patch :p quite a nice one!

Thanks for your feedback =)

> Thanks
>   j
> 

Regards,
  Marco

> > +		tvp5150_dt_cleanup(core);
> > +
> >  	return res;
> >  }
> >
> > --
> > 2.20.1
> >



-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
