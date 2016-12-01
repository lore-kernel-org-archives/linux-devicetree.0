From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: Re: [PATCH v7 4/8] drm/sunxi: Add DT bindings
 documentation of Allwinner HDMI
Date: Thu, 1 Dec 2016 12:30:09 +0100
Message-ID: <20161201123009.d2b4d9d389070200c54138ee@free.fr>
References: <cover.1480414715.git.moinejf@free.fr>
	<1971681480527210@web5g.yandex.ru>
	<20161201085520.tk2kdi33rn6fyld2@lukather>
	<5021537.YAZCMeDTSh@avalon>
Reply-To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBRMTQDBAKGQEGTUFCQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <5021537.YAZCMeDTSh@avalon>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 01 Dec 2016 12:41:20 +0200
Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:

> > > If a DVI connector instead of a HDMI connector is soldered, how
> > > should such a device tree be written?
> >=20
> > Use a dvi-connector instead :)
>=20
> The HDMI encoder DT node doesn't (and certainly shouldn't) report what ty=
pe of=20
> connector is mounted on the board. Having a connector node in DT makes th=
e=20
> connector type available to the system, allowing the DRM driver to expose=
 the=20
> right connector type to userspace (it would be confusing for the user to=
=20
> report DRM_MODE_CONNECTOR_HDMIA for a DVI connector).

The connector type, HDMI or DVI, is known by the EDID.
The user is not interested by the software indication of the connector
type: (s)he knows it because (s)he connected him/herself the display
device.
And the DRM driver does not do anything from the knowledge of the
connector type in the DT. Only the EDID may tell if the display device
may do audio streaming (direct HDMI with audio capability) or not
(direct HDMI without audio, HDMI to DVI cable, DVI physical connector).

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
