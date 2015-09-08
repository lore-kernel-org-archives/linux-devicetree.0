From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: sun5i: Add sun5i-q8-common.dtsi
Date: Tue, 8 Sep 2015 16:33:20 +0200
Message-ID: <20150908143320.GB31584@lukather>
References: <1441464953-26351-1-git-send-email-hdegoede@redhat.com>
 <1441464953-26351-2-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XeHo0rFSNt4mQX/E"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBMPDXOXQKGQEUF26THA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441464953-26351-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

--XeHo0rFSNt4mQX/E
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Sep 05, 2015 at 04:55:52PM +0200, Hans de Goede wrote:
> This is the sun5i / a13 version of sun8i-q8-common.dtsi for use in dts
> files for a13 q8 based tablets. Compared to sun8i this uses uart1 for the
> serial console, and PG0 for card-detect for mmc0.
> 
> This also adds pmic and otg support, which both use the same config on
> all known q8 a13 devices. This is not present in sun5i-q8-common.dtsi
> because pmic / otg support for sun8i has not yet been merged.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Are we going to have any user but the one you posted in the patch 3
planned?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--XeHo0rFSNt4mQX/E--
