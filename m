Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <548A8155.8080809@ti.com>
References: <1418291722-25448-1-git-send-email-lyz@rock-chips.com>
	<1418291722-25448-2-git-send-email-lyz@rock-chips.com>
	<548971AF.1020506@ti.com>
	<CAD=FV=XTYmzxvteNip2gtuDSSEWph-vY=BOPejHa1Z5KS2Kf6Q@mail.gmail.com>
	<548A8155.8080809@ti.com>
Date: Thu, 11 Dec 2014 21:51:36 -0800
Message-ID: <CAD=FV=Vg9iUzei7ToJTLR4VMdbJXDorEEuFAALvPW2+56HOPhg@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] phy: add a driver for the Rockchip SoC internal
 USB2.0 PHY
From: Doug Anderson <dianders@chromium.org>
Content-Type: multipart/alternative; boundary=001a11366f0c5a112e0509fe7c08
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: =?UTF-8?B?6buE5rab?= <huangtao@rock-chips.com>, jwerner@chromium.org, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Yunzhi Li <lyz@rock-chips.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Eddie Cai <cf@rock-chips.com>, Grant Likely <grant.likely@linaro.org>, Chris <zyw@rock-chips.com>, Olof Johansson <olof@lixom.net>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a11366f0c5a112e0509fe7c08
Content-Type: text/plain; charset=UTF-8

Hi,
On Dec 11, 2014 9:47 PM, "Kishon Vijay Abraham I" <kishon@ti.com> wrote:
>
> Hi,
>
> On Friday 12 December 2014 12:11 AM, Doug Anderson wrote:
> > Kishon,
> >
> > On Thu, Dec 11, 2014 at 2:27 AM, Kishon Vijay Abraham I <kishon@ti.com>
wrote:
> >> I didn't mean that. You can get rid of this entire xlate stuff if you
use
> >> something like below
> >>
> >> phy@xxx {
> >>         compatible = "";
> >>         phy1:usb_phy {
> >>         }
> >>         phy2:usb_phy {
> >>         };
> >> };
> >>
> >>
> >> usb@xx {
> >>         compatible = "";
> >>         phys = <&phy1>; //doesn't need xlate
> >>         /* this needs xlate
> >>            phys = <&phy 1>;
> >>         */
> >>         phy-names = "phy";
> >> };
> >
> > Is the syntax you proposed really better?  Are you saying that you
> > advocate never using "#phy-cells" other than 0 for new bindings?  Is
>
> No. It can still be used for configuring the PHY. For example, in the
case of
> PIPE3 PHY we configure it to USB PHY, SATA PHY or PCIE PHY depending on to
> which controller the PHY is connected to.
>
> I feel using phy-cells just for differentiating the PHY is pointless when
you
> have a separate node for each PHY.

Makes sense. Is the answer to remove the nodes then? I'm on my phone now so
I can't check, but I thought they were just bogus placeholders.

But I don't know enough about the PHY framework, so if I'm wrong please
ignore me.

--001a11366f0c5a112e0509fe7c08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi, <br>
On Dec 11, 2014 9:47 PM, &quot;Kishon Vijay Abraham I&quot; &lt;<a href=3D"=
mailto:kishon@ti.com">kishon@ti.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; On Friday 12 December 2014 12:11 AM, Doug Anderson wrote:<br>
&gt; &gt; Kishon,<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Dec 11, 2014 at 2:27 AM, Kishon Vijay Abraham I &lt;<a hr=
ef=3D"mailto:kishon@ti.com">kishon@ti.com</a>&gt; wrote:<br>
&gt; &gt;&gt; I didn&#39;t mean that. You can get rid of this entire xlate =
stuff if you use<br>
&gt; &gt;&gt; something like below<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; phy@xxx {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;&quot;;=
<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy1:usb_phy {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy2:usb_phy {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt;&gt; };<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; usb@xx {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;&quot;;=
<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phys =3D &lt;&amp;phy1&gt;; =
//doesn&#39;t need xlate<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* this needs xlate<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phys =3D &lt;&amp;ph=
y 1&gt;;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-names =3D &quot;phy&quot=
;;<br>
&gt; &gt;&gt; };<br>
&gt; &gt;<br>
&gt; &gt; Is the syntax you proposed really better?=C2=A0 Are you saying th=
at you<br>
&gt; &gt; advocate never using &quot;#phy-cells&quot; other than 0 for new =
bindings?=C2=A0 Is<br>
&gt;<br>
&gt; No. It can still be used for configuring the PHY. For example, in the =
case of<br>
&gt; PIPE3 PHY we configure it to USB PHY, SATA PHY or PCIE PHY depending o=
n to<br>
&gt; which controller the PHY is connected to.<br>
&gt;<br>
&gt; I feel using phy-cells just for differentiating the PHY is pointless w=
hen you<br>
&gt; have a separate node for each PHY.</p>
<p dir=3D"ltr">Makes sense. Is the answer to remove the nodes then? I&#39;m=
 on my phone now so I can&#39;t check, but I thought they were just bogus p=
laceholders. </p>
<p dir=3D"ltr">But I don&#39;t know enough about the PHY framework, so if I=
&#39;m wrong please ignore me. <br>
</p>

--001a11366f0c5a112e0509fe7c08--
