From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 6/6] ARM: sun8i: dts: Add Ippo-q8h v1.2
 with A33 and 1024x600 lcd support
Date: Tue, 2 Jun 2015 10:14:59 +0200
Message-ID: <20150602081459.GO23777@lukather>
References: <1432997706-20172-1-git-send-email-hdegoede@redhat.com>
 <1432997706-20172-7-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z87VqPJ/HsYrR2WM"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBBWMWWVQKGQED52Q4SI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432997706-20172-7-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--z87VqPJ/HsYrR2WM
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, May 30, 2015 at 04:55:06PM +0200, Hans de Goede wrote:
> The Ippo-q8h is a tablet circuit board commonly found in cheap Android
> tablets. The v1.2 version can be used with either an A23 or A33 SoC.
> 
> This adds a dts file for the v1.2 board with an A33 SoC and a 1024x600
> LCD screen (most of these tablets have a 800x480 screen).

I think the difference between the resolution here is more of a case
for the DT quirks interface:
https://lkml.org/lkml/2015/2/18/258

Do you know if there's some way to autodetect the two board versions
(like a board id somewhere in an EEPROM)?

If not, then maybe u-boot can simply add that board compatible to the
list, and we'll base our logic on that when we'll need it.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--z87VqPJ/HsYrR2WM--
