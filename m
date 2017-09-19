From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: Re: [PATCH] nvmem: sunxi-sid: add support for
 A64/H5's SID controller
Date: Tue, 19 Sep 2017 16:23:14 +0800
Message-ID: <E5C9EEDA-C24B-4F66-9F8A-1355B44F861F@aosc.io>
References: <20170918154204.54427-1-icenowy@aosc.io> <20170919082019.6bopwauso4mbslqo@flea.lan>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBHVWQPHAKGQERD6GYQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170919082019.6bopwauso4mbslqo-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.orgMaxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B49=E6=9C=8819=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=884:=
20:19, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>On Mon, Sep 18, 2017 at 11:42:04PM +0800, Icenowy Zheng wrote:
>> Allwinner A64/H5 SoCs come with a SID controller like the one in H3,
>but
>> without the silicon bug that makes the initial value at 0x200 wrong,
>so
>> the value at 0x200 can be directly read.
>>=20
>> Add support for this kind of SID controller.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt | 1
>+
>>  drivers/nvmem/sunxi_sid.c                                       | 6
>++++++
>>  2 files changed, 7 insertions(+)
>>=20
>> diff --git
>a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
>b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
>> index ef06d061913c..6ea0836939ee 100644
>> --- a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
>> +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
>> @@ -5,6 +5,7 @@ Required properties:
>>    "allwinner,sun4i-a10-sid"
>>    "allwinner,sun7i-a20-sid"
>>    "allwinner,sun8i-h3-sid"
>> +  "allwinner,sun50i-a64-sid"
>> =20
>>  - reg: Should contain registers location and length
>> =20
>> diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
>> index 0d6648be93b8..3c9fd4fb9207 100644
>> --- a/drivers/nvmem/sunxi_sid.c
>> +++ b/drivers/nvmem/sunxi_sid.c
>> @@ -199,10 +199,16 @@ static const struct sunxi_sid_cfg sun8i_h3_cfg
>=3D {
>>  	.need_register_readout =3D true,
>>  };
>> =20
>> +static const struct sunxi_sid_cfg sun50i_a64_cfg =3D {
>> +	.value_offset =3D 0x200,
>> +	.size =3D 0x100,
>> +};
>> +
>
>How did you get those values?

In the BSP U-Boot headers.

>
>Also, it's reported that the SID can only be accessed in secure mode,
>did you test it?

Yes, however the secure is broken again, and this only
happen if Secure Boot bit is burned.

If it's really burned, we will have no clean way to access SID.

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
