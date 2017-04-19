From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: sunxi: device tree pinctrl clean
 up and H3 OTG
Date: Wed, 19 Apr 2017 16:54:10 +0200
Message-ID: <20170419145410.k2nkyfrz6ss7o2tt@lukather>
References: <20170419050919.6762-1-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dp6oxvrep2jjmtlc"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBE7U3XDQKGQEB23VEQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170419050919.6762-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--dp6oxvrep2jjmtlc
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Apr 19, 2017 at 01:09:15PM +0800, Chen-Yu Tsai wrote:
> Hi Maxime,
> 
> This series has 2 parts. The parts are largely unrelated, though the
> second part should be applied after the first part, so we don't
> accidentally mux pins that we shouldn't. Hence I'm sending them
> together.
> 
> The first 2 patches clean up the sunxi device tree files, removing
> pinmux settings for common GPIO pins. These include the enable pins
> for the common regulators, and the mmc0 card detect pin from the
> reference designs.
> 
> The second part, the latter 2 patches, enable USB OTG on the Orangepi
> PC, PC Plus, Plus 2E, and the Bananapi M2+. The first 3 boards are
> bunched together, due to how the PC Plus and Plus 2E device trees include
> the device tree of the Opi PC.

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--dp6oxvrep2jjmtlc--
