From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: Base Orange Pi Plus dts on
 the Orange Pi 2 dts
Date: Thu, 24 Mar 2016 08:59:04 +0100
Message-ID: <20160324075904.GU30977@lukather>
References: <1458771256-4069-1-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NpqO7Ye/LGWn1vXh"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBSN4Z23QKGQE3YCD2DA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1458771256-4069-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--NpqO7Ye/LGWn1vXh
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Wed, Mar 23, 2016 at 11:14:16PM +0100, Hans de Goede wrote:
> The Orange Pi Plus really is an Orange Pi 2 extended with:
> 1) A sata <-> usb bridge connected to ehci3
> 2) An eMMC on mmc2
> 3) An external gigabit ethernet phy instead of the integrated 100Mbit phy
> 
> This commit changes the dts to reflect this by making it include
> the Orange Pi 2 dts and then adding the extra bits.
> 
> Note that the difference in ethernet phy is not taken into account
> because we do not have an ethernet driver for the H3 yet.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Unfortunately, the patch doesn't apply anymore, and the merge doesn't
seem trivial.

I pushed my branch on my kernel.org repo, can you rebase your patch on
top and resend it?

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--NpqO7Ye/LGWn1vXh--
