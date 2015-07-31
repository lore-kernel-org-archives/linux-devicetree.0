From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: dts: sun8i: Enable USB DRC on Ippo
 Q8H-A33 tablet
Date: Fri, 31 Jul 2015 12:08:22 +0200
Message-ID: <20150731100822.GA2564@lukather>
References: <1438333194-21181-1-git-send-email-hdegoede@redhat.com>
 <1438333194-21181-5-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4loEm8vkm2dPEmEM"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBP4S5WWQKGQECL4NNWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438333194-21181-5-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

--4loEm8vkm2dPEmEM
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Fri, Jul 31, 2015 at 10:59:53AM +0200, Hans de Goede wrote:
> Enable the otg/drc usb controller on the Ippo Q8H-A33 tablet, for now it
> is enabled in host-only mode, because true OTG support requires support
> for detecting and enabling Vbus through the axp221 pmic.
> 
> For this to work the Vbus on the port must be enabled by u-boot,
> or a powered hub must be used.

A comment on top of the usb_otg node stating that would be great. It
stands out more when we want to refactor stuff (with a FIXME even?).

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--4loEm8vkm2dPEmEM--
