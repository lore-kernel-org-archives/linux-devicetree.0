Return-Path: <ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20150609111320.F299FC40580@trevor.secretlab.ca>
References: <1433501478-15164-1-git-send-email-ricardo.ribalda@gmail.com>
 <20150608182310.1F13FC406AA@trevor.secretlab.ca> <CAPybu_2-EZoMEkWR9BoRfzGBevxCp-sd+CiVK2DhRjLoy5Pfyg@mail.gmail.com>
 <20150609111320.F299FC40580@trevor.secretlab.ca>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 9 Jun 2015 14:30:27 +0200
Message-ID: <CAPybu_0xK6=fEt9i=HK-nZxji9Wts0c3DmfaCP0j0_Eaj3-MLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kernel/resource: Add new flag IORESOURCE_SHARED
Content-Type: multipart/alternative; boundary=089e011618da908f69051814ed51
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <robherring2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Vivek Goyal <vgoyal@redhat.com>, Jakub Sitnicki <jsitnicki@gmail.com>, Mike Travis <travis@sgi.com>, Jiang Liu <jiang.liu@linux.intel.com>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, Cliff Wickman <cpw@sgi.com>
List-ID: <devicetree@vger.kernel.org>

--089e011618da908f69051814ed51
Content-Type: text/plain; charset=UTF-8

Hello Grant


On Tue, Jun 9, 2015 at 1:13 PM, Grant Likely <grant.likely@linaro.org>
wrote:

> On Mon, 8 Jun 2015 22:02:06 +0200
> , Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>  wrote:
> > Hello Grant
> >
> > On Mon, Jun 8, 2015 at 8:23 PM, Grant Likely <grant.likely@linaro.org>
> wrote:
> > > On Fri,  5 Jun 2015 12:51:17 +0200
> > > , Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > >  wrote:
> > >> Some device tree platforms have not defined correctly their memory
> > >> resources (i.e. Overlapping or duplication of resources).
> > >> To avoid this issue we have historically avoided to add their
> resources to
> > >> the resource tree. This leads to code duplication and oops when
> trying to
> > >> unload dynamically a device tree (feature introduced recently).
> > >>
> > >> This new flag tells the resource system that a resource can be shared
> by
> > >> multiple owners, so we can support device trees with problems at the
> > >> same time that we do not duplicate code or crash when unloading the
> > >> device tree.
> > >>
> > >> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > >> ---
> > >
> > > I'm really not comfortable with this change. The resource tree code is
> > > complicated enough as is. Adding this exception case quite probably
> adds
> > > corner cases that aren't property dealt with. If two regions overlay,
> > > and then request_region is called? Which region does it become a child
> > > of? And that's just off the top of my head. I don't want to hack in
> > > changes to the resource code for what is a corner case.
> >
> > I see your concern, perhaps you could provide a testcase and we can
> > find out if it fails or not. So far I have tested a device tree with
> > two devices on the same memory region, each device managed by a
> > driver.
>
> Actually, you need to provide the test case. You need to show that
> you've thought through all the implications and corner cases on the
> resource code. This is a non-trivial change to the how the resource code
> works, and you need to demonstrate that your really understand the
> implications of what you are doing.
>
> Start with the example I pointed out. When a driver does a
> request_mem_region(), which resource does it end up being a parent of if
> the regions overlap? Can you write a unittest that demonstrates the code
> has the correct behaviour? Will a driver end up getting the wrong
> device's resource structure as the parent? (hint: yes it will)
>

On non broken platforms:

 it will work exactly as it works today.

On broken platforms:

I have tried with  duplicated devices: Both requesting the region via
devm_ioremap_resource

a0000000-dfffffff : PCI Bus 0000:00
  b0000000-cfffffff : PCI Bus 0000:01
      b0030000-b003ffff : /axi1/pcie_bridge_1
        b0030000-b003ffff : /axi1/pcie_bridge
          b0030000-b003ffff : /axi1/pcie_bridge
        b0030000-b003ffff : /axi1/pcie_bridge_1


pcie_bridge_0: pcie_bridge {
#address-cells = <1>;
#size-cells = <1>;
compatible = "xlnx,axi-pcie-1.00.a";
reg = < 0x30030000 0x10000 >;
interrupt-parent = <&xps_intc_0>;
interrupts = < 0 2 >;
qtec,apertures =<
0x80000000 0x20000000
0xa0000000 0x20000000
0xc0000000 0x20000000
0xe0000000 0x20000000
>;
};

pcie_bridge_1: pcie_bridge_1 {
#address-cells = <1>;
#size-cells = <1>;
compatible = "xlnx,axi-pcie-1.00.a";
reg = < 0x30030000 0x10000 >;
interrupt-parent = <&xps_intc_0>;
interrupts = < 31 2 >;
qtec,apertures =<
0x80000000 0x20000000
0xa0000000 0x20000000
0xc0000000 0x20000000
0xe0000000 0x20000000
>;
};

And for two devices requesting the same region via devm_ioremap_resource()



a0000000-dfffffff : PCI Bus 0000:00
  b0000000-cfffffff : PCI Bus 0000:01
      b0030000-b003ffff : /axi1/pcie_bridge
        b0030000-b003ffff : /axi1/pcie_bridge
        b0030000-b003ffff : /axi1/pcie_bridge

pcie_bridge_0: pcie_bridge {
#address-cells = <1>;
#size-cells = <1>;
compatible = "xlnx,axi-pcie-1.00.a";
reg = < 0x30030000 0x10000 >;
interrupt-parent = <&xps_intc_0>;
interrupts = < 0 2 >;
qtec,apertures =<
0x80000000 0x20000000
0xa0000000 0x20000000
0xc0000000 0x20000000
0xe0000000 0x20000000
>;
};

packer_0: packer_0{
#address-cells = <1>;
#size-cells = <1>;
     compatible = "qtec,axi_matrix_packer-1.00.a";
reg = < 0x30060000 0x10000 >;
qtec,pcie_bridge= <&pcie_bridge_0>;
};




>
> > I can load and unload the device tree perfectly.
>
> Merely making it work for your use-case isn't the issue. It's whether or
> not making this change will break the core behavour of the resource
> code.
>
> g.
>



-- 
Ricardo Ribalda

--089e011618da908f69051814ed51
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Grant<div><br></div><div><br></div><div class=3D"gma=
il_extra"><div class=3D"gmail_quote">On Tue, Jun 9, 2015 at 1:13 PM, Grant =
Likely <span dir=3D"ltr">&lt;<a href=3D"mailto:grant.likely@linaro.org" tar=
get=3D"_blank">grant.likely@linaro.org</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left=
:1ex">On Mon, 8 Jun 2015 22:02:06 +0200<br>
<div><div class=3D"h5">, Ricardo Ribalda Delgado &lt;<a href=3D"mailto:rica=
rdo.ribalda@gmail.com">ricardo.ribalda@gmail.com</a>&gt;<br>
=C2=A0wrote:<br>
&gt; Hello Grant<br>
&gt;<br>
&gt; On Mon, Jun 8, 2015 at 8:23 PM, Grant Likely &lt;<a href=3D"mailto:gra=
nt.likely@linaro.org">grant.likely@linaro.org</a>&gt; wrote:<br>
&gt; &gt; On Fri,=C2=A0 5 Jun 2015 12:51:17 +0200<br>
&gt; &gt; , Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo.ribalda@g=
mail.com">ricardo.ribalda@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 wrote:<br>
&gt; &gt;&gt; Some device tree platforms have not defined correctly their m=
emory<br>
&gt; &gt;&gt; resources (i.e. Overlapping or duplication of resources).<br>
&gt; &gt;&gt; To avoid this issue we have historically avoided to add their=
 resources to<br>
&gt; &gt;&gt; the resource tree. This leads to code duplication and oops wh=
en trying to<br>
&gt; &gt;&gt; unload dynamically a device tree (feature introduced recently=
).<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This new flag tells the resource system that a resource can b=
e shared by<br>
&gt; &gt;&gt; multiple owners, so we can support device trees with problems=
 at the<br>
&gt; &gt;&gt; same time that we do not duplicate code or crash when unloadi=
ng the<br>
&gt; &gt;&gt; device tree.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:=
ricardo.ribalda@gmail.com">ricardo.ribalda@gmail.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m really not comfortable with this change. The resource tre=
e code is<br>
&gt; &gt; complicated enough as is. Adding this exception case quite probab=
ly adds<br>
&gt; &gt; corner cases that aren&#39;t property dealt with. If two regions =
overlay,<br>
&gt; &gt; and then request_region is called? Which region does it become a =
child<br>
&gt; &gt; of? And that&#39;s just off the top of my head. I don&#39;t want =
to hack in<br>
&gt; &gt; changes to the resource code for what is a corner case.<br>
&gt;<br>
&gt; I see your concern, perhaps you could provide a testcase and we can<br=
>
&gt; find out if it fails or not. So far I have tested a device tree with<b=
r>
&gt; two devices on the same memory region, each device managed by a<br>
&gt; driver.<br>
<br>
</div></div>Actually, you need to provide the test case. You need to show t=
hat<br>
you&#39;ve thought through all the implications and corner cases on the<br>
resource code. This is a non-trivial change to the how the resource code<br=
>
works, and you need to demonstrate that your really understand the<br>
implications of what you are doing.<br>
<br>
Start with the example I pointed out. When a driver does a<br>
request_mem_region(), which resource does it end up being a parent of if<br=
>
the regions overlap? Can you write a unittest that demonstrates the code<br=
>
has the correct behaviour? Will a driver end up getting the wrong<br>
device&#39;s resource structure as the parent? (hint: yes it will)<br></blo=
ckquote><div><br></div><div>On non broken platforms:</div><div><br></div><d=
iv>=C2=A0it will work exactly as it works today.</div><div><br></div><div>O=
n broken platforms:</div><div><br></div><div>I have tried with =C2=A0duplic=
ated devices: Both requesting the region via devm_ioremap_resource</div><di=
v><br></div><div><div>a0000000-dfffffff : PCI Bus 0000:00<br></div><div>=C2=
=A0 b0000000-cfffffff : PCI Bus 0000:01</div></div><div><div>=C2=A0 =C2=A0 =
=C2=A0 b0030000-b003ffff : /axi1/pcie_bridge_1</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 b0030000-b003ffff : /axi1/pcie_bridge</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 b0030000-b003ffff : /axi1/pcie_bridge</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 b0030000-b003ffff : /axi1/pcie_bridge_1</div></div><d=
iv><br></div><div><br></div><div><div><span class=3D"" style=3D"white-space=
:pre">		</span>pcie_bridge_0: pcie_bridge {</div><div><span class=3D"" styl=
e=3D"white-space:pre">			</span>#address-cells =3D &lt;1&gt;;</div><div><sp=
an class=3D"" style=3D"white-space:pre">			</span>#size-cells =3D &lt;1&gt;=
;</div><div><span class=3D"" style=3D"white-space:pre">			</span>compatible=
 =3D &quot;xlnx,axi-pcie-1.00.a&quot;;</div><div><span class=3D"" style=3D"=
white-space:pre">			</span>reg =3D &lt; 0x30030000 0x10000 &gt;;</div><div>=
<span class=3D"" style=3D"white-space:pre">			</span>interrupt-parent =3D &=
lt;&amp;xps_intc_0&gt;;</div><div><span class=3D"" style=3D"white-space:pre=
">			</span>interrupts =3D &lt; 0 2 &gt;;</div><div><span class=3D"" style=
=3D"white-space:pre">			</span>qtec,apertures =3D&lt;</div><div><span class=
=3D"" style=3D"white-space:pre">				</span>0x80000000 0x20000000</div><div>=
<span class=3D"" style=3D"white-space:pre">				</span>0xa0000000 0x20000000=
</div><div><span class=3D"" style=3D"white-space:pre">				</span>0xc0000000=
 0x20000000</div><div><span class=3D"" style=3D"white-space:pre">				</span=
>0xe0000000 0x20000000</div><div><span class=3D"" style=3D"white-space:pre"=
>				</span>&gt;;</div><div><span class=3D"" style=3D"white-space:pre">		</=
span>};</div></div><div><br></div><div><div><span class=3D"" style=3D"white=
-space:pre">		</span>pcie_bridge_1: pcie_bridge_1 {</div><div><span class=
=3D"" style=3D"white-space:pre">			</span>#address-cells =3D &lt;1&gt;;</di=
v><div><span class=3D"" style=3D"white-space:pre">			</span>#size-cells =3D=
 &lt;1&gt;;</div><div><span class=3D"" style=3D"white-space:pre">			</span>=
compatible =3D &quot;xlnx,axi-pcie-1.00.a&quot;;</div><div><span class=3D""=
 style=3D"white-space:pre">			</span>reg =3D &lt; 0x30030000 0x10000 &gt;;<=
/div><div><span class=3D"" style=3D"white-space:pre">			</span>interrupt-pa=
rent =3D &lt;&amp;xps_intc_0&gt;;</div><div><span class=3D"" style=3D"white=
-space:pre">			</span>interrupts =3D &lt; 31 2 &gt;;</div><div><span class=
=3D"" style=3D"white-space:pre">			</span>qtec,apertures =3D&lt;</div><div>=
<span class=3D"" style=3D"white-space:pre">				</span>0x80000000 0x20000000=
</div><div><span class=3D"" style=3D"white-space:pre">				</span>0xa0000000=
 0x20000000</div><div><span class=3D"" style=3D"white-space:pre">				</span=
>0xc0000000 0x20000000</div><div><span class=3D"" style=3D"white-space:pre"=
>				</span>0xe0000000 0x20000000</div><div><span class=3D"" style=3D"white=
-space:pre">				</span>&gt;;</div><div><span class=3D"" style=3D"white-spac=
e:pre">		</span>};</div></div><div><br></div><div>And for two devices reque=
sting the same region via devm_ioremap_resource()</div><div><br></div><div>=
<br></div><div><br></div><div><div>a0000000-dfffffff : PCI Bus 0000:00<br><=
/div><div>=C2=A0 b0000000-cfffffff : PCI Bus 0000:01<br></div><div><div>=C2=
=A0 =C2=A0 =C2=A0 b0030000-b003ffff : /axi1/pcie_bridge</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 b0030000-b003ffff : /axi1/pcie_bridge</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 b0030000-b003ffff : /axi1/pcie_bridge</div></div></di=
v><div><br></div><div><div><span class=3D"" style=3D"white-space:pre">		</s=
pan>pcie_bridge_0: pcie_bridge {</div><div><span class=3D"" style=3D"white-=
space:pre">			</span>#address-cells =3D &lt;1&gt;;</div><div><span class=3D=
"" style=3D"white-space:pre">			</span>#size-cells =3D &lt;1&gt;;</div><div=
><span class=3D"" style=3D"white-space:pre">			</span>compatible =3D &quot;=
xlnx,axi-pcie-1.00.a&quot;;</div><div><span class=3D"" style=3D"white-space=
:pre">			</span>reg =3D &lt; 0x30030000 0x10000 &gt;;</div><div><span class=
=3D"" style=3D"white-space:pre">			</span>interrupt-parent =3D &lt;&amp;xps=
_intc_0&gt;;</div><div><span class=3D"" style=3D"white-space:pre">			</span=
>interrupts =3D &lt; 0 2 &gt;;</div><div><span class=3D"" style=3D"white-sp=
ace:pre">			</span>qtec,apertures =3D&lt;</div><div><span class=3D"" style=
=3D"white-space:pre">				</span>0x80000000 0x20000000</div><div><span class=
=3D"" style=3D"white-space:pre">				</span>0xa0000000 0x20000000</div><div>=
<span class=3D"" style=3D"white-space:pre">				</span>0xc0000000 0x20000000=
</div><div><span class=3D"" style=3D"white-space:pre">				</span>0xe0000000=
 0x20000000</div><div><span class=3D"" style=3D"white-space:pre">				</span=
>&gt;;</div><div><span class=3D"" style=3D"white-space:pre">		</span>};</di=
v></div><div><br></div><div><div><span class=3D"" style=3D"white-space:pre"=
>		</span>packer_0: packer_0{</div><div><span class=3D"" style=3D"white-spa=
ce:pre">			</span>#address-cells =3D &lt;1&gt;;</div><div><span class=3D"" =
style=3D"white-space:pre">			</span>#size-cells =3D &lt;1&gt;;</div><div><s=
pan class=3D"" style=3D"white-space:pre">		</span> =C2=A0 =C2=A0 <span clas=
s=3D"" style=3D"white-space:pre">	</span>compatible =3D &quot;qtec,axi_matr=
ix_packer-1.00.a&quot;;</div><div><span class=3D"" style=3D"white-space:pre=
">			</span>reg =3D &lt; 0x30060000 0x10000 &gt;;</div><div><span class=3D"=
" style=3D"white-space:pre">			q</span>tec,pcie_bridge=3D &lt;&amp;pcie_bri=
dge_0&gt;;<span style=3D"white-space:pre">			</span></div><div><span class=
=3D"" style=3D"white-space:pre">		</span>};</div></div><div><br></div><div>=
<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204=
,204);border-left-style:solid;padding-left:1ex">
<span class=3D""><br>
&gt; I can load and unload the device tree perfectly.<br>
<br>
</span>Merely making it work for your use-case isn&#39;t the issue. It&#39;=
s whether or<br>
not making this change will break the core behavour of the resource<br>
code.<br>
<span class=3D""><font color=3D"#888888"><br>
g.<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">Ricardo Ribalda</div>
</div></div>

--089e011618da908f69051814ed51--
