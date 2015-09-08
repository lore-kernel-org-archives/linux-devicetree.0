From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sunxi: Add
 sun?i-q8-common.dtsi files for q8 tablets
Date: Tue, 8 Sep 2015 16:31:24 +0200
Message-ID: <20150908143124.GA31584@lukather>
References: <1441464953-26351-1-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SBYWXwvsCkEY5LOm"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBP7CXOXQKGQEVK3LSIA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441464953-26351-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--SBYWXwvsCkEY5LOm
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Sep 05, 2015 at 04:55:51PM +0200, Hans de Goede wrote:
> Cheap allwinner based devices in the q8 enclosure come in many variants,
> all sharing the case and a number of other basic features.
> 
> They differ in the display, touchscreen, accelerometer and wifi chips
> used.
> 
> This commit adds 2 dtsi files defining the shared features of all the
> q8 tablets. sunxi-q8-common.dtsi defines features shared amongst all
> q8 tablets, sun8i-q8-common.dtsi defines features shared amongst all
> a23 / a33 based q8 tablets, but not with a13 q8 based tablets.
> 
> a13 based tablets use a different card-detect pin for the mmc, and
> use uart1 instead of the r_uart for the serial console.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--SBYWXwvsCkEY5LOm--
