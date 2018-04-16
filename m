From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 1/5] dt-bindings: allow dwmac-sun8i to use
 other devices' exported regmap
Date: Tue, 17 Apr 2018 07:17:56 +0800
Message-ID: <04C9F795-2680-4220-A39A-7B7D5FD74C4A@aosc.io>
References: <20180411141641.14675-1-icenowy@aosc.io> <20180411141641.14675-2-icenowy@aosc.io> <20180416184745.tqxyvojtcbage4fu@rob-hp-laptop>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBMG62TLAKGQEZWVQQOQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180416184745.tqxyvojtcbage4fu@rob-hp-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B44=E6=9C=8817=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=882:=
47:45, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> =E5=86=99=E5=88=B0:
>On Wed, Apr 11, 2018 at 10:16:37PM +0800, Icenowy Zheng wrote:
>> On some Allwinner SoCs the EMAC clock register needed by dwmac-sun8i
>is
>> in another device's memory space. In this situation dwmac-sun8i can
>use
>> a regmap exported by the other device with only the EMAC clock
>register.
>
>If this is a clock, then why not use the clock binding?

EMAC clock register is only the datasheet name. It contains
MII mode selection and delay chain configuration.

>
>>=20
>> Document this situation in the dwmac-sun8i device tree binding
>> documentation.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/net/dwmac-sun8i.txt | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
>b/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
>> index 3d6d5fa0c4d5..0c5f63a80617 100644
>> --- a/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
>> +++ b/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
>> @@ -20,8 +20,9 @@ Required properties:
>>  - phy-handle: See ethernet.txt
>>  - #address-cells: shall be 1
>>  - #size-cells: shall be 0
>> -- syscon: A phandle to the syscon of the SoC with one of the
>following
>> - compatible string:
>> +- syscon: A phandle to a device which exports the EMAC clock
>register as a
>> + regmap or to the syscon of the SoC with one of the following
>compatible
>> + string:
>>    - allwinner,sun8i-h3-system-controller
>>    - allwinner,sun8i-v3s-system-controller
>>    - allwinner,sun50i-a64-system-controller
>> --=20
>> 2.15.1
>>=20
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree"
>in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>_______________________________________________
>linux-arm-kernel mailing list
>linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
