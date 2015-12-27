From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun4i: Use red1 LED for heartbeat
 indication on Marsboard A10
Date: Sun, 27 Dec 2015 21:51:51 +0100
Message-ID: <20151227205151.GK30359@lukather>
References: <1451123879-7212-1-git-send-email-mamlinav@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNo5QvG9KeB9cWDw"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB2M6QG2AKGQETINS34I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1451123879-7212-1-git-send-email-mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--cNo5QvG9KeB9cWDw
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Dec 26, 2015 at 12:57:59PM +0300, Aleksei Mamlin wrote:
> Marsboard A10 have four red LEDs, the first one can be used for
> heartbeat indication.
> 
> Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

I'm really not sure about this one.

This is something that can easily be changed through sysfs, and it
will likely end up being a "war" on what trigger people want to use.

Hans, Chen-Yu, What's your view on this?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--cNo5QvG9KeB9cWDw--
