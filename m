From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: sun5i: Add dts file for q8
 formfactor a13 based tablets
Date: Fri, 18 Sep 2015 21:41:03 +0200
Message-ID: <20150918194103.GW4684@lukather>
References: <1441464953-26351-1-git-send-email-hdegoede@redhat.com>
 <1441464953-26351-3-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K4/DQSt3oreaYeED"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBUGR6GXQKGQEONQFILI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441464953-26351-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

--K4/DQSt3oreaYeED
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Sep 05, 2015 at 04:55:53PM +0200, Hans de Goede wrote:
> This commits adds a generic dts file for q8 formfactor a13 based tablets.
> 
> The tablets ship in many variants, with the difference mainly being the
> touchscreen controller / accelerometer / wifi chip used.
> 
> The wifi is USB based, and thus not listed in devicetree.
> 
> The touchscreen controller / accelerometer may turn out to be a problem
> once we add support for those. We can either do something with devicetree
> overlays, or add sun5i-a13-<touchscreen>-<accelerometer>.dts files. The
> latter is what the android mod community is doing with firmware images.
> 
> This dts was tested with an a13 q8 tablet with a pcb labelled: "94V-0",
> silead gsl1680 touchscreen controller and a mc32x0 accelerometer.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Fixed the conflicts and applied. Please post the patches on top of the
current sunxi/for-next branch.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--K4/DQSt3oreaYeED--
