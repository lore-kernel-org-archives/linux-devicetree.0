From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/3] Add ethernet0 alias for several A64 boards
Date: Mon, 24 Jul 2017 09:58:23 +0200
Message-ID: <20170724075823.7ttjq4tnvoupo776@flea>
References: <20170722022852.7868-1-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rz5ytir2kdhikp7i"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBKWR23FQKGQE4ZIVTRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170722022852.7868-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--rz5ytir2kdhikp7i
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Sat, Jul 22, 2017 at 10:28:49AM +0800, Icenowy Zheng wrote:
> Allwinner A64 SoC has an EMAC which is used to provide Ethernet
> function on several boards.
> 
> The EMAC itself doesn't have a fixed MAC address, but the sunxi
> mainline U-Boot have the ability to generate one based on the eFUSE
> SID in the chip, and add the generated MAC address to the device
> tree when booting.
> 
> The MAC address setting step is based on the device tree's aliases,
> and device tree nodes prefixed "ethernet" will get the MAC address
> added. However, in several A64 boards' device tree, the alias is not
> set up, so that the U-Boot won't set the MAC address.
> 
> Add the ethernet0 aliases to these boards.
> 
> I hope this patchset can be queued in 4.13, otherwise 4.13 kernels
> won't get non-volatile MAC addresses, and will use random ones
> instead, which is annoying to many users.
> 
> Icenowy Zheng (3):
>   arm64: allwinner: a64: add ethernet0 alias for BPi M64 EMAC node
>   arm64: allwinner: a64: add ethernet0 alias for Pine64 EMAC node
>   arm64: allwinner: a64: add ethernet0 alias for SoPine EMAC node

Applied all three, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--rz5ytir2kdhikp7i--
