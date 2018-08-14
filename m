Return-Path: <SRS0=zNDs=K5=gmail.com=zbsdta@kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?5byg5rOi?= <zbsdta@gmail.com>
Date: Tue, 14 Aug 2018 22:44:52 +0800
Message-ID: <CADUUTHCAB2eWFX-JCisfCzj6SLHLhJzYMUdf94FbDd-TYSj6fA@mail.gmail.com>
Subject: How delete node or property in overlayd dts?
Content-Type: multipart/alternative; boundary="000000000000b63b780573664074"
To: robh+dt@kernel.org, frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--000000000000b63b780573664074
Content-Type: text/plain; charset="UTF-8"

/delete-node/ /delete-prop/ could be used in dtsi files without device tree
overlay.

but with device tree overlay,  /delete-node/ and  /delete-prop/ are not
work.
How to delete property and node in overlay dts?

for example,
in basel.dts have following node
node1 {
    property1;
    property3;
    node2 {
        property2;
    }
}

in overlay.dts as following
 node1 {
    /delete-property/ property1;
    /delete-node/ node2;
}

after overlay, property1 and node2 is not deleted.

--000000000000b63b780573664074
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">/delete-node/ /delete-prop/ could be used in dtsi files wi=
thout device tree overlay.<div><br></div><div>but with device tree overlay,=
=C2=A0

<span style=3D"font-size:small;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">/delete-node/ and=C2=A0 /delete-prop/ are not work.</span></div><div><spa=
n style=3D"font-size:small;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">Ho=
w to delete property and node in overlay dts?</span></div><div><span style=
=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline"><br></spa=
n></div><div>for example,=C2=A0</div><div>in basel.dts have following node<=
/div><div>node1 {</div><div>=C2=A0 =C2=A0 property1;</div><div>=C2=A0 =C2=
=A0 property3;</div><div>=C2=A0 =C2=A0 node2 {</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 property2;</div><div>=C2=A0 =C2=A0 }</div><div>}</div><div><br><=
/div><div>in overlay.dts as following</div><div>=C2=A0node1 {</div><div>=C2=
=A0 =C2=A0 /delete-property/ property1;</div><div>=C2=A0 =C2=A0 /delete-nod=
e/ node2;</div><div>}</div><div><br></div><div>after overlay, property1 and=
 node2 is not deleted.</div><div><br></div><div><br></div></div>

--000000000000b63b780573664074--
