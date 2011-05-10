From: "James Baldwin" <James.Baldwin-x63MV80W0Hll57MIdRCFDg@public.gmane.org>
Subject: Multiple ic2 muxes in a device tree
Date: Tue, 10 May 2011 12:24:04 -0700
Message-ID: <1B936DB9F22546409EE7E2F50AE76BEE02031931@dragon.enablence.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0920172940117676181=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.

--===============0920172940117676181==
Content-class: urn:content-classes:message
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CC0F47.4F8CC9DA"

This is a multi-part message in MIME format.

------_=_NextPart_001_01CC0F47.4F8CC9DA
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I have tried many different combinations based on what I've been able to
find on

the internet over the last week and have reached a dead end.

 

I have the following i2c topology and specify the devices as follows:
Linux 2.6.38.5

only seems to recognize the devices connected directly to the i2c
controller when it boots.

 

I can add the muxes and lm73/m41st85 manually using the echo command
from the console:

"echo pca9547 0x70 > /sys/bus/12c/devices/i2c-2/new_device"

 

This tells me I have three prime candidates for potential issues.

1)  The device tree specification is incorrect

2)  The device tree processing is incorrect (It is 'appears'
correct in the /proc/devicetree hierarchy)

3)  The probing code for i2c devices doesn't currently traverse muxes
properly.

 

As validating the device tree should be the simplest to eliminate (and
is the part I'm

Directly involved with), I'd appreciate any Constructive comments on
solving this problem.

 

             |

i2c ctrl ----|

             |---lm73@0x49

             |

             |---24c02@0x54

             |

             |---pca9547@0x77---|

             |                  |-Chan 0---|---pca9547@0x70

             |                  |          |

             |                  |

             |                  |-Chan 1---|---pca9547@0x71

             |                  |          |

             |                  |

             |                  |-Chan 2---|---pca9547@0x72

             |                  |          |

             |                  |

             |                  |-Chan 3---|---pca9547@0x73

             |                  |          |

             |                  |

             |                  |-Chan 4---|---pca9547@0x74

             |                  |          |

             |                  |

             |                  |-Chan 5---|---pca9547@0x75

             |                  |          |

             |                  |

             |                  |-Chan 6---|---m41st85@0x68

             |                  |

             |                  |-Chan 7---|---lm73@0x48

             |                  |

 

i2c@3100 {

        #address-cells = <1>;

        #size-cells = <0>;

        cell-index = <1>;

        compatible = "fsl-i2c";

        reg = <0x3100 0x100>;

        interrupts = <15 0x8>;

        interrupt-parent = <&ipic>;

        dfsrr;

 

        temp-sensor@49 {

                compatible = "national,lm73";

                reg = <0x49>;

        };

 

        eeprom@54 {

                compatible = "at24,24c02";

                reg = <0x54>;

                pagesize = <4>;

        };

 

        mux@77 {

                #address-cells = <2>;

                #size-cells = <0>;

                compatible = "philips,pca9547";

                reg = <0x77>;

 

                mux@0,70 {

                        #address-cells = <2>;

                        #size-cells = <0>;

                        compatible = "philips,pca9547";

                        reg = <0 0x70>;

                };

 

                mux@0,71 {

                        #address-cells = <2>;

                        #size-cells = <0>;

                        compatible = "philips,pca9547";

                        reg = <1 0x71>;

                };

 

                mux@0,72 {

                        #address-cells = <2>;

                        #size-cells = <0>;

                        compatible = "philips,pca9547";

                        reg = <2 0x72>;

                };

 

                mux@0,73 {

                        #address-cells = <2>;

                        #size-cells = <0>;

                        compatible = "philips,pca9547";

                        reg = <3 0x73>;

                };

 

                mux@0,74 {

                        #address-cells = <2>;

                        #size-cells = <0>;

                        compatible = "philips,pca9547";

                        reg = <4 0x74>;

                };

 

                mux@0,75 {

                        #address-cells = <2>;

                        #size-cells = <0>;

                        compatible = "philips,pca9547";

                        reg = <0 0x75>;

                };

 

                temp-sensor@7,48 {

                        compatible = "national,lm73";

                        reg = <7 0x48 >;

                };

 

                rtc@6,68 {

                        compatible = "stm,m41st85";

                        reg = <6 0x68>;

                };

        };

 

};

 

 

Thanks,

Jim Baldwin




------_=_NextPart_001_01CC0F47.4F8CC9DA
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 14 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Lucida Console";
	panose-1:2 11 6 9 4 5 4 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1554661001;
	mso-list-type:hybrid;
	mso-list-template-ids:-1674641972 -1192350566 67698713 67698715 =
67698703 67698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-text:"%1\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.25in;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:1.75in;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.25in;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.75in;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:3.25in;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:3.75in;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.25in;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:4.75in;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue =
vlink=3Dpurple><!--ppd1000038--><div class=3DWordSection1><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida Console"'>I have =
tried many different combinations based on what I&#8217;ve been able to =
find on<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'>the internet over the last week =
and have reached a dead end.<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'>I have the following i2c topology =
and specify the devices as follows: Linux =
2.6.38.5<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'>only seems to recognize the =
devices connected directly to the i2c controller when it =
boots.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida Console"'>I can add =
the muxes and lm73/m41st85 manually using the echo command from the =
console:<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'>&#8220;echo pca9547 0x70 &gt; =
/sys/bus/12c/devices/i2c-2/new_device&#8221;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'>This tells me I have three prime =
candidates for potential issues.<o:p></o:p></span></p><p =
class=3DMsoListParagraph =
style=3D'margin-left:.75in;text-indent:-.25in;mso-list:l0 level1 =
lfo1'><![if !supportLists]><span style=3D'font-family:"Lucida =
Console"'><span style=3D'mso-list:Ignore'>1)<span style=3D'font:7.0pt =
"Times New Roman"'>&nbsp; </span></span></span><![endif]><span =
style=3D'font-family:"Lucida Console"'>The device tree specification is =
incorrect<o:p></o:p></span></p><p class=3DMsoListParagraph =
style=3D'margin-left:.75in;text-indent:-.25in;mso-list:l0 level1 =
lfo1'><![if !supportLists]><span style=3D'font-family:"Lucida =
Console"'><span style=3D'mso-list:Ignore'>2)<span style=3D'font:7.0pt =
"Times New Roman"'>&nbsp; </span></span></span><![endif]><span =
style=3D'font-family:"Lucida Console"'>The device tree processing is =
incorrect (It is &#8216;appears&#8217;<br>correct in the =
/proc/devicetree hierarchy)<o:p></o:p></span></p><p =
class=3DMsoListParagraph =
style=3D'margin-left:.75in;text-indent:-.25in;mso-list:l0 level1 =
lfo1'><![if !supportLists]><span style=3D'font-family:"Lucida =
Console"'><span style=3D'mso-list:Ignore'>3)<span style=3D'font:7.0pt =
"Times New Roman"'>&nbsp; </span></span></span><![endif]><span =
style=3D'font-family:"Lucida Console"'>The probing code for i2c devices =
doesn&#8217;t currently traverse muxes properly.<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'>As validating the device tree =
should be the simplest to eliminate (and is the part =
I&#8217;m<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'>Directly involved with), =
I&#8217;d appreciate any Constructive comments on solving this =
problem.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'>i2c ctrl =
----|<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |---lm73@0x49<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |---24c02@0x54<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |---pca9547@0x77---|<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-Chan =
0---|---pca9547@0x70<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-Chan =
1---|---pca9547@0x71<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-Chan =
2---|---pca9547@0x72<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; =
&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-Chan =
3---|---pca9547@0x73<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-Chan =
4---|---pca9547@0x74<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<o:p></o:p></span></p><p=
 class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-Chan =
5---|---pca9547@0x75<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-Chan =
6---|---m41st85@0x68<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-Chan =
7---|---lm73@0x48<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'>i2c@3100 =
{<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D =
&lt;1&gt;;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D =
&lt;0&gt;;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cell-index =3D =
&lt;1&gt;;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D =
&quot;fsl-i2c&quot;;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x3100 =
0x100&gt;;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupts =3D =
&lt;15 0x8&gt;;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupt-parent =
=3D &lt;&amp;ipic&gt;;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
dfsrr;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; temp-sensor@49 =
{<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D =
&quot;national,lm73&quot;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D =
&lt;0x49&gt;;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
};<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eeprom@54 =
{<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;compatible =3D =
&quot;at24,24c02&quot;;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D =
&lt;0x54&gt;;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; pagesize =3D =
&lt;4&gt;;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
};<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mux@77 =
{<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D =
&lt;2&gt;;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D =
&lt;0&gt;;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D =
&quot;philips,pca9547&quot;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reg =3D =
&lt;0x77&gt;;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; mux@0,70 {<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; #address-cells =3D &lt;2&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; compatible =3D &quot;philips,pca9547&quot;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; reg =3D &lt;0 0x70&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; mux@0,71 {<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; #address-cells =3D &lt;2&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; compatible =3D &quot;philips,pca9547&quot;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; reg =3D &lt;1 0x71&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; mux@0,72 {<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; #address-cells =3D &lt;2&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; compatible =3D &quot;philips,pca9547&quot;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; reg =3D &lt;2 0x72&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; mux@0,73 {<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;#address-cells =3D &lt;2&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; compatible =3D &quot;philips,pca9547&quot;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; reg =3D &lt;3 0x73&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; mux@0,74 {<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; #address-cells =3D &lt;2&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; compatible =3D &quot;philips,pca9547&quot;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; reg =3D &lt;4 0x74&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; mux@0,75 {<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; #address-cells =3D &lt;2&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; compatible =3D &quot;philips,pca9547&quot;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; reg =3D &lt;0 0x75&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; temp-sensor@7,48 {<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; compatible =3D &quot;national,lm73&quot;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;reg =3D &lt;7 0x48 &gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; rtc@6,68 {<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; compatible =3D &quot;stm,m41st85&quot;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; reg =3D &lt;6 0x68&gt;;<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
};<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'>};<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida =
Console"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Lucida Console"'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Lucida Console"'>Jim =
Baldwin<o:p></o:p></span></p></div><BR><BR><DIV align=3Dleft><SPAN =
class=3DApple-style-span style=3D"WORD-SPACING: 0px; FONT: italic 13px =
arial; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; =
WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: collapse; =
orphans: 2; widows: 2; webkit-border-horizontal-spacing: 0px; =
webkit-border-vertical-spacing: 0px; webkit-text-decorations-in-effect: =
none; webkit-text-size-adjust: auto; webkit-text-stroke-width: =
0"><STRONG>NOTICE:</STRONG><FONT color=3D#808080 size=3D2><FONT =
color=3D#808080 size=3D2>This email and any files transmitted with it =
are Enablence confidential and intended solely for the use of the =
individual or entity to whom they are addressed. If you have received =
this email in error please notify the sender. This message contains =
Enablence confidential information and is intended only for the =
individual named. If you are not the named addressee you should not =
disseminate, distribute or copy this e-mail. Please notify the sender =
immediately by e-mail if you have received this e-mail by mistake and =
delete this e-mail from your system. If you are not the intended =
recipient you are notified that disclosing, copying, distributing or =
taking any action in reliance on the contents of this information is =
strictly prohibited.</FONT></FONT></SPAN></DIV></body></html>
------_=_NextPart_001_01CC0F47.4F8CC9DA--

--===============0920172940117676181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0920172940117676181==--
