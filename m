From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: sun8i: Add dts file for
 Ippo Q8H v1.2 tablets
Date: Tue, 13 Jan 2015 17:47:53 +0100
Message-ID: <20150113164753.GC4891@lukather>
References: <1421145872-17828-1-git-send-email-hdegoede@redhat.com>
 <1421145872-17828-3-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VmlJMtejgecKmNHY"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBPEZ2WSQKGQEIQHBRIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421145872-17828-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--VmlJMtejgecKmNHY
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Jan 13, 2015 at 11:44:32AM +0100, Hans de Goede wrote:
> The Ippo Q8H v1.2 is almost identical to the v5, still it needs a separate
> dtb file since some gpio-s surrounding the wlan/bluetooth are different,
> it uses different camera sensors, and different DRAM timings.
> 
> Note that atm neither the wlan/bluetooth nor the camera are supported, so
> atm their is no difference between the dts files, but because of the different
> DRAM timings there are already separate u-boot configs for the 2 different
> versions, and the 1.2 config refers to sun8i-a23-ippo-q8h-v1.2.dtb to be
> future proof, so we need to provide a sun8i-a23-ippo-q8h-v1.2.dtb file.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--VmlJMtejgecKmNHY--
