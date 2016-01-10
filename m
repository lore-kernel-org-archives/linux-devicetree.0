From: Xing Zheng <zhengxing@rock-chips.com>
Subject: Re: [PATCH] dt-bindings: Fix the external clock name for the RK3036 EMAC
Date: Sun, 10 Jan 2016 18:36:12 +0800
Message-ID: <B588B7A8-EC8A-44A5-AEDF-F75AB5361F01@rock-chips.com>
References: <1452410557-29208-1-git-send-email-zhengxing@rock-chips.com> <4001585.V8iyL2PDAE@phil> <E6BB80D3-5A62-4BE1-BFC2-74DAC9213C95@rock-chips.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <E6BB80D3-5A62-4BE1-BFC2-74DAC9213C95@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, keescook@google.com, leozwang@google.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, xing.zheng@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Heiko,

> =D4=DA 2016=C4=EA1=D4=C210=C8=D5=A3=AC18:29=A3=ACXing Zheng <zhengxin=
g@rock-chips.com> =D0=B4=B5=C0=A3=BA
>=20
>=20
> Hi Heiko,
>=20
>> =D4=DA 2016=C4=EA1=D4=C210=C8=D5=A3=AC17:59=A3=ACHeiko Stuebner <hei=
ko@sntech.de> =D0=B4=B5=C0=A3=BA
>>=20
>> Hi Xing,
>>=20
>> Am Sonntag, 10. Januar 2016, 15:22:37 schrieb Xing Zheng:
>>> Because the RK3036 doesn't support EMAC, and only support the RMII =
mode
>>> in the EMAC IP, we refer to the TRM CRU and update the new external
>>> clock name for EMAC.
>>>=20
>>> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
>>=20
>> as I said in the other mail, I already fixed the original patch myse=
lf :-)
>> So I'm just going to drop this one.
>>=20
>>=20
>> Heiko
>>=20
>> https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?h=3Dv4.5-clk/fixes&id=3D88807906af108a8384d77ad9cfb9421f164ea=
931
> I am sorry to misunderstand.
>=20
> OK, thank you for your help.  :)

Your patch is:
- - "ext_gmac" - external GMAC clock - optional
+ - "rmii_clkin" - external GMAC clock - optional

I think that these should be like this:
- - "ext_gmac" - external GMAC clock - optional
+ - "rmii_clkin" - external EMAC clock - optional

Thanks. :)
