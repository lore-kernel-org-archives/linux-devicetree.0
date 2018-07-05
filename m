From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun8i: h3: Enable dwmac-sun8i
 on the Beelink X2
Date: Thu, 5 Jul 2018 16:53:14 +0200
Message-ID: <20180705145314.mo3zaux6duxig3zc@flea>
References: <20180704083003.26849-1-codekipper@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jx6nqydhjw34hgf2"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBZXB7DMQKGQEEOPDO6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180704083003.26849-1-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: wens-jdAy2FN1RRM@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jx6nqydhjw34hgf2
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Jul 04, 2018 at 10:30:03AM +0200, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> The enabling of the EMAC was reverted as there was an issue on how
> to handle the integrated PHY and it was getting close to the release
> window (fe45174b72ae ("arm: dts: sunxi: Revert EMAC changes")).
> 
> When a solution was found, then the changes were restored in
> 4b236a0fe512 ("arm: dts: sunxi: h3/h5: Restore EMAC changes") and
> 4904337fe34f ("ARM: dts: sunxi: Restore EMAC changes (boards)").
> Unfortunately enabling for the Beelink X2 was missed.
> 
> This reverts partially commit 6b0e06df5cad (Revert "ARM: dts:
> sun8i: h3: Enable dwmac-sun8i on the Beelink X2")
> 
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--jx6nqydhjw34hgf2--
