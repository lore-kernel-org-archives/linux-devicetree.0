From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 0/5] ARM: sun9i: Add USB host controller
 support for A80
Date: Sat, 7 Feb 2015 16:44:09 +0100
Message-ID: <20150207154409.GS2079@lukather>
References: <1422915725-26492-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R0KbGFzrRdaLlFh/"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB7XF3CTAKGQESPCXCPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422915725-26492-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--R0KbGFzrRdaLlFh/
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Feb 03, 2015 at 06:22:00AM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This is v4 of the sun9i A80 USB host support series.
> 
> Changes since v3:
> 
>   - Dropped patches merged.
> 
>   - Moved reg_usb3_vbus into the optimus board dts
> 
>   - Dropped ohci1 from A80 dtsi.
> 
> Cover letter from v3:
> 
> This series adds USB host controller (EHCI/OHCI) support for the Allwinner
> A80 SoC. The A80 has 3 pairs of host controllers and USB PHYs. The PHYs,
> unlike in previous SoCs, do not have low level control registers anymore.
> 
> As such, this series forgoes the original phy-sun4i-usb driver, and adds
> a new, simpler driver for the USB PHYs. It may be possible to merge the
> two, but given that work is being done on the OTG front for the earlier
> SoCs, it may be better to merge them after support is complete.
> 
> EHCI/OHCI0 corresponds to USB1 DP/DM pins; EHCI1 only has HSIC support;
> EHCI2/OHCI/2 is USB2 DP/DM externally. External pins labeled USB0 are
> for the USB 3.0 OTG controller.

Applied 2-5.

Thanks!

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--R0KbGFzrRdaLlFh/--
