From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 2/2] musb: Add support for the Allwinner
 sunxi musb controller
Date: Tue, 2 Jun 2015 10:02:20 -0500
Message-ID: <20150602150220.GB9623@saruman.tx.rr.com>
References: <1433088626-8858-1-git-send-email-hdegoede@redhat.com>
 <1433088626-8858-3-git-send-email-hdegoede@redhat.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Return-path: <linux-sunxi+bncBC5M7T4HYEKRBCMMW6VQKGQEDGSFDRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1433088626-8858-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sun, May 31, 2015 at 06:10:26PM +0200, Hans de Goede wrote:
> This is based on initial code to get the Allwinner sunxi musb controller
> supported by Chen-Yu Tsai and Roman Byshko.
> 
> This adds support for the Allwinner sunxi musb controller in both host only
> and otg mode. Peripheral only mode is not supported, as no boards use that.
> 
> This has been tested on a cubietruck (A20 SoC) and an UTOO P66 tablet
> (A13 SoC) with a variety of devices in host mode and with the g_serial gadget
> driver in peripheral mode, plugging otg / host cables in/out a lot of times
> in all possible imaginable plug orders.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

this looks good, I'd say it's ready for v4.3

-- 
balbi
--OwLcNYc0lM97+oe1--
