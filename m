From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: sun4i: Add initial dts for
 Gemei G9 tablet
Date: Tue, 27 Jan 2015 16:09:19 +0100
Message-ID: <20150127150919.GI7200@lukather>
References: <1422295208-11016-1-git-send-email-plaes@plaes.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NqSa+Xr3J/G6Hhls"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBSWUT2TAKGQEL3KJAVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422295208-11016-1-git-send-email-plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--NqSa+Xr3J/G6Hhls
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Jan 26, 2015 at 08:00:06PM +0200, Priit Laes wrote:
> Gemei G9 is an A10 based tablet, with 1G RAM, 16G NAND, 1024x768
> IPS LCD display, stereo speakers, 1.3MP front camera and 5 MP
> rear camera, 8000mAh battery, GT901 2+1 touchscreen, Bosch BMA250
> accelerometer and RTL8188CUS USB wifi. It also has MicroSD slot,
> miniHDMI, 1 x MicroUSB OTG port and 1 x MicroUSB host port and
> 3.5mm headphone jack.
> 
> Changes since v2:
>  * Fix syntax error (brown paper bag release)
> 
> Changes since v1:
>  * Added sun4i-lradc keymap
>  * Added TODO note about missing IRQ pins for bma250
>  * Fixed formatting issues and removed external URLs
> 
> Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>

Applied, thanks!

Note that it will probably show up in 3.21. I sent the pull request
this weekend, and unless something major and unexpected shows up, I
don't plan on making new ones.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--NqSa+Xr3J/G6Hhls--
