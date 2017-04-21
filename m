From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH v4 06/11] drm/sun4i: add support for
 Allwinner DE2 mixers
Date: Fri, 21 Apr 2017 16:18:57 +0800
Message-ID: <2C85F818-5612-4A53-A558-B633315B8D37@aosc.io>
References: <20170416120849.54542-1-icenowy@aosc.io>
 <20170416120849.54542-7-icenowy@aosc.io>
 <20170418090047.7i2k6dtoqxfdqwwy@lukather>
 <88F5FAC9-1873-4C76-9AB9-FF361C07664E@aosc.io>
 <20170420083707.wdtrdlxpvocpzc7g@lukather>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB44A47DQKGQEU72QS6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170420083707.wdtrdlxpvocpzc7g@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


=E4=BA=8E 2017=E5=B9=B44=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=884:=
37:07, Maxime Ripard=20
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
> On Tue, Apr 18, 2017 at 06:47:56PM +0800, Icenowy Zheng wrote:
>> >> +	/* Get the physical address of the buffer in memory */
>> >> +	gem =3D drm_fb_cma_get_gem_obj(fb, 0);
>> >> +
>> >> +	DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->paddr);
>> >> +
>> >> +	/* Compute the start of the displayed memory */
>> >> +	bpp =3D fb->format->cpp[0];
>> >> +	paddr =3D gem->paddr + fb->offsets[0];
>> >> +	paddr +=3D (state->src_x >> 16) * bpp;
>> >> +	paddr +=3D (state->src_y >> 16) * fb->pitches[0];
>> >> +
>> >> +	DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &paddr);
>> >> +
>> >> +	paddr_u32 =3D (uint32_t) paddr;
>> >
>> >How does that work on 64-bits systems ?
>>=20
>> The hardware is not designed to work on 64-bit systems.
>>=20
>> Even 64-bit A64/H5 has also 3GiB memory limit.
>=20
> That's a fragile assumption.

Yes, it's only the basical reason.

>=20
>> The address cell in mixer hardware is also only 32-bit.
>>=20
>> So we should just keep the force conversion here. If we then really
>> met 4GiB-capable AW SoC without changing DE2, I think we should have
>> other way to limit CMA pool inside 4GiB.
>=20
> The register name looks like this is only the lower 32 bits that you
> can set here, and that there is another register for the upper 32 bits
> of that address somewhere.

Maybe... but no one can verify this as their's no currently any user
which has 4GiB+ DRAM.

I think we should keep this until Allwinner really made a 4GiB-capable
hardware.

>=20
> In that case, please use the lower_32_bits and upper_32_bits helper,
> and don't cast it that way.
>=20
> If it isn't the case, you should set the DMA mask (through
> dma_set_mask) so that we only allocate memory that can be accessed by
> this device.

How to do it?

>=20
> Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
