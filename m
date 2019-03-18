From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/6] nvmem: sunxi_sid: Read out data in
 native format
Date: Mon, 18 Mar 2019 09:42:12 +0100
Message-ID: <20190318084212.lv2lorskizl65uzg@flea>
References: <20190318073354.12151-1-wens@kernel.org>
 <20190318073354.12151-5-wens@kernel.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pby5l7iw3zraifpt"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB2NTXXSAKGQE6PSMQ6Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190318073354.12151-5-wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pby5l7iw3zraifpt
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Mon, Mar 18, 2019 at 03:33:52PM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>
> Originally the SID e-fuses were thought to be in big-endian format.
> Later sources show that they are in fact native or little-endian.
> The most compelling evidence is the thermal sensor calibration data,
> which is a set of one to three 16-bit values. In native-endian they
> are in 16-bit cells with increasing offsets, whereas with big-endian
> they are in the wrong order, and a gap with no data will show if there
> are one or three cells.
>
> Switch to a native endian representation for the nvmem device. For the
> H3, the register read-out method was already returning data in native
> endian. This only affects the other SoCs.
>
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

I thought only the newer SoCs were impacted by this issue?

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--pby5l7iw3zraifpt--
