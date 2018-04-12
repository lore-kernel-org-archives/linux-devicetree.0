From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH 3/5] net: stmmac: dwmac-sun8i: Allow
 getting syscon regmap from device
Date: Thu, 12 Apr 2018 23:23:30 +0800
Message-ID: <CAGb2v66Qi2D1qgF3-iVJFAiznMUzzen0nHM5vsPe7Cyi6QTYpw@mail.gmail.com>
References: <20180411141641.14675-1-icenowy@aosc.io> <20180411141641.14675-4-icenowy@aosc.io>
 <20180412145628.iaaeue2imiijwx5d@flea> <A027702A-F3F7-4896-B2B8-E024DA521661@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBCPUXXLAKGQEATZ6GQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <A027702A-F3F7-4896-B2B8-E024DA521661-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, netdev <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 12, 2018 at 11:11 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>
>
> =E4=BA=8E 2018=E5=B9=B44=E6=9C=8812=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
10:56:28, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>>On Wed, Apr 11, 2018 at 10:16:39PM +0800, Icenowy Zheng wrote:
>>> From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>>>
>>> On the Allwinner R40 SoC, the "GMAC clock" register is in the CCU
>>> address space; on the A64 SoC this register is in the SRAM controller
>>> address space, and with a different offset.
>>>
>>> To access the register from another device and hide the internal
>>> difference between the device, let it register a regmap named
>>> "emac-clock". We can then get the device from the phandle, and
>>> retrieve the regmap with dev_get_regmap(); in this situation the
>>> regmap_field will be set up to access the only register in the
>>regmap.
>>>
>>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>>> [Icenowy: change to use regmaps with single register, change commit
>>>  message]
>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>> ---
>>>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 48
>>++++++++++++++++++++++-
>>>  1 file changed, 46 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>>b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>>> index 1037f6c78bca..b61210c0d415 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>>> @@ -85,6 +85,13 @@ const struct reg_field old_syscon_reg_field =3D {
>>>      .msb =3D 31,
>>>  };
>>>
>>> +/* Specially exported regmap which contains only EMAC register */
>>> +const struct reg_field single_reg_field =3D {
>>> +    .reg =3D 0,
>>> +    .lsb =3D 0,
>>> +    .msb =3D 31,
>>> +};
>>> +
>>
>>I'm not sure this would be wise. If we ever need some other register
>>exported through the regmap, will have to change all the calling sites
>>everywhere in the kernel, which will be a pain and will break
>>bisectability.
>
> In this situation the register can be exported as another
>  regmap. Currently the code will access a regmap with name
> "emac-clock" for this register.
>
>>
>>Chen-Yu's (or was it yours?) initial solution with a custom writeable
>>hook only allowing a single register seemed like a better one.
>
> But I remember you mentioned that you want it to hide the
> difference inside the device.

Hi,

The idea is that a device can export multiple regmaps. This one,
the one named "gmac" (in my soon to come v2) or "emac-clock" here,
is but one of many possible regmaps, and it only exports the register
needed by the GMAC/EMAC. IMHO it is highly unlikely the same piece of
hardware would need a second register from the same device. A more
likely situation would be it needs another register from a different
device, like on the H6 where the "internal PHY" is not so internal
from a system bus point of view.

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
