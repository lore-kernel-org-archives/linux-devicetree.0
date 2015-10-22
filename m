From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun4i: Add dts file for the
 pov protab2-ips9 tablet
Date: Thu, 22 Oct 2015 10:58:24 +0200
Message-ID: <20151022085824.GU10947@lukather>
References: <1445378669-21622-1-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZjLa2K+dB9SFbrgo"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBMOKUKYQKGQELFVGU3Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445378669-21622-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--ZjLa2K+dB9SFbrgo
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Oct 21, 2015 at 12:04:29AM +0200, Hans de Goede wrote:
> The Point of View protab2-ips9 is a tablet with a 9" ips 1024x768 lcd screen,
> microsd slot, headphones, mini hdmi, mini usb b and power barrel connectors.
> 
> It uses a rtl8188cus usb wifi chip and a RDA 5875Y bluetooth chip attached
> to uart2. It has a bma250 accelerometer attached to i2c1 addr 0x18, this
> only works when ldo3 is set to 2.8 volt, otherwise i2c1 gets stuck, so
> for now we mark i2c1 as failed.
> 
> It has a pixcir,pixcir_tangoc compatible touchscreen attached to i2c2 addr
> 0x5c. This is not enabled in this dts, because this variant of the
> pixcir_tangoc has separate wakeup and enable pins both of which need
> to be driven low before the touchscreen will work. Before we can enable
> this the pixcir driver and devicetree-bindings need to be extended to
> support these pins.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--ZjLa2K+dB9SFbrgo--
