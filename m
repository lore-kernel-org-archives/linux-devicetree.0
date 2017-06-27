Return-Path: <SRS0=xY2W=6A=gmail.com=npcomplete13@kernel.org>
MIME-Version: 1.0
References: <1489590033-4946-1-git-send-email-npcomplete13@gmail.com>
 <20170315185214.GF21021@lunn.ch> <CAChtp75xk3LN1-DPVvaHT5qEvrdoFFvXEk-daVCcJ=4rYu_vmw@mail.gmail.com>
 <7f5ddeba-6f79-9de5-2c67-a77e6bec0ef9@broadcom.com> <CAChtp75mzHkSg4rVh602vaMotqs6NtaPOD4383Gef8tVPO37FQ@mail.gmail.com>
 <2e4ed52f-4134-9b6a-18c9-7c1f28cd7038@broadcom.com>
In-Reply-To: <2e4ed52f-4134-9b6a-18c9-7c1f28cd7038@broadcom.com>
From: Vivek Unune <npcomplete13@gmail.com>
Date: Tue, 27 Jun 2017 16:42:53 +0000
Message-ID: <CAChtp76VEHP=7x2_q7rpae4Dj3UF3y9Z3MeCaXnwtgeigowB=w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add support for Linksys EA9500
Content-Type: multipart/alternative; boundary="001a114a903ee8696e0552f3c20c"
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrew Lunn <andrew@lunn.ch>, hauke@hauke-m.de, zajec5@gmail.com, bcm-kernel-feedback-list@broadcom.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--001a114a903ee8696e0552f3c20c
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 15, 2017 at 5:19 PM Florian Fainelli <
florian.fainelli@broadcom.com> wrote:

> On 03/15/2017 01:18 PM, Vivek Unune wrote:
> > Thanks Florian.
> >
> > Let me try this out. First I'll try to figure out how to add a mdio node.
> >
> > Over the weekend I was trying enable DSA driver, but did not see DSA
> > under network. I'm using LEDE source with kernel 4.9. Nor did I see it
> > when I tried 'make kernel_menuconfig'
>
> (please don't top post on public mailing lists)
>
> You need to enable SWITCHDEV to have DSA. AFAIR SWITCHDEV may depend on
> EXPERT/EXPERIMENTAL as of 4.9 (or that was before).
>
>
Florian,

I have managed to use DSA driver and was able detect both internal and
external switches.
However, I only get packets flowing only through the internal switch.

I have used ip & bridge to setup the vlan 101 & 102 for lan and wan
respectively.

VLAN101 = lan1 lan2 lan3 lan4 lan5 lan6 lan7 lan8 extswitch eth0.101
VLAN102 = wan eth0.102

I'm unsure if I should include extswitch in lan.  What am I missing here?
Below is my updated device tree.

Thanks,

Vivek

&srab {
compatible = "brcm,bcm53012-srab", "brcm,bcm5301x-srab";
status = "okay";
dsa,member = <0 0>;

ports {
#address-cells = <1>;
#size-cells = <0>;

port@1 {
reg = <1>;
label = "lan7";
};

port@2 {
reg = <2>;
label = "lan4";
};

port@3 {
reg = <3>;
label = "lan8";
};

port@4 {
reg = <4>;
label = "wan";
};

port@5 {
reg = <5>;
ethernet = <&gmac0>;
label = "cpu";

fixed-link {

speed = <1000>;
full-duplex;
};
};

sw0port0: port@0 {
reg = <0>;
label = "extswitch";
                        phy-mode = "rgmii"

fixed-link {
speed = <1000>;
full-duplex;
};
};
};
};

&mdiomux {
    mdio-slave@0 {
        reg = <0x00>;
        address-cells = <1>;
        size-cells = <0>;

        switch@0  {
        compatible = "brcm,bcm53125";
            #address-cells = <1>;
            #size-cells = <0>;
            reset-gpios = <&chipcommon 10 GPIO_ACTIVE_LOW>;
            reset-names = "robo_reset";
        reg = <0>;
        dsa,member = <1 0>;

            ports {
                #address-cells = <1>;
                #size-cells = <0>;

                port@0 {
                        reg = <0>;
                        label = "lan1";
                };

                port@1 {
                        reg = <1>;
                        label = "lan5";
                };

                port@2 {
                        reg = <2>;
                        label = "lan2";
                };

                port@3 {
                        reg = <3>;
                        label = "lan6";
                };

                port@4 {
                        reg = <4>;
                        label = "lan3";
                };

                port@8 {
                        reg = <8>;
                        ethernet = <&sw0port0>;
                        label = "cpu";
                        phy-mode = "rgmii-txid";

                        fixed-link {
                            speed = <1000>;
                            full-duplex;
                        };
                };
            };
        };
    };
};

--001a114a903ee8696e0552f3c20c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed=
, Mar 15, 2017 at 5:19 PM Florian Fainelli &lt;<a href=3D"mailto:florian.fa=
inelli@broadcom.com">florian.fainelli@broadcom.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 03/15/2017 01:18 PM, Vivek Unune wrote:<b=
r>
&gt; Thanks Florian.<br>
&gt;<br>
&gt; Let me try this out. First I&#39;ll try to figure out how to add a mdi=
o node.<br>
&gt;<br>
&gt; Over the weekend I was trying enable DSA driver, but did not see DSA<b=
r>
&gt; under network. I&#39;m using LEDE source with kernel 4.9. Nor did I se=
e it<br>
&gt; when I tried &#39;make kernel_menuconfig&#39;<br>
<br>
(please don&#39;t top post on public mailing lists)<br>
<br>
You need to enable SWITCHDEV to have DSA. AFAIR SWITCHDEV may depend on<br>
EXPERT/EXPERIMENTAL as of 4.9 (or that was before).<br><br></blockquote><di=
v><br></div><div>Florian,</div><div><br></div><div>I have managed to use DS=
A driver and was able detect both internal and external switches.=C2=A0</di=
v><div>However, I only get packets flowing only through the internal switch=
.=C2=A0</div><div><br></div><div>I have used ip &amp; bridge to setup the v=
lan 101 &amp; 102 for lan and wan respectively.=C2=A0</div><div><br></div><=
div>VLAN101 =3D lan1 lan2 lan3 lan4 lan5 lan6 lan7 lan8 extswitch eth0.101<=
/div><div>VLAN102 =3D wan eth0.102</div><div><br></div><div>I&#39;m unsure =
if I should include extswitch in lan.<span class=3D"inbox-inbox-Apple-conve=
rted-space">=C2=A0</span>=C2=A0What am I missing here?=C2=A0</div><div>Belo=
w is my updated device tree.</div><div>=C2=A0<br></div><div>Thanks,</div><d=
iv><br></div><div>Vivek</div><div><br></div><div><div>&amp;srab {</div><div=
><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>compatibl=
e =3D &quot;brcm,bcm53012-srab&quot;, &quot;brcm,bcm5301x-srab&quot;;</div>=
<div><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>statu=
s =3D &quot;okay&quot;;</div><div><span class=3D"Apple-tab-span" style=3D"w=
hite-space:pre">	</span>dsa,member =3D &lt;0 0&gt;;</div><div><br></div><di=
v><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>ports {<=
/div><div><span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span=
>#address-cells =3D &lt;1&gt;;</div><div><span class=3D"Apple-tab-span" sty=
le=3D"white-space:pre">		</span>#size-cells =3D &lt;0&gt;;</div><div><br></=
div><div><span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>=
port@1 {</div><div><span class=3D"Apple-tab-span" style=3D"white-space:pre"=
>			</span>reg =3D &lt;1&gt;;</div><div><span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre">			</span>label =3D &quot;lan7&quot;;</div><div><span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>};</div><div><=
br></div><div><span class=3D"Apple-tab-span" style=3D"white-space:pre">		</=
span>port@2 {</div><div><span class=3D"Apple-tab-span" style=3D"white-space=
:pre">			</span>reg =3D &lt;2&gt;;</div><div><span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">			</span>label =3D &quot;lan4&quot;;</div><div>=
<span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>};</div><=
div><br></div><div><span class=3D"Apple-tab-span" style=3D"white-space:pre"=
>		</span>port@3 {</div><div><span class=3D"Apple-tab-span" style=3D"white-=
space:pre">			</span>reg =3D &lt;3&gt;;</div><div><span class=3D"Apple-tab-=
span" style=3D"white-space:pre">			</span>label =3D &quot;lan8&quot;;</div>=
<div><span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>};</=
div><div><br></div><div><span class=3D"Apple-tab-span" style=3D"white-space=
:pre">		</span>port@4 {</div><div><span class=3D"Apple-tab-span" style=3D"w=
hite-space:pre">			</span>reg =3D &lt;4&gt;;</div><div><span class=3D"Apple=
-tab-span" style=3D"white-space:pre">			</span>label =3D &quot;wan&quot;;</=
div><div><span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>=
};</div><div><br></div><div><span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre">		</span>port@5 {<span class=3D"Apple-tab-span" style=3D"white-sp=
ace:pre">		</span></div><div><span class=3D"Apple-tab-span" style=3D"white-=
space:pre">			</span>reg =3D &lt;5&gt;;</div><div><span class=3D"Apple-tab-=
span" style=3D"white-space:pre">			</span>ethernet =3D &lt;&amp;gmac0&gt;;<=
span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span></div><div>=
<span class=3D"Apple-tab-span" style=3D"white-space:pre">			</span>label =
=3D &quot;cpu&quot;;</div><div><br></div><div><span class=3D"Apple-tab-span=
" style=3D"white-space:pre">			</span>fixed-link {</div><div><br></div><div=
><span class=3D"Apple-tab-span" style=3D"white-space:pre">				</span>speed =
=3D &lt;1000&gt;;</div><div><span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre">				</span>full-duplex;</div><div><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">			</span>};</div><div><span class=3D"Apple-tab-s=
pan" style=3D"white-space:pre">		</span>};</div><div><br></div><div><span c=
lass=3D"Apple-tab-span" style=3D"white-space:pre">		</span>sw0port0: port@0=
 {</div><div><span class=3D"Apple-tab-span" style=3D"white-space:pre">			</=
span>reg =3D &lt;0&gt;;</div><div><span class=3D"Apple-tab-span" style=3D"w=
hite-space:pre">			</span>label =3D &quot;extswitch&quot;;=C2=A0</div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 phy-mode =3D &quot;rgmii&quot;<div><br></div><div><span class=3D"App=
le-tab-span" style=3D"white-space:pre">			</span>fixed-link {</div><div><sp=
an class=3D"Apple-tab-span" style=3D"white-space:pre">				</span>speed =3D =
&lt;1000&gt;;</div><div><span class=3D"Apple-tab-span" style=3D"white-space=
:pre">				</span>full-duplex;</div><div><span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre">			</span>};</div><div><span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">		</span>};</div><div><span class=3D"Apple-tab-s=
pan" style=3D"white-space:pre">	</span>}; =C2=A0</div><div>};</div><div><br=
></div><div>&amp;mdiomux {</div><div>=C2=A0 =C2=A0 mdio-slave@0 {</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x00&gt;;</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 address-cells =3D &lt;1&gt;;</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 size-cells =3D &lt;0&gt;;</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch@0 =C2=A0{</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 <span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>co=
mpatible =3D &quot;brcm,bcm53125&quot;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;1&gt;;</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;;</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset-gpios =3D &lt;&amp;chipcommon 10 GPIO_AC=
TIVE_LOW&gt;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset-nam=
es =3D &quot;robo_reset&quot;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> reg =3D &lt;0&g=
t;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span class=3D"Apple-tab-span" st=
yle=3D"white-space:pre">	</span> dsa,member =3D &lt;1 0&gt;;</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ports {</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 #address-cells =3D &lt;1&gt;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;;</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 port@0 {</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0&gt;;</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 label =3D &quot;lan1&quot;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<=
/div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@1 {<=
/div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 reg =3D &lt;1&gt;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D &quot=
;lan5&quot;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 };</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@2 {</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =
=3D &lt;2&gt;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D &quot;lan2&quot;;</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 port@3 {</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;3&gt;;</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 label =3D &quot;lan6&quot;;</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 po=
rt@4 {</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;4&gt;;</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label =
=3D &quot;lan3&quot;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 };</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@8 {</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 reg =3D &lt;8&gt;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ethernet =3D &lt;&amp;sw0port=
0&gt;;=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D &quot;cpu&quot;;</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 phy-mode =3D &quot;rgmii-txid&quot;;=C2=A0</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fixed-link {</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 speed =3D &lt;1000&gt;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 full-=
duplex;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 };</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 };</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 };</div><div>=C2=A0 =C2=A0 };<=
/div><div>};</div></div><div><br></div></div></div>

--001a114a903ee8696e0552f3c20c--
