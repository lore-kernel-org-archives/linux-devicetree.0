From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun8i-h3: add sy8106a to
 orange pi plus
Date: Mon, 1 Oct 2018 17:45:45 +0200
Message-ID: <20181001154545.iwxjgw5exg4psfy4@flea>
References: <20180929131830.13924-1-jorik@kippendief.biz>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fmtks3qffvmnpfjl"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBB6VZHOQKGQEOXRGNEI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180929131830.13924-1-jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--fmtks3qffvmnpfjl
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Sat, Sep 29, 2018 at 03:18:30PM +0200, jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org wrote:
> From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
> 
> The Orange Pi Plus board lacks voltage scaling capabilities in its
> current form. This results in random freezes during boot when cpufreq is
> enabled, probably due to wrong voltages.
> 
> This patch (more or less copy/paste from 06139c) does the following
> things on this board:
> - enable r_i2c
> - add sy8106a to the r_i2c bus
> - have the sy8106a regulate VDD of cpu
> 
> Since the Orange Pi Plus has the same PMU setup as the Orange Pi PC, I
> simply took min/max/fixed/ramp from the latter DTS. In that file the
> origin of the values are described by the following comment:
> 
>   "The datasheet uses 1.1V as the minimum value of VDD-CPUX,
>   however both the Armbian DVFS table and the official one
>   have operating points with voltage under 1.1V, and both
>   DVFS table are known to work properly at the lowest
>   operating point.
>   Use 1.0V as the minimum voltage instead."
> 
> I have tested this on patch two Orange Pi Plus boards, by running a
> kernel with this patch and do intermettent runs of cpuburn while
> monitoring voltage, frequency and temperature. The board runs stable
> across its operatiing points while showing a reasonable (< 40C)
> temperature. My Orange Pi PC, when put to the same test, yields similar
> stable results.
> 
> Signed-off-by: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>

Queued for 4.21, thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--fmtks3qffvmnpfjl--
