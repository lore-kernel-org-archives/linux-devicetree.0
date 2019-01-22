Return-Path: <SRS0=TsXe=P7=xilinx.com=navam@kernel.org>
From: Nava kishore Manne <navam@xilinx.com>
Subject: RE: [PATCH v3 6/6] dt-bindings: fpga: Add bindings for ZynqMP fpga
 driver
Date: Tue, 22 Jan 2019 09:13:14 +0000
Message-ID: 
 <BYAPR02MB4710D1404CF2816599623363C2980@BYAPR02MB4710.namprd02.prod.outlook.com>
References: <20190121173835.21173-1-nava.manne@xilinx.com>
 <20190121173835.21173-7-nava.manne@xilinx.com> <20190121154928.GA32129@bogus>
In-Reply-To: <20190121154928.GA32129@bogus>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BYAPR02MB4710D1404CF2816599623363C2980BYAPR02MB4710namp_"
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, Rajan Vaja <RAJANV@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jolly Shah <JOLLYS@xilinx.com>, "chinnikishore369@gmail.com" <chinnikishore369@gmail.com>
List-ID: <devicetree@vger.kernel.org>

--_000_BYAPR02MB4710D1404CF2816599623363C2980BYAPR02MB4710namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Rob,



Thanks for providing the comments...



> -----Original Message-----

> From: Rob Herring [mailto:robh@kernel.org]

> Sent: Monday, January 21, 2019 9:19 PM

> To: Nava kishore Manne <navam@xilinx.com>

> Cc: mark.rutland@arm.com; Michal Simek <michals@xilinx.com>; Rajan Vaja

> <RAJANV@xilinx.com>; linux-arm-kernel@lists.infradead.org; linux-

> kernel@vger.kernel.org; devicetree@vger.kernel.org; Jolly Shah

> <JOLLYS@xilinx.com>; chinnikishore369@gmail.com

> Subject: Re: [PATCH v3 6/6] dt-bindings: fpga: Add bindings for ZynqMP fp=
ga

> driver

>

> On Mon, Jan 21, 2019 at 11:08:35PM +0530, Nava kishore Manne wrote:

> > Add documentation to describe Xilinx ZynqMP fpga driver bindings.

> >

> > Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com<mailto:nava.ma=
nne@xilinx.com>>

> > ---

> > Changes for v3:

> >                         -Removed PCAP as a child node to the FW and Cre=
ated

> >                         an independent node since PCAP driver is a cons=
umer

> >                         not a provider.

> >

> >  .../bindings/fpga/xlnx,zynqmp-pcap-fpga.txt         | 13 +++++++++++++

> >  1 file changed, 13 insertions(+)

> >  create mode 100644

> > Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt

> >

> > diff --git

> > a/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt

> > b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt

> > new file mode 100644

> > index 000000000000..1f6f58872311

> > --- /dev/null

> > +++ b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt

> > @@ -0,0 +1,13 @@

> > +Device Tree zynqmp-fpga bindings for the Zynq Ultrascale+ MPSoC

> > +controlled using ZynqMP SoC firmware interface For Bitstream

> > +configuration on ZynqMp Soc uses processor configuration

> > +port(PCAP) to configure the programmable logic(PL) through PS by

> > +using FW interface.

> > +

> > +Required properties:

> > +- compatible: should contain "xlnx,zynqmp-pcap-fpga"

> > +

> > +Example:

> > +      zynqmp_pcap: pcap {

> > +                     compatible =3D "xlnx,zynqmp-pcap-fpga";

> > +      };

>

> There's no need for a DT node. Just make the firware driver create a plat=
form

> device for pcap.

>



This driver being used by the FPGA manager framework(fpga-region) to apply =
overlay's so this node is needed AFAIK.

Please correct me if I am wrong...



Regards,

Navakishore.

--_000_BYAPR02MB4710D1404CF2816599623363C2980BYAPR02MB4710namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 129.75pt 1.0in 129.7pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">Hi Rob,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Thanks for providing the comments...<o:p></o:p></=
p>
<p class=3D"MsoPlainText"><a name=3D"_MailEndCompose"><o:p>&nbsp;</o:p></a>=
</p>
<p class=3D"MsoPlainText">&gt; -----Original Message-----</p>
<p class=3D"MsoPlainText">&gt; From: Rob Herring [mailto:robh@kernel.org]</=
p>
<p class=3D"MsoPlainText">&gt; Sent: Monday, January 21, 2019 9:19 PM</p>
<p class=3D"MsoPlainText">&gt; To: Nava kishore Manne &lt;navam@xilinx.com&=
gt;</p>
<p class=3D"MsoPlainText">&gt; Cc: mark.rutland@arm.com; Michal Simek &lt;m=
ichals@xilinx.com&gt;; Rajan Vaja</p>
<p class=3D"MsoPlainText">&gt; &lt;RAJANV@xilinx.com&gt;; linux-arm-kernel@=
lists.infradead.org; linux-</p>
<p class=3D"MsoPlainText">&gt; kernel@vger.kernel.org; devicetree@vger.kern=
el.org; Jolly Shah</p>
<p class=3D"MsoPlainText">&gt; &lt;JOLLYS@xilinx.com&gt;; chinnikishore369@=
gmail.com</p>
<p class=3D"MsoPlainText">&gt; Subject: Re: [PATCH v3 6/6] dt-bindings: fpg=
a: Add bindings for ZynqMP fpga</p>
<p class=3D"MsoPlainText">&gt; driver</p>
<p class=3D"MsoPlainText">&gt; </p>
<p class=3D"MsoPlainText">&gt; On Mon, Jan 21, 2019 at 11:08:35PM &#43;0530=
, Nava kishore Manne wrote:</p>
<p class=3D"MsoPlainText">&gt; &gt; Add documentation to describe Xilinx Zy=
nqMP fpga driver bindings.</p>
<p class=3D"MsoPlainText">&gt; &gt;</p>
<p class=3D"MsoPlainText">&gt; &gt; Signed-off-by: Nava kishore Manne &lt;<=
a href=3D"mailto:nava.manne@xilinx.com"><span style=3D"color:windowtext;tex=
t-decoration:none">nava.manne@xilinx.com</span></a>&gt;</p>
<p class=3D"MsoPlainText">&gt; &gt; ---</p>
<p class=3D"MsoPlainText">&gt; &gt; Changes for v3:</p>
<p class=3D"MsoPlainText">&gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; -Removed PCAP as a child node to the FW and Create=
d</p>
<p class=3D"MsoPlainText">&gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; an independent node since PCAP driver is a consume=
r</p>
<p class=3D"MsoPlainText">&gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; not a provider.</p>
<p class=3D"MsoPlainText">&gt; &gt;</p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; .../bindings/fpga/xlnx,zynqmp-pca=
p-fpga.txt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 13 &#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;</p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; 1 file changed, 13 insertions(&#4=
3;)</p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; create mode 100644</p>
<p class=3D"MsoPlainText">&gt; &gt; Documentation/devicetree/bindings/fpga/=
xlnx,zynqmp-pcap-fpga.txt</p>
<p class=3D"MsoPlainText">&gt; &gt;</p>
<p class=3D"MsoPlainText">&gt; &gt; diff --git</p>
<p class=3D"MsoPlainText">&gt; &gt; a/Documentation/devicetree/bindings/fpg=
a/xlnx,zynqmp-pcap-fpga.txt</p>
<p class=3D"MsoPlainText">&gt; &gt; b/Documentation/devicetree/bindings/fpg=
a/xlnx,zynqmp-pcap-fpga.txt</p>
<p class=3D"MsoPlainText">&gt; &gt; new file mode 100644</p>
<p class=3D"MsoPlainText">&gt; &gt; index 000000000000..1f6f58872311</p>
<p class=3D"MsoPlainText">&gt; &gt; --- /dev/null</p>
<p class=3D"MsoPlainText">&gt; &gt; &#43;&#43;&#43; b/Documentation/devicet=
ree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt</p>
<p class=3D"MsoPlainText">&gt; &gt; @@ -0,0 &#43;1,13 @@</p>
<p class=3D"MsoPlainText">&gt; &gt; &#43;Device Tree zynqmp-fpga bindings f=
or the Zynq Ultrascale&#43; MPSoC</p>
<p class=3D"MsoPlainText">&gt; &gt; &#43;controlled using ZynqMP SoC firmwa=
re interface For Bitstream</p>
<p class=3D"MsoPlainText">&gt; &gt; &#43;configuration on ZynqMp Soc uses p=
rocessor configuration</p>
<p class=3D"MsoPlainText">&gt; &gt; &#43;port(PCAP) to configure the progra=
mmable logic(PL) through PS by</p>
<p class=3D"MsoPlainText">&gt; &gt; &#43;using FW interface.</p>
<p class=3D"MsoPlainText">&gt; &gt; &#43;</p>
<p class=3D"MsoPlainText">&gt; &gt; &#43;Required properties:</p>
<p class=3D"MsoPlainText">&gt; &gt; &#43;- compatible: should contain &quot=
;xlnx,zynqmp-pcap-fpga&quot;</p>
<p class=3D"MsoPlainText">&gt; &gt; &#43;</p>
<p class=3D"MsoPlainText">&gt; &gt; &#43;Example:</p>
<p class=3D"MsoPlainText">&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; zyn=
qmp_pcap: pcap {</p>
<p class=3D"MsoPlainText">&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; compatible =3D &quot;xlnx,zynqmp-pcap-fpga&quot;;</p>
<p class=3D"MsoPlainText">&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<=
/p>
<p class=3D"MsoPlainText">&gt; </p>
<p class=3D"MsoPlainText">&gt; There's no need for a DT node. Just make the=
 firware driver create a platform</p>
<p class=3D"MsoPlainText">&gt; device for pcap.</p>
<p class=3D"MsoPlainText">&gt; </p>
<p class=3D"MsoPlainText"><span style=3D"color:black"><o:p>&nbsp;</o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">This driver being use=
d by the FPGA manager framework(fpga-region) to apply overlay's so this nod=
e is needed AFAIK.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">Please correct me if =
I am wrong...<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black"><o:p>&nbsp;</o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">Regards,<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">Navakishore</span><sp=
an style=3D"color:black">.<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_BYAPR02MB4710D1404CF2816599623363C2980BYAPR02MB4710namp_--
