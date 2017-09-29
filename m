From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/7] regulator: axp20x: Add support for
 AXP813 regulators
Date: Fri, 29 Sep 2017 10:33:37 +0200
Message-ID: <20170929083337.fv7ed5utnofqgsi4@flea>
References: <20170929032514.31727-1-wens@csie.org>
 <20170929032514.31727-3-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="meopsrsa72capjtd"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB3EKXDHAKGQEUOT7BAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170929032514.31727-3-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--meopsrsa72capjtd
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Sep 29, 2017 at 03:25:09AM +0000, Chen-Yu Tsai wrote:
> The AXP813 PMIC has 7 DC-DC buck regulators, 16 LDOs (including the
> fixed RTC LDO and 2 GPIO LDOs), and 1 switchable. The drive-vbus
> feature is also supported. All the hardware details are very similar
> to the AXP803, with the following exceptions:
> 
>   - Extra DCDC7 buck regulator, with the same range as DCDC6
> 
>   - SWitch now has a separate supply pin, instead of being chained
>     internaly from DCDC1
> 
>   - RTC LDO output voltage is now 1.8V
> 
>   - FLDO3 is an LDO with switchable supplies, but unconfigurable output
>     voltage. The voltage is always half that of its supply.
> 
> Support for FLDO3 is currently unimplemented, as it requires runtime
> switching of its supplies, something the regulator subsystem does not
> support. It is not used in either the reference designs nor actually
> produced boards available.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Tested-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--meopsrsa72capjtd--
