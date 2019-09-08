From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/2] net: phy: dp83867: Add documentation for SGMII mode
 type
Date: Sun, 8 Sep 2019 10:54:17 +0200
Message-ID: <20190908085417.GA28580@lunn.ch>
References: <20190907153919.GC21922@lunn.ch>
 <1567700761-14195-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <2894361567896439@iva5-be053096037b.qloud-c.yandex.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2894361567896439@iva5-be053096037b.qloud-c.yandex.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Trent Piepho <tpiepho@impinj.com>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 08, 2019 at 01:47:19AM +0300, Vitaly Gaiduk wrote:
> Hi, Andrew.<div>I=E2=80=99m ready to do this property with such name but =
is it good practice to do such long names? :)</div><div>Also, Trent Piepho =
wrote about sgmii-clk and merged all ideas we have =E2=80=9Cti,sgmii-ref-cl=
k=E2=80=9D.</div><div>It=E2=80=99s better, isn=E2=80=99t it?</div><div>Vita=
ly.</div><div><div><br />07.09.2019, 18:39, "Andrew Lunn" &lt;andrew@lunn.c=
h&gt;:<br /><blockquote><p>On Thu, Sep 05, 2019 at 07:26:00PM +0300, Vitaly=
 Gaiduk wrote:<br /></p><blockquote class=3D"b4fd5cf2ec92bc68cb898700bb8135=
5fwmi-quote">=C2=A0Add documentation of ti,sgmii-type which can be used to =
select<br />=C2=A0SGMII mode type (4 or 6-wire).<br /><br />=C2=A0Signed-of=
f-by: Vitaly Gaiduk &lt;<a href=3D"mailto:vitaly.gaiduk@cloudbear.ru">vital=
y.gaiduk@cloudbear.ru</a>&gt;<br />=C2=A0---<br />=C2=A0=C2=A0Documentation=
/devicetree/bindings/net/ti,dp83867.txt | 1 +<br />=C2=A0=C2=A01 file chang=
ed, 1 insertion(+)<br /><br />=C2=A0diff --git a/Documentation/devicetree/b=
indings/net/ti,dp83867.txt b/Documentation/devicetree/bindings/net/ti,dp838=
67.txt<br />=C2=A0index db6aa3f2215b..18e7fd52897f 100644<br />=C2=A0--- a/=
Documentation/devicetree/bindings/net/ti,dp83867.txt<br />=C2=A0+++ b/Docum=
entation/devicetree/bindings/net/ti,dp83867.txt<br />=C2=A0@@ -37,6 +37,7 @=
@ Optional property:<br />=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for ap=
plicable values.  The CLK_OUT pin can also<br />=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0be disabled by this property.  When omitted, the<br />=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PHY's default will be left as is.<br />=
=C2=A0+	- ti,sgmii-type - This denotes the fact which SGMII mode is used (4=
 or 6-wire).<br /></blockquote><p><br />Hi Vitaly<br /><br />You probably w=
ant to make this a Boolean. I don't think SGMII type is<br />a good idea. T=
his is about enabling the receive clock to be passed to<br />the MAC. So ho=
w about ti,sgmii-ref-clock-output-enable.<br /><br />=C2=A0=C2=A0=C2=A0=C2=
=A0Andrew<br /></p></blockquote></div></div>

Hi Vitaly

Please reconfigure your mail client to not obfuscate with HTML.

The length should be O.K. For a PHY node, it should not be too deeply
indented, unless it happens to be part of an Ethernet switch.

	  Andrew
