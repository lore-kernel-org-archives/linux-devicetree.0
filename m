Return-Path: <SRS0=zyxN=7E=csie.org=wens@kernel.org>
MIME-Version: 1.0
In-Reply-To: <69ad9443-ff65-8e49-df68-7e5e6c812d45@rock-chips.com>
References: <1501160156-30328-1-git-send-email-david.wu@rock-chips.com>
 <1501160540-30662-1-git-send-email-david.wu@rock-chips.com>
 <20170727134834.GD18666@lunn.ch> <65ae1747-4dff-b1d8-8aa3-684fc8c7809a@gmail.com>
 <69ad9443-ff65-8e49-df68-7e5e6c812d45@rock-chips.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 2 Aug 2017 11:44:24 +0800
Message-ID: <CAGb2v67bYRtaykk9dYQDxv-MbuSpvaQdRnbLcwFcX6SvqfBECg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] net: stmmac: dwmac-rk: Add internal phy support
Content-Type: multipart/alternative; boundary="001a113ffdcab76cda0555bd156b"
To: "David.Wu" <david.wu@rock-chips.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Mark Rutland <mark.rutland@arm.com>, Tao Huang <huangtao@rock-chips.com>, hwg@rock-chips.com, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, netdev <netdev@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, David Miller <davem@davemloft.net>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, alexandre.torgue@st.com
List-ID: <devicetree@vger.kernel.org>

--001a113ffdcab76cda0555bd156b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David, Florian, Andrew,

On Fri, Jul 28, 2017 at 2:56 PM, David.Wu <david.wu@rock-chips.com> wrote:

> Hi Florian,
>
> =E5=9C=A8 2017/7/28 0:54, Florian Fainelli =E5=86=99=E9=81=93:
>
>> - if you need knowledge about this PHY connection type prior to binding
>> the PHY device and its driver (that is, before of_phy_connect()) we
>> could add a boolean property e.g: "phy-is-internal" that allows us to
>> know that, or we can have a new phy-mode value, e.g: "internal-rmii"
>> which describes that, either way would probably be fine, but the former
>> scales better
>>
>>
> Using "phy-is-internal" is very helpful, but it is easy to confuse with
> the real internal PHY, may we use the other words like phy is inlined=F0=
=9F=99=82.
>
>
If "internal" is confusing, would "phy-is-integrated" in the MAC node work?

Either way we would like to have a definitive solution to this. Our
dwmac-sun8i driver is already in v4.13-rc1, with a somewhat flaky
method of knowing whether the internal PHY is used (phy-mode =3D "mii").

We really want a fix for this release, otherwise we would be force
to revert either the internal PHY part or the whole driver.

ChenYu

Then again, using phy-mode =3D "internal" even though this is Reduced MII
>> is not big of a deal IMHO as long as there is no loss of information and
>> that internal de-facto means internal reduced MII for instance.
>> --
>>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--001a113ffdcab76cda0555bd156b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">Hi D=
avid, Florian, Andrew,<br></div><div class=3D"gmail_quote"><br>On Fri, Jul =
28, 2017 at 2:56 PM, David.Wu <span dir=3D"ltr">&lt;<a href=3D"mailto:david=
.wu@rock-chips.com" target=3D"_blank">david.wu@rock-chips.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Hi Florian,<span class=3D""><br>
<br>
=E5=9C=A8 2017/7/28 0:54, Florian Fainelli =E5=86=99=E9=81=93:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
- if you need knowledge about this PHY connection type prior to binding<br>
the PHY device and its driver (that is, before of_phy_connect()) we<br>
could add a boolean property e.g: &quot;phy-is-internal&quot; that allows u=
s to<br>
know that, or we can have a new phy-mode value, e.g: &quot;internal-rmii&qu=
ot;<br>
which describes that, either way would probably be fine, but the former<br>
scales better<br>
<br>
</blockquote>
<br></span>
Using &quot;phy-is-internal&quot; is very helpful, but it is easy to confus=
e with the real internal PHY, may we use the other words like phy is inline=
d=F0=9F=99=82.<span class=3D"im HOEnZb"><br>
<br></span></blockquote><div><br></div><div>If &quot;internal&quot; is conf=
using, would &quot;phy-is-integrated&quot; in the MAC node work?<br></div><=
br></div><div class=3D"gmail_quote">Either way we would like to have a defi=
nitive solution to this. Our<br></div><div class=3D"gmail_quote">dwmac-sun8=
i driver is already in v4.13-rc1, with a somewhat flaky<br></div><div class=
=3D"gmail_quote">method of knowing whether the internal PHY is used (phy-mo=
de =3D &quot;mii&quot;).<br><br></div><div class=3D"gmail_quote">We really =
want a fix for this release, otherwise we would be force<br></div><div clas=
s=3D"gmail_quote">to revert either the internal PHY part or the whole drive=
r.<br><br></div><div class=3D"gmail_quote">ChenYu<br></div><div class=3D"gm=
ail_quote"><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"im HOEnZb">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Then again, using phy-mode =3D &quot;internal&quot; even though this is Red=
uced MII<br>
is not big of a deal IMHO as long as there is no loss of information and<br=
>
that internal de-facto means internal reduced MII for instance.<br>
-- <br>
</blockquote>
<br>
<br></span><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<wbr>_________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org" target=3D"_blank">l=
inux-arm-kernel@lists.infrade<wbr>ad.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" re=
l=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/mai<wbr>lman/=
listinfo/linux-arm-kernel</a><br>
</div></div></blockquote></div><br></div></div>

--001a113ffdcab76cda0555bd156b--
