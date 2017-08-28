From: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] media: V3s: Add support for
 Allwinner CSI.
Date: Mon, 28 Aug 2017 15:00:42 +0800
Message-ID: <20170828150042.1832cfd1bfbeadf1e62e8019@magewell.com>
References: <1501131697-1359-1-git-send-email-yong.deng@magewell.com>
	<1501131697-1359-2-git-send-email-yong.deng@magewell.com>
	<20170728160233.xooevio4hoqkgfaq@flea.lan>
	<20170731111640.d5a8e580a48183cfce85943d@magewell.com>
	<20170822174339.6woauylgzkgqxygk@flea.lan>
	<20170823103216.e43283308c195c4a80d929fa@magewell.com>
	<20170825134114.rwttrmzw5gbtwdx2@flea.lan>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD2JNYHK4MEBBJP7R3GQKGQEM5DHXQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170825134114.rwttrmzw5gbtwdx2-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sun
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Fri, 25 Aug 2017 15:41:14 +0200
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hi Yong,
>=20
> On Wed, Aug 23, 2017 at 10:32:16AM +0800, Yong wrote:
> > > > > > +static int sun6i_graph_notify_complete(struct v4l2_async_notif=
ier *notifier)
> > > > > > +{
> > > > > > +	struct sun6i_csi *csi =3D
> > > > > > +			container_of(notifier, struct sun6i_csi, notifier);
> > > > > > +	struct sun6i_graph_entity *entity;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	dev_dbg(csi->dev, "notify complete, all subdevs registered\n"=
);
> > > > > > +
> > > > > > +	/* Create links for every entity. */
> > > > > > +	list_for_each_entry(entity, &csi->entities, list) {
> > > > > > +		ret =3D sun6i_graph_build_one(csi, entity);
> > > > > > +		if (ret < 0)
> > > > > > +			return ret;
> > > > > > +	}
> > > > > > +
> > > > > > +	/* Create links for video node. */
> > > > > > +	ret =3D sun6i_graph_build_video(csi);
> > > > > > +	if (ret < 0)
> > > > > > +		return ret;
> > > > >=20
> > > > > Can you elaborate a bit on the difference between a node parsed w=
ith
> > > > > _graph_build_one and _graph_build_video? Can't you just store the
> > > > > remote sensor when you build the notifier, and reuse it here?
> > > >=20
> > > > There maybe many usercases:
> > > > 1. CSI->Sensor.
> > > > 2. CSI->MIPI->Sensor.
> > > > 3. CSI->FPGA->Sensor1
> > > >             ->Sensor2.
> > > > FPGA maybe some other video processor. FPGA, MIPI, Sensor can be
> > > > registered as v4l2 subdevs. We do not care about the driver code
> > > > of them. But they should be linked together here.
> > > >=20
> > > > So, the _graph_build_one is used to link CSI port and subdevs.=20
> > > > _graph_build_video is used to link CSI port and video node.
> > >=20
> > > So the graph_build_one is for the two first cases, and the
> > > _build_video for the latter case?
> >=20
> > No.=20
> > The _graph_build_one is used to link the subdevs found in the device=20
> > tree. _build_video is used to link the closest subdev to video node.
> > Video node is created in the driver, so the method to get it's pad is
> > diffrent to the subdevs.
>=20
> Sorry for being slow here, I'm still not sure I get it.
>=20
> In summary, both the sun6i_graph_build_one and sun6i_graph_build_video
> will iterate over each endpoint, will retrieve the remote entity, and
> will create the media link between the CSI pad and the remote pad.
>=20
> As far as I can see, there's basically two things that
> sun6i_graph_build_one does that sun6i_graph_build_video doesn't:
>   - It skips all the links that would connect to one of the CSI sinks
>   - It skips all the links that would connect to a remote node that is
>     equal to the CSI node.
>=20
> I assume the latter is because you want to avoid going in an infinite
> loop when you would follow one of the CSI endpoint (going to the
> sensor), and then follow back the same link in the opposite
> direction. Right?

Not exactly. But any way, some code is true redundant here. I will=20
make some improve.

>=20
> I'm confused about the first one though. All the pads you create in
> your driver are sink pads, so wouldn't that skip all the pads of the
> CSI nodes?
>=20
> Also, why do you iterate on all the CSI endpoints, when there's only
> of them? You want to anticipate the future binding for devices with
> multiple channels?
>=20
> > >=20
> > > If so, you should take a look at the last iteration of the
> > > subnotifiers rework by Nikas S=C3=B6derlund (v4l2-async: add subnotif=
ier
> > > registration for subdevices).
> > >=20
> > > It allows subdevs to register notifiers, and you don't have to build
> > > the graph from the video device, each device and subdev can only care
> > > about what's next in the pipeline, but not really what's behind it.
> > >=20
> > > That would mean in your case that you can only deal with your single
> > > CSI pad, and whatever subdev driver will use it care about its own.
> >=20
> > Do you mean the subdevs create pad link in the notifier registered by
> > themself ?
>=20
> Yes.
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
