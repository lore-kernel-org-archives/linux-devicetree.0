From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/4] clk: sunxi-ng: add support for V3s CCU
Date: Tue, 17 Jan 2017 10:04:56 +0100
Message-ID: <20170117090456.fgw6lpqgurwwcczj@lukather>
References: <20170116180116.36729-2-icenowy@aosc.xyz>
 <20170116180116.36729-3-icenowy@aosc.xyz>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kydoof46rcmptsw3"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBR5467BQKGQEAQG6QGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170116180116.36729-3-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Zepan <715805855-9uewiaClKEY@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kydoof46rcmptsw3
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Jan 17, 2017 at 02:01:14AM +0800, Icenowy Zheng wrote:
> V3s has a similar but cut-down CCU to H3.
> 
> Add support for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---

Output from checkpatch:
total: 5 errors, 2 warnings, 3 checks, 857 lines checked

> I think I should make a comparsion between V3s and H3 CCU here:
> (I won't mention the missing/added clocks here, only list conflicting clocks)

That should be in your commit log.

> - "bus-ehci0" is at different bit (The bit that is "bus-ehci0" on V3s is
>   "bus-ehci2" on H3)
> - The mux of "ce" is different. (According the view at V3s datasheet by the
>   author of sun4i-ss, V3s may have sun4i-ss, not sun8i-ce)
> - The mux of "de" is different. (V3s do not have "pll-de", but it can mux "de"
>   to "pll-video")
> - Clocks about CSI largely differs. (As V3s is designed as a camera SoC, and
>   it have an extra "pll-isp")

OK.

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--kydoof46rcmptsw3--
