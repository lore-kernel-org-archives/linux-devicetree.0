From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: Re: [PATCH v5 02/11] clk: sunxi-ng: add support for
 DE2 CCU
Date: Mon, 24 Apr 2017 18:26:51 +0800
Message-ID: <9def8a6b635880095e6b75e3a53af1f4@aosc.io>
References: <20170423103754.50012-1-icenowy@aosc.io>
 <20170423103754.50012-3-icenowy@aosc.io>
 <20170424085109.p44bmzbyjkuf7ckv@lukather>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB3FF67DQKGQEN4XURSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170424085109.p44bmzbyjkuf7ckv@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-04-24 16:51=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> Hi,
>=20
> On Sun, Apr 23, 2017 at 06:37:45PM +0800, Icenowy Zheng wrote:
>> +static const struct of_device_id sunxi_de2_clk_ids[] =3D {
>> +	{
>> +		.compatible =3D "allwinner,sun8i-a83t-de2-clk",
>> +		.data =3D &sun8i_a83t_de2_clk_desc,
>> +	},
>> +	{
>> +		.compatible =3D "allwinner,sun50i-h5-de2-clk",
>> +		.data =3D &sun50i_a64_de2_clk_desc,
>> +	},
>> +	/*
>> +	 * The Allwinner A64 SoC needs some bit to be poke in syscon to make
>> +	 * DE2 really working.
>> +	 * So there's currently no A64 compatible here.
>> +	 * H5 shares the same reset line with A64, so here H5 is using the
>> +	 * clock description of A64.
>> +	 */
>> +	{ }
>> +};
>=20
> So that A64 driver would require more than just what you defined in
> the binding in order to operate?

Yes. When trying to do A64 driver, I will send out first a patch to
add the needed binding bit.

>=20
> Maxime
>=20
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
