Return-Path: <SRS0=4qpm=2Y=gmail.com=npcomplete13@kernel.org>
MIME-Version: 1.0
References: <1489590033-4946-1-git-send-email-npcomplete13@gmail.com> <20170315185214.GF21021@lunn.ch>
In-Reply-To: <20170315185214.GF21021@lunn.ch>
From: Vivek Unune <npcomplete13@gmail.com>
Date: Wed, 15 Mar 2017 19:34:13 +0000
Message-ID: <CAChtp75xk3LN1-DPVvaHT5qEvrdoFFvXEk-daVCcJ=4rYu_vmw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add support for Linksys EA9500
Content-Type: multipart/alternative; boundary=001a113dcec61ce38f054aca08a8
To: Andrew Lunn <andrew@lunn.ch>
Cc: hauke@hauke-m.de, zajec5@gmail.com, bcm-kernel-feedback-list@broadcom.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--001a113dcec61ce38f054aca08a8
Content-Type: text/plain; charset=UTF-8

Andrew,

I'm not entirely sure. But here is what I observed.

Boot loader sets up both the switches. And I can use all 8 ports of the
router when I boot Lede. Only the internal swich is detected and
configurable via swconfig tool
Internal switch is connected to CPU via port 5 same as Netgear R8000. The
other bit here is that I looked through the GPL source and gpio pin 10 is
labeled as EA9500_RST2LANSW_GPIO10_PIN/ResetSwitch. So when I performed a
robo reset of the pin and 5 (labeled 1 thru 5 on the unit) of the 8
physical ports stopped working (no packets).

If the external switch were to be connect via dedicated ethernet interface
it should have shown up during the probe. Is in't it?

Thanks,

Vivek


On Wed, Mar 15, 2017 at 2:52 PM Andrew Lunn <andrew@lunn.ch> wrote:

Hi Vivek

> - It has two switches in order to support 8 lan ports. Internal switch is
>   BCM53012. The external switch BCM53125 currently works as "dumb switch"

Do you know how the second switch is connected? Is it cascaded off the
internal switch? Or does it have a dedicated Ethernet interface?

Thanks
        Andrew

--001a113dcec61ce38f054aca08a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_msg"><div class=3D"gmail_m=
sg">Andrew,</div><div class=3D"gmail_msg"><br class=3D"gmail_msg"></div>I&#=
39;m not entirely sure. But here is what I observed.<div class=3D"gmail_msg=
"><br></div><div class=3D"gmail_msg">Boot loader sets up both the switches.=
 And I can use all 8 ports of the router when I boot Lede. Only the interna=
l swich is detected and configurable via swconfig tool<br class=3D"gmail_ms=
g"></div><div class=3D"gmail_msg">Internal switch is connected to CPU via p=
ort 5 same as Netgear R8000. The other bit here is that I looked through th=
e GPL source and gpio pin 10 is labeled as=C2=A0EA9500_RST2LANSW_GPIO10_PIN=
/ResetSwitch. So when I performed a robo reset of the pin and 5 (labeled 1 =
thru 5 on the unit) of the 8 physical ports stopped working (no packets).</=
div><div class=3D"gmail_msg"><br></div><div class=3D"gmail_msg">If the exte=
rnal switch were to be connect via dedicated ethernet interface it should h=
ave shown up during the probe. Is in&#39;t it?</div><div class=3D"gmail_msg=
"><br></div><div class=3D"gmail_msg">Thanks,<br></div><div class=3D"gmail_m=
sg"><br></div><div class=3D"gmail_msg">Vivek</div><div class=3D"gmail_msg">=
<br class=3D"gmail_msg"></div></div><br class=3D"gmail_msg"><div class=3D"g=
mail_quote gmail_msg"><div dir=3D"ltr" class=3D"gmail_msg">On Wed, Mar 15, =
2017 at 2:52 PM Andrew Lunn &lt;<a href=3D"mailto:andrew@lunn.ch" class=3D"=
gmail_msg" target=3D"_blank">andrew@lunn.ch</a>&gt; wrote:<br class=3D"gmai=
l_msg"></div><blockquote class=3D"gmail_quote gmail_msg" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Vivek<br class=3D"=
gmail_msg">
<br class=3D"gmail_msg">
&gt; - It has two switches in order to support 8 lan ports. Internal switch=
 is<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0BCM53012. The external switch BCM53125 currently works as =
&quot;dumb switch&quot;<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Do you know how the second switch is connected? Is it cascaded off the<br c=
lass=3D"gmail_msg">
internal switch? Or does it have a dedicated Ethernet interface?<br class=
=3D"gmail_msg">
<br class=3D"gmail_msg">
Thanks<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Andrew<br class=3D"gmail_msg">
</blockquote></div></div>

--001a113dcec61ce38f054aca08a8--
