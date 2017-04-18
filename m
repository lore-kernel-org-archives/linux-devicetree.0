From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v3 09/12] mfd: axp20x: add axp20x-regulator
 cell for AXP803
Date: Tue, 18 Apr 2017 18:55:50 +0800
Message-ID: <6D57E4F4-DD87-400F-A21B-85778434AADC@aosc.io>
References: <20170417115747.7300-1-icenowy@aosc.io> <20170417115747.7300-10-icenowy@aosc.io> <CAGb2v648fhGSjWoVYRxU+_kF5fhbnhmY2mQG16ORtBHf7pGx5w@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBQHB27DQKGQEIUSVTNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v648fhGSjWoVYRxU+_kF5fhbnhmY2mQG16ORtBHf7pGx5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B44=E6=9C=8818=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=886:=
38:09, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
>On Mon, Apr 17, 2017 at 7:57 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>> As axp20x-regulator now supports AXP803, add a cell for it.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>> Changes in v3:
>> - Make the new cell one-liner.
>>
>>  drivers/mfd/axp20x.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
>> index 1dc6235778eb..431b7f118606 100644
>> --- a/drivers/mfd/axp20x.c
>> +++ b/drivers/mfd/axp20x.c
>> @@ -848,7 +848,8 @@ static struct mfd_cell axp803_cells[] =3D {
>>                 .name                   =3D "axp20x-pek",
>>                 .num_resources          =3D
>ARRAY_SIZE(axp803_pek_resources),
>>                 .resources              =3D axp803_pek_resources,
>> -       }
>> +       },
>> +       {       .name                   =3D "axp20x-regulator" }
>
>It's best to have a trailing comma, so we don't have to change the line
>again when we add more cells, like you just did with the previous line.

Should I also add it in previous mfd patch? (and remove the addition of the=
 comma in this patch)

>
>Otherwise,
>
>Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
