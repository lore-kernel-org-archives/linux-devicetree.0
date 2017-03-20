From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/3] Basical Lichee Pi Zero with Dock support
Date: Mon, 20 Mar 2017 13:50:26 +0100
Message-ID: <20170320125026.t35nyadmeupuckc7@lukather>
References: <20170317154343.39921-1-icenowy@aosc.xyz>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yigwq5xxvyfngiu5"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBJ5AX7DAKGQEHBQNKBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170317154343.39921-1-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--yigwq5xxvyfngiu5
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Fri, Mar 17, 2017 at 11:43:40PM +0800, Icenowy Zheng wrote:
> Lichee Pi Zero have an official dock, which makes use of all stamp hole pins.
> 
> Some extra functionalities are availble via the dock, e.g. an extra
> MMC slot and some keys connected to LRADC.
> 
> This patchset adds the support of these two features of the dock.

I'm a bit skeptical about the whole approach to have a split DTS for
expansion boards.

This is not fundamentally different than having expansion boards, that
we already deal with with overlays. This one is just bigger.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--yigwq5xxvyfngiu5--
