From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: change the A64 HDMI PHY
 binding to R40
Date: Wed, 5 Sep 2018 09:14:35 +0200
Message-ID: <20180905071435.lgsogpzmh5nw6bcy@flea>
References: <20180903133434.58188-1-icenowy@aosc.io>
 <20180903133434.58188-2-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a6njpttkpajmgw7j"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBXEEX3OAKGQEZ35HLRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180903133434.58188-2-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--a6njpttkpajmgw7j
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Sep 03, 2018 at 09:34:32PM +0800, Icenowy Zheng wrote:
> By experiment, the A64 HDMi PHY doesn't support the PLL-VIDEO mux
> introduced in R40, although it has two PLL-VIDEOs.
> 
> Change the A64 HDMI PHY binding to R40 one.
> 
> This binding is introduced in v4.19, which is still in RC stage, so we
> have change to fix it.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

That doesn't make much sense. The A64 doesn't have any particular
reason to behave like the R40, and the R40 can definitely use a
different compatible if it has a different behaviour. But I don't see
*why* the A64 not behaving like the R40 is a justification to remove
the A64 compatible. Especially when the R40 was released later.

Add a new compatible, and leave the A64 compatible alone.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--a6njpttkpajmgw7j--
