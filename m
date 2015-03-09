From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: sun7i: Add dts file for
 Wexler TAB7200
Date: Mon, 9 Mar 2015 11:13:54 +0100
Message-ID: <20150309101354.GP5085@lukather>
References: <1425456947-4152-1-git-send-email-mamlinav@gmail.com>
 <1425815853-5759-1-git-send-email-mamlinav@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N5iGxCIPT7YMRg16"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBJ7F6WTQKGQE66RBCUQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425815853-5759-1-git-send-email-mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--N5iGxCIPT7YMRg16
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sun, Mar 08, 2015 at 02:57:33PM +0300, Aleksei Mamlin wrote:
> This patch add support for Wexler TAB7200 tablet.
> 
> The Wexler TAB7200 is a A20 based tablet with 7 inch display(800x480),
> capacitive touchscreen(5 fingers), 1G RAM, 4G NAND, micro SD card slot,
> mini HDMI port, 3.5mm audio plug, 1 USB OTG port and 1 USB 2.0 port.
> 
> Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes since v1:
> * Split to two patches:
>   The first one adds dts file for Wexler TAB7200.
>   The second one adds vendor-prefix for Wexler.
> * Remove include dt-bindings/pinctrl/sun4i-a10.h because we don't use
>   the pinctrl header.

Applied the two patches, thanks!

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--N5iGxCIPT7YMRg16--
