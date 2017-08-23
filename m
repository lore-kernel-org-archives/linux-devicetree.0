From: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] media: V3s: Add support for
 Allwinner CSI.
Date: Wed, 23 Aug 2017 10:32:16 +0800
Message-ID: <20170823103216.e43283308c195c4a80d929fa@magewell.com>
References: <1501131697-1359-1-git-send-email-yong.deng@magewell.com>
	<1501131697-1359-2-git-send-email-yong.deng@magewell.com>
	<20170728160233.xooevio4hoqkgfaq@flea.lan>
	<20170731111640.d5a8e580a48183cfce85943d@magewell.com>
	<20170822174339.6woauylgzkgqxygk@flea.lan>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD2JNYHK4MEBBO6S6PGAKGQET3H2SOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170822174339.6woauylgzkgqxygk-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sun
List-Id: devicetree@vger.kernel.org

On Tue, 22 Aug 2017 19:43:39 +0200
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hi Yong,
>=20
> On Mon, Jul 31, 2017 at 11:16:40AM +0800, Yong wrote:
> > > > @@ -143,6 +143,7 @@ source "drivers/media/platform/am437x/Kconfig"
> > > >  source "drivers/media/platform/xilinx/Kconfig"
> > > >  source "drivers/media/platform/rcar-vin/Kconfig"
> > > >  source "drivers/media/platform/atmel/Kconfig"
> > > > +source "drivers/media/platform/sun6i-csi/Kconfig"
> > >=20
> > > We're going to have several different drivers in v4l eventually, so I
> > > guess it would make sense to move to a directory of our own.
> >=20
> > Like this?
> > drivers/media/platform/sunxi/sun6i-csi
>=20
> Yep.
>=20
> > > > +static int sun6i_graph_notify_complete(struct v4l2_async_notifier =
*notifier)
> > > > +{
> > > > +	struct sun6i_csi *csi =3D
> > > > +			container_of(notifier, struct sun6i_csi, notifier);
> > > > +	struct sun6i_graph_entity *entity;
> > > > +	int ret;
> > > > +
> > > > +	dev_dbg(csi->dev, "notify complete, all subdevs registered\n");
> > > > +
> > > > +	/* Create links for every entity. */
> > > > +	list_for_each_entry(entity, &csi->entities, list) {
> > > > +		ret =3D sun6i_graph_build_one(csi, entity);
> > > > +		if (ret < 0)
> > > > +			return ret;
> > > > +	}
> > > > +
> > > > +	/* Create links for video node. */
> > > > +	ret =3D sun6i_graph_build_video(csi);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > >=20
> > > Can you elaborate a bit on the difference between a node parsed with
> > > _graph_build_one and _graph_build_video? Can't you just store the
> > > remote sensor when you build the notifier, and reuse it here?
> >=20
> > There maybe many usercases:
> > 1. CSI->Sensor.
> > 2. CSI->MIPI->Sensor.
> > 3. CSI->FPGA->Sensor1
> >             ->Sensor2.
> > FPGA maybe some other video processor. FPGA, MIPI, Sensor can be
> > registered as v4l2 subdevs. We do not care about the driver code
> > of them. But they should be linked together here.
> >=20
> > So, the _graph_build_one is used to link CSI port and subdevs.=20
> > _graph_build_video is used to link CSI port and video node.
>=20
> So the graph_build_one is for the two first cases, and the
> _build_video for the latter case?

No.=20
The _graph_build_one is used to link the subdevs found in the device=20
tree. _build_video is used to link the closest subdev to video node.
Video node is created in the driver, so the method to get it's pad is
diffrent to the subdevs.

>=20
> If so, you should take a look at the last iteration of the
> subnotifiers rework by Nikas S=C3=B6derlund (v4l2-async: add subnotifier
> registration for subdevices).
>=20
> It allows subdevs to register notifiers, and you don't have to build
> the graph from the video device, each device and subdev can only care
> about what's next in the pipeline, but not really what's behind it.
>=20
> That would mean in your case that you can only deal with your single
> CSI pad, and whatever subdev driver will use it care about its own.

Do you mean the subdevs create pad link in the notifier registered by
themself ?
If so, _graph_build_one is needless. But how to make sure the pipeline
has linked correctly when operateing the pipeline.=20
I will lookt at this in more detail.

>=20
> > This part is also difficult to understand for me. The one CSI module
> > have only one DMA channel(single port). But thay can be linked to=20
> > different physical port (Parallel or MIPI)(multiple ep) by IF select
> > register.
> >=20
> > For now, the binding can have several ep, the driver will just pick
> > the first valid one.
>=20
> Yeah, I'm not really sure how we could deal with that, but I guess we
> can do it later on.
>=20
> > >=20
> > > > +struct sun6i_csi_ops {
> > > > +	int (*get_supported_pixformats)(struct sun6i_csi *csi,
> > > > +					const u32 **pixformats);
> > > > +	bool (*is_format_support)(struct sun6i_csi *csi, u32 pixformat,
> > > > +				  u32 mbus_code);
> > > > +	int (*s_power)(struct sun6i_csi *csi, bool enable);
> > > > +	int (*update_config)(struct sun6i_csi *csi,
> > > > +			     struct sun6i_csi_config *config);
> > > > +	int (*update_buf_addr)(struct sun6i_csi *csi, dma_addr_t addr);
> > > > +	int (*s_stream)(struct sun6i_csi *csi, bool enable);
> > > > +};
> > >=20
> > > Didn't we agreed on removing those in the first iteration? It's not
> > > really clear at this point whether they will be needed at all. Make
> > > something simple first, without those ops. When we'll support other
> > > SoCs we'll have a better chance at seeing what and how we should deal
> > > with potential quirks.
> >=20
> > OK. But without ops, it is inappropriate to sun6i_csi and sun6i_csi.
> > Maybe I should merge the two files.
>=20
> I'm not sure what you meant here, but if you think that's appropriate,
> please go ahead.
>=20
> > > > +		return IRQ_HANDLED;
> > > > +	}
> > > > +
> > > > +	if (status & CSI_CH_INT_STA_FD_PD) {
> > > > +		sun6i_video_frame_done(&sdev->csi.video);
> > > > +	}
> > > > +
> > > > +	regmap_write(regmap, CSI_CH_INT_STA_REG, status);
> > >=20
> > > Isn't it redundant with the one you did in the condition a bit above?
> > >=20
> > > You should also check that your device indeed generated an
> > > interrupt. In the occurence of a spourious interrupt, your code will
> > > return IRQ_HANDLED, which is the wrong thing to do.
> > >=20
> > > I think you should reverse your logic a bit here to make this
> > > easier. You should just check that your status flags are indeed set,
> > > and if not just bail out and return IRQ_NONE.
> > >=20
> > > And if they are, go on with treating your interrupt.
> >=20
> > OK. I will add check for status flags.
> > BTW, how can a spurious interrupt occurred?
>=20
> Usually it's either through some interference, or some poorly designed
> controller. This is unlikely, but it's something you should take into
> account.
>=20
> Thanks!
> Maxime
>=20
> --=20
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com


Thanks,
Yong

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
