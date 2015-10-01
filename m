From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 resend 0/4] ARM: dts: sunxi: q8 A13
 tablet backlight support
Date: Thu, 1 Oct 2015 22:33:31 +0200
Message-ID: <20151001203331.GP7104@lukather>
References: <1443522591-6590-1-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iUdyFHenu1vPh/Ml"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBUFVW2YAKGQEKGZ6A3Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443522591-6590-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--iUdyFHenu1vPh/Ml
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Sep 29, 2015 at 12:29:47PM +0200, Hans de Goede wrote:
> Hi Maxime,
> 
> This series seems to have fallen through the cracks, hence this
> resend.

No, it didn't fall through the cracks, I asked a question on the first
patch and never got a reply.

The way we handled *all* the controllers so far is that the compatible
was representing what the controllers what features the controller was
exposing. This is the case for the clocks or pinctrl for example.

We should be consistent with that (beside the fact that using a
compatible from a later SoC is wrong).

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--iUdyFHenu1vPh/Ml--
