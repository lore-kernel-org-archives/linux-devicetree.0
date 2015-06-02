From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 1/2] phy-sun4i-usb: Add full support for
 usb0 phy / OTG
Date: Tue, 2 Jun 2015 17:22:26 +0200
Message-ID: <20150602152226.GB23777@lukather>
References: <1433088626-8858-1-git-send-email-hdegoede@redhat.com>
 <1433088626-8858-2-git-send-email-hdegoede@redhat.com>
 <20150601092249.GF17267@lukather>
 <556C25B7.80708@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9q+4pEgVd7t11q9L"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBTUVW6VQKGQESWWT5QA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <556C25B7.80708-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--9q+4pEgVd7t11q9L
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Mon, Jun 01, 2015 at 11:28:23AM +0200, Hans de Goede wrote:
> On 01-06-15 11:22, Maxime Ripard wrote:
> >On Sun, May 31, 2015 at 06:10:25PM +0200, Hans de Goede wrote:
> >>+	/* We either want both gpio pins or neither (when in host mode) */
> >>+	if (!data->id_det_gpio != !data->vbus_det_gpio) {
> >>+		dev_err(dev, "failed to get id or vbus detect pin\n");
> >>+		return -ENODEV;
> >>+	}
> >
> >The fact that the driver expects both to be set if one is should be in
> >the binding documentation.
> 
> That would be behavior description, and I've always been told that the
> binding should only document the hardware description, not the behavior.

Yes, that's true, but here it looks more like there's no point of
having one without the other.

Pretty much like interrupt-parent and interrupt. A single one doesn't
really make much sense without the other.

And I don't think saying that you would need some additional
properties when in device mode rather than in host mode is really
documenting a behaviour. It does change things at a hardware level
too.

> Also this may change in the future as we add support for more boards,
> e.g. the cubieboard seems to be unable to turn vbus off ever, so vbus-det
> will always read as 1 / high, making it rather useless. This is something
> which I still need to figure out how to deal with.

We can always figure it out in due time.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--9q+4pEgVd7t11q9L--
