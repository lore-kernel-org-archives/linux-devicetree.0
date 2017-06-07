From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: allwinner: h5: enable
 dwmac-sun8i for Nano Pi NEO2
Date: Wed, 7 Jun 2017 15:27:07 +0200
Message-ID: <20170607132707.nh2icuxnbest6swx@flea.lan>
References: <20170607002305.15897-1-icenowy@aosc.io>
 <20170607002305.15897-3-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lai34mdvavhhvvpj"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBLH637EQKGQEQWOLOAY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170607002305.15897-3-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--lai34mdvavhhvvpj
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Jun 07, 2017 at 08:23:05AM +0800, Icenowy Zheng wrote:
> Add the required DT parts to enable Ethernet (dwmac-sun8i driver) on
> the Nano Pi NEO2 board. It uses an external Realtek RTL8211E PHY
> connected via RGMII to provide GbE network. Specially unlike other
> Allwinner boards, the phy is connected to MDIO address 7, not 1.
> 
> This includes the regulator (which is controlled by a GPIO pin) and
> the actual Ethernet MAC node, referring the RGMII pins of the device.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Applied all three, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--lai34mdvavhhvvpj--
