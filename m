From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 0/5] Add support for the R_CCU on
 Allwinner H3/A64 SoCs
Date: Tue, 4 Apr 2017 17:45:44 +0200
Message-ID: <20170404154544.ofecao56dpcvk3wc@lukather>
References: <20170404095100.18649-1-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xestqvaia3sdnjo7"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBM77R3DQKGQEJPLPGDQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170404095100.18649-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xestqvaia3sdnjo7
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Apr 04, 2017 at 05:50:55PM +0800, Icenowy Zheng wrote:
> Allwinner SoCs after sun6i-a31 nearly all have a R_CCU in PRCM part.
> (V3s and R40 do not have it, as they have even no PRCM)
> 
> This patch adds support for the ones on H3/A64.
> 
> Some clock/reset values are reserved for easier extending the support to
> A31/A23, but for this I think some changes to the PRCM MFD should be made,
> see [1] (Although this is only a sketch).
> 
> The r_pio device node is also added for A64, as the driver is already
> merged, and its depends (r_ccu) is now met.

Applied all, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--xestqvaia3sdnjo7--
