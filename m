From: Tony Prisk <sentientnz@yahoo.co.nz>
Subject: Re: [PATCH 1/1] Add Wondermedia Technologies (wmt) to
 docs/devicetree/vendor-bindings.txt
Date: Tue, 17 Jul 2012 06:47:21 -0700 (PDT)
Message-ID: <1342532841.54512.YahooMailNeo@web140804.mail.bf1.yahoo.com>
References: <76F764B079F92A4E843589C893D0A022C380F1D4@SERVER.prisktech.co.nz>
 <201207171250.32265.arnd@arndb.de>
Reply-To: Tony Prisk <sentientnz@yahoo.co.nz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5776810397999007662=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201207171250.32265.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Tony Prisk <linux@prisktech.co.nz>
Cc: "vt8500-wm8505-linux-kernel@googlegroups.com" <vt8500-wm8505-linux-kernel@googlegroups.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Russell King <linux@arm.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============5776810397999007662==
Content-Type: multipart/alternative; boundary="1125311499-75163143-1342532841=:54512"

--1125311499-75163143-1342532841=:54512
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Arnd,=0A=0AI don't know what has happened with the patch(es).=0AI used git =
format-patch to export them. I had to copy them to another PC to send the e=
mails, so perhaps that's the problem.=0A=0ARe: 'wmt' - as Alexey mentioned,=
 this is the name the vendor uses in their own sources so it seemed like th=
e obvious choice. I will post on devicetree-discuss and see what they think=
.=0A=0ARegard,=0ATony P=0A=0A=0A=0A________________________________=0A From=
: Arnd Bergmann <arnd@arndb.de>=0ATo: Tony Prisk <linux@prisktech.co.nz> =
=0ACc: "vt8500-wm8505-linux-kernel@googlegroups.com" <vt8500-wm8505-linux-k=
ernel@googlegroups.com>; devicetree-discuss@lists.ozlabs.org; Russell King =
<linux@arm.linux.org.uk>; "linux-kernel@vger.kernel.org" <linux-kernel@vger=
.kernel.org>; "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@list=
s.infradead.org> =0ASent: Wednesday, 18 July 2012 12:50 AM=0ASubject: Re: [=
PATCH 1/1] Add Wondermedia Technologies (wmt) to docs/devicetree/vendor-bin=
dings.txt=0A =0AOn Tuesday 17 July 2012, Tony Prisk wrote:=0A> From 756ae5c=
2f475d679649adff99058679b651af8d9 Mon Sep 17 00:00:00 2001=0A> From: Tony P=
risk <linux@prisktech.co.nz>=0A> Date: Tue, 17 Jul 2012 19:09:31 +1200=0A> =
Subject: [PATCH] Add Wondermedia Technologies (wmt) to vendor-prefixes.txt=
=0A>=A0 Signed-off-by: Tony Prisk <linux@prisktech.co.nz>=0A=0ASomething we=
nt wrong with exporting the patch. You probably used git-show=0Arather than=
 git-format-patch, so you got the wrong headers.=0A=0AIt would also be help=
ful to describe why the specific string is used here.=0ANormally we use the=
 stock ticker symbol and "wmt" refers to Wal-Mart,=0Awhich would be unlikel=
y but not impossible to produce their own hardware=0Ain the future. The sam=
e thing applies to "via", which is VIACOM. The symbol=0Afor VIA technologie=
s is "2388.TW", but that is not particularly descriptive=0Aor well-known.=
=0A=0AMaybe someone on the devicetree-discuss mailing list has a better=0As=
uggestion. I think using "via" is probably the best compromise, as=0Ait's a=
 well-known name and most of the components of the wondermedia=0Achips were=
 first made by VIA anyway.=0A=0A=A0=A0=A0 Arnd=0A=0A_______________________=
________________________=0Alinux-arm-kernel mailing list=0Alinux-arm-kernel=
@lists.infradead.org=0Ahttp://lists.infradead.org/mailman/listinfo/linux-ar=
m-kernel
--1125311499-75163143-1342532841=:54512
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ti=
mes new roman, new york, times, serif;font-size:12pt"><div><span>Arnd,</spa=
n></div><div><br><span></span></div><div><span>I don't know what has happen=
ed with the patch(es).</span></div><div><span>I used git format-patch to ex=
port them. I had to copy them to another PC to send the emails, so perhaps =
that's the problem.</span></div><div><br><span></span></div><div><span>Re: =
'wmt' - as Alexey mentioned, this is the name the vendor uses in their own =
sources so it seemed like the obvious choice. I will post on devicetree-dis=
cuss and see what they think.</span></div><div><br><span></span></div><div>=
<span>Regard,</span></div><div><span>Tony P</span></div><div><br></div>  <d=
iv style=3D"font-family: times new roman, new york, times, serif; font-size=
: 12pt;"> <div style=3D"font-family: times new roman, new york, times, seri=
f; font-size: 12pt;"> <div dir=3D"ltr"> <font face=3D"Arial" size=3D"2"> <h=
r
 size=3D"1">  <b><span style=3D"font-weight:bold;">From:</span></b> Arnd Be=
rgmann &lt;arnd@arndb.de&gt;<br> <b><span style=3D"font-weight: bold;">To:<=
/span></b> Tony Prisk &lt;linux@prisktech.co.nz&gt; <br><b><span style=3D"f=
ont-weight: bold;">Cc:</span></b> "vt8500-wm8505-linux-kernel@googlegroups.=
com" &lt;vt8500-wm8505-linux-kernel@googlegroups.com&gt;; devicetree-discus=
s@lists.ozlabs.org; Russell King &lt;linux@arm.linux.org.uk&gt;; "linux-ker=
nel@vger.kernel.org" &lt;linux-kernel@vger.kernel.org&gt;; "linux-arm-kerne=
l@lists.infradead.org" &lt;linux-arm-kernel@lists.infradead.org&gt; <br> <b=
><span style=3D"font-weight: bold;">Sent:</span></b> Wednesday, 18 July 201=
2 12:50 AM<br> <b><span style=3D"font-weight: bold;">Subject:</span></b> Re=
: [PATCH 1/1] Add Wondermedia Technologies (wmt) to docs/devicetree/vendor-=
bindings.txt<br> </font> </div> <br>On Tuesday 17 July 2012, Tony Prisk wro=
te:<br>&gt; From 756ae5c2f475d679649adff99058679b651af8d9 Mon Sep 17 00:00:=
00
 2001<br>&gt; From: Tony Prisk &lt;<a ymailto=3D"mailto:linux@prisktech.co.=
nz" href=3D"mailto:linux@prisktech.co.nz">linux@prisktech.co.nz</a>&gt;<br>=
&gt; Date: Tue, 17 Jul 2012 19:09:31 +1200<br>&gt; Subject: [PATCH] Add Won=
dermedia Technologies (wmt) to vendor-prefixes.txt<br>&gt;&nbsp; Signed-off=
-by: Tony Prisk &lt;<a ymailto=3D"mailto:linux@prisktech.co.nz" href=3D"mai=
lto:linux@prisktech.co.nz">linux@prisktech.co.nz</a>&gt;<br> <br>Something =
went wrong with exporting the patch. You probably used git-show<br>rather t=
han git-format-patch, so you got the wrong headers.<br><br>It would also be=
 helpful to describe why the specific string is used here.<br>Normally we u=
se the stock ticker symbol and "wmt" refers to Wal-Mart,<br>which would be =
unlikely but not impossible to produce their own hardware<br>in the future.=
 The same thing applies to "via", which is VIACOM. The symbol<br>for VIA te=
chnologies is "2388.TW", but that is not particularly descriptive<br>or
 well-known.<br><br>Maybe someone on the devicetree-discuss mailing list ha=
s a better<br>suggestion. I think using "via" is probably the best compromi=
se, as<br>it's a well-known name and most of the components of the wonderme=
dia<br>chips were first made by VIA anyway.<br><br>&nbsp;&nbsp;&nbsp; Arnd<=
br><br>_______________________________________________<br>linux-arm-kernel =
mailing list<br><a ymailto=3D"mailto:linux-arm-kernel@lists.infradead.org" =
href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@lists=
.infradead.org</a><br><a href=3D"http://lists.infradead.org/mailman/listinf=
o/linux-arm-kernel" target=3D"_blank">http://lists.infradead.org/mailman/li=
stinfo/linux-arm-kernel</a><br><br><br> </div> </div>  </div></body></html>
--1125311499-75163143-1342532841=:54512--


--===============5776810397999007662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5776810397999007662==--
