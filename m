From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/3] Simple DVFS support for Allwinner A64 SoC
Date: Mon, 25 Sep 2017 12:10:27 +0200
Message-ID: <20170925101027.lghnnll4h6inreqm@flea.home>
References: <20170923001531.14285-1-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cljd2fqx4wv57lmc"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBH5MUPHAKGQEUE3BQRI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170923001531.14285-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--cljd2fqx4wv57lmc
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Sat, Sep 23, 2017 at 12:15:28AM +0000, Icenowy Zheng wrote:
> This patchset imports simple DVFS support for Allwinner A64 SoC.
> 
> As the thermal sensor driver is not yet implemented and some boards
> have still no AXP PMIC support, now only two OPPs are present --
> 648MHz@1.04V and 816MHz@1.1V to prevent overheat or undervoltage.
> 
> PATCH 1 is a fix to the CCU driver of A64, and the remaining patches
> set up the device tree bits of the DVFS on Pine64.

How has this been tested?

What tasks did you run, with what governor, etc...

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--cljd2fqx4wv57lmc--
