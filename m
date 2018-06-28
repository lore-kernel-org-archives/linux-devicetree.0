Return-Path: <SRS0=aZFw=JO=gmail.com=mr.ray.clinton@kernel.org>
MIME-Version: 1.0
From: Ray Clinton <mr.ray.clinton@gmail.com>
Date: Thu, 28 Jun 2018 12:16:32 -0400
Message-ID: <CAPMnawtNMm4sZmU1Z1Laa81tC6KJBGaKn0K_sPxxbPsD+KngOA@mail.gmail.com>
Subject: of_n_{addr,size}_cells(struct device_node *np) - Allow for returning
 value of node passed in
Content-Type: multipart/alternative; boundary="00000000000090823f056fb60e39"
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--00000000000090823f056fb60e39
Content-Type: text/plain; charset="UTF-8"

Hi,

I only just started doing anything with kernel development, this is my
first email on this list, so I'm sorry if I ask a dumb question or mess up
on any rules of etiquette, I'm trying to follow them.

I'm sure there is a reason for this, but of_n_{addr,size}_cells() will only
return a parent's #address-cells or #size-cells values. I realize
of_property_read_u32(np, "#address-cells", &cells), for example, could be
called on the current node to get that value, but is seems to be that
of_n_{addr,size}_cells() is a little bit of a misleading name; I expected
it to return the above mentioned values of the node passed in, and if that
was not explicitly defined it would look to the parents. I ask because I
ran into a problem when working on a driver and trying to include an .dtsi
that contained a node with different values for #address-cells and
#size-cells; I could never get the correct values returned, I only got the
parents'. So my questions are

1) If the methods are not meant to return the values for #address-cells and
#size-cells should it be named something like of_n_parent_{addr,size}_cells?
2) If they are meant to return the values for the current node could there
be a check that looks something like this?:

int of_n_addr_cells(struct device_node *np)
{
u32 cells;

*       if (!of_property_read_u32(np, "#address-cells", &cells))*
*               return cells;*

do {
if (np->parent)
np = np->parent;
if (!of_property_read_u32(np, "#address-cells", &cells))
return cells;
} while (np->parent);
/* No #address-cells property for the root node */
return OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
}

I realize I could be missing something and that this isn't an important
change, but I just thought I'd ask. Thanks so much!

--00000000000090823f056fb60e39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">Hi,</span><div style=3D"text-de=
coration-style:initial;text-decoration-color:initial"><br></div><div style=
=3D"text-decoration-style:initial;text-decoration-color:initial">I only jus=
t started doing anything with kernel development, this is my first email on=
 this list, so I&#39;m sorry if I ask a dumb question or mess up on any rul=
es of etiquette, I&#39;m trying to follow them.=C2=A0</div><div style=3D"te=
xt-decoration-style:initial;text-decoration-color:initial"><br></div><div s=
tyle=3D"text-decoration-style:initial;text-decoration-color:initial">I&#39;=
m sure there is a reason for this, but of_n_{addr,size}_cells() will only r=
eturn a parent&#39;s #address-cells or #size-cells values. I realize of_pro=
perty_read_u32(np, &quot;#address-cells&quot;, &amp;cells), for example, co=
uld be called on the current node to get that value, but is seems to be tha=
t of_n_{addr,size}_cells() is a little bit of a misleading name; I expected=
 it to return the above mentioned values of the node passed in, and if that=
 was not explicitly defined it would look to the parents. I ask because I r=
an into a problem when working on a driver and trying to include an .dtsi t=
hat contained a node with different values for #address-cells and #size-cel=
ls; I could never get the correct values returned, I only got the parents&#=
39;. So my questions are</div><div style=3D"text-decoration-style:initial;t=
ext-decoration-color:initial"><br></div><div style=3D"text-decoration-style=
:initial;text-decoration-color:initial">1) If the methods are not meant to =
return the values for #address-cells and #size-cells should it be named som=
ething like of_n_parent_{addr,size}_cells?</div><div style=3D"text-decorati=
on-style:initial;text-decoration-color:initial">2) If they are meant to ret=
urn the values for the current node could there be a check that looks somet=
hing like this?:</div><div style=3D"text-decoration-style:initial;text-deco=
ration-color:initial"><br></div><div style=3D"text-decoration-style:initial=
;text-decoration-color:initial"><div>int of_n_addr_cells(struct device_node=
 *np)</div><div>{</div><div><span style=3D"white-space:pre-wrap">	</span>u3=
2 cells;</div><div><br></div><div><div style=3D"background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial"><i>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0if (!of_property_read_u32(np, &quot;#address-cells&=
quot;, &amp;cells))</i></div><div style=3D"background-color:rgb(255,255,255=
);text-decoration-style:initial;text-decoration-color:initial"><i>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return cells;</i></div></di=
v><div style=3D"background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><br></div><div><span style=3D"white-spa=
ce:pre-wrap">	</span>do {</div><div><span style=3D"white-space:pre-wrap">		=
</span>if (np-&gt;parent)</div><div><span style=3D"white-space:pre-wrap">		=
	</span>np =3D np-&gt;parent;</div><div><span style=3D"white-space:pre-wrap=
">		</span>if (!of_property_read_u32(np, &quot;#address-cells&quot;, &amp;c=
ells))</div><div><span style=3D"white-space:pre-wrap">			</span>return cell=
s;</div><div><span style=3D"white-space:pre-wrap">	</span>} while (np-&gt;p=
arent);</div><div><span style=3D"white-space:pre-wrap">	</span>/* No #addre=
ss-cells property for the root node */</div><div><span style=3D"white-space=
:pre-wrap">	</span>return OF_ROOT_NODE_ADDR_CELLS_DEFAULT;</div><div>}</div=
></div><div style=3D"text-decoration-style:initial;text-decoration-color:in=
itial"><br></div><div style=3D"text-decoration-style:initial;text-decoratio=
n-color:initial">I realize I could be missing something and that this isn&#=
39;t an important change, but I just thought I&#39;d ask. Thanks so much!</=
div><br></div>

--00000000000090823f056fb60e39--
