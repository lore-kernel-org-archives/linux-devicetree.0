From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Fix missing usb0_reset for sun4i
 / sun5i
Date: Mon, 5 Jan 2015 14:50:02 +0100
Message-ID: <20150105135002.GB32429@lukather>
References: <1419448758-22371-1-git-send-email-hdegoede@redhat.com>
 <1419448758-22371-2-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBNVPVKSQKGQEVGQNJMA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1419448758-22371-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alain Durand <alain-rYygLG2KK6I@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Hans,

On Wed, Dec 24, 2014 at 08:19:18PM +0100, Hans de Goede wrote:
> The recent sun4i-usb-phy changes to add (preliminary) support for the oth phy,
> cause the ehci/ohci controllers to no longer work on sun4i / sun5i, because
> the phy driver refuses to load due to a missing usb0_reset reset controller
> in the dts files for sun4i / sun5i:
> 
> [    0.094293] sun4i-usb-phy 1c13400.phy: failed to get reset usb0_reset
> [    0.094326] sun4i-usb-phy: probe of 1c13400.phy failed with error -22
> 
> This fixes this.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Thanks for this. Chen-Yu submitted a similar patch before the holidays
that I queued for 3.19, but didn't push at the time.

It's now pushed as part as sunxi/fixes-for-3.19, and sunxi/for-next.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--neYutvxvOLaeuPCA--
