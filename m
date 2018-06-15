From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 0/4] allwinner: a64: add SRAM controller
 / system control
Date: Fri, 15 Jun 2018 11:14:13 +0200
Message-ID: <20180615091413.pbdtrpa7txe6i4ee@flea>
References: <20180614153548.9644-1-wens@csie.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="daslumcfzfyunu4u"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB4EGR3MQKGQEEQNTI2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180614153548.9644-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--daslumcfzfyunu4u
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Jun 14, 2018 at 11:35:44PM +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> This series is the remaining A64 syscon changes from the R40 DWMAC
> series. The series aligns how the A64 system control exports a regmap
> for the sun8i DWMAC driver to access with what we've done for the R40.
> 
> Originally the A64 used the generic syscon for this bit of hardware.
> But this block also contains mapping bits for the onboard SRAM, used
> by various peripherals, and other vendor specific bits we may use in
> the future. It is by no means generic. And we already have a device
> tree binding and driver for the SRAM part.
> 
> The first patch make the SRAM control device export a regmap, exposing
> a single EMAC control register, for the DWMAC driver to consume.
> 
> The second and third patches rename the A64 compatible string to read
> "system control", which is what the block is named in the user manual.
> 
> The last patch fixes up the device node, and also adds the lone mappable
> SRAM block, which is needed by the Display Engine.

For the serie:
Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--daslumcfzfyunu4u--
