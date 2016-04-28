From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 05/11] drm: Add Allwinner A10 Display
 Engine support
Date: Thu, 28 Apr 2016 09:40:59 +0200
Message-ID: <20160428074059.GC17159@lukather>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
 <1461590572-4027-6-git-send-email-maxime.ripard@free-electrons.com>
 <20160426111419.63db18d4@bbrezillon>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBEP5Q24QKGQEIWH4GAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160426111419.63db18d4@bbrezillon>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Boris,

On Tue, Apr 26, 2016 at 11:14:19AM +0200, Boris Brezillon wrote:
> Hi Maxime,
> 
> On Mon, 25 Apr 2016 15:22:46 +0200
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
> > The Allwinner A10 and subsequent SoCs share the same display pipeline, with
> > variations in the number of controllers (1 or 2), or the presence or not of
> > some output (HDMI, TV, VGA) or not.
> > 
> > Add a driver with a limited set of features for now, and we will hopefully
> > support all of them eventually
> > 
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> Just 2 comments below. Once addressed you can add my
> 
> Reviewed-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> > ---
> 
> [...]
> 
> > +
> > +static int sun4i_drv_connector_plug_all(struct drm_device *drm)
> > +{
> > +	struct drm_connector *connector, *failed;
> > +	int ret;
> > +
> > +	mutex_lock(&drm->mode_config.mutex);
> > +	list_for_each_entry(connector, &drm->mode_config.connector_list, head) {
> > +		ret = drm_connector_register(connector);
> > +		if (ret) {
> > +			failed = connector;
> > +			goto err;
> > +		}
> > +	}
> > +	mutex_unlock(&drm->mode_config.mutex);
> > +	return 0;
> > +
> > +err:
> > +	list_for_each_entry(connector, &drm->mode_config.connector_list, head) {
> > +		if (failed == connector)
> > +			break;
> > +
> > +		drm_connector_unregister(connector);
> > +	}
> > +	mutex_unlock(&drm->mode_config.mutex);
> > +
> > +	return ret;
> > +}
> 
> You can use the generic drm_connector_register_all() to do that.
> 
> [...]
> 
> > +
> > +static void sun4i_drv_unbind(struct device *dev)
> > +{
> > +	struct drm_device *drm = dev_get_drvdata(dev);
> > +
> 
> And you probably miss a call to drm_connector_unregister_all() here.

Thanks, I'll fix that.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--/3yNEOqWowh/8j+e--
