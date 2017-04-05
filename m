From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: allwinner: a64: add USB0
 OHCI/EHCI related devicetree parts
Date: Wed, 5 Apr 2017 10:13:10 +0200
Message-ID: <20170405081310.fxts5ut7srtnjiiy@lukather>
References: <20170404184518.33610-1-icenowy@aosc.io>
 <20170404184518.33610-2-icenowy@aosc.io>
 <20170405071508.yaur35xuli4jgkfb@lukather>
 <7828ffa0-f570-9841-a9e6-fe175f8169ac@aosc.io>
 <20170405072631.ou4e5gafvagwpykq@lukather>
 <a4ca2175-b4df-42e4-1f85-20d34430d4dc@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ionnfoinzxo4d4vt"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBF6OSLDQKGQEO456QJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <a4ca2175-b4df-42e4-1f85-20d34430d4dc-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ionnfoinzxo4d4vt
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Apr 05, 2017 at 03:33:09PM +0800, Icenowy Zheng wrote:
> > > P.S. to be compatible with older DTs, I think I should adjust
> > > the phy driver, make it enable dual-route function only when
> > > pmu0 is present.
> > 
> > That, or if we're quick enough, we can still add it to 4.11. There's a
> > bit of time left.
> 
> Thus the device tree binding patch and the DT part of this patchset
> should be all pushed to 4.11 .
> 
> The device tree binding patch is commit ee73fd7dfc86 ("dt: bindings:
> add pmu0 regs for USB PHYs on Allwinner H3/V3s/A64").

It should have always been there. If there is a register for the PHY
somewhere, it must be in the DT node. Period. There's not relation to
whether the driver actually uses it or not.

Please send a patch to add that range for 4.11.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--ionnfoinzxo4d4vt--
