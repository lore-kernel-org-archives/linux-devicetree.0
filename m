From: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Subject: Re: [PATCH] openrisc: Add DTS and defconfig for DE0-Nano
Date: Sun, 17 Nov 2013 15:46:20 +0200
Message-ID: <CADzBsGPPQhPEtxN1B9q9PP6eXpd3XB2nS9Oro7Bv+V8OiBL6BQ@mail.gmail.com>
References: <1384029451-16555-1-git-send-email-geert@linux-m68k.org>
	<5285EE5A.1070202@southpole.se>
	<20131116084505.GA26233@chokladfabriken.org>
	<CAKaYPCNOLbX09Pqx7Zn=ivO++iBZMbBpu-pMjNgayVDBrBX1yQ@mail.gmail.com>
	<528881F6.3090902@southpole.se>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7685081224710807049=="
Return-path: <linux-bounces@lists.openrisc.net>
In-Reply-To: <528881F6.3090902@southpole.se>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Jonas Bonn <jonas@southpole.se>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Mehall <contact@kevinmehall.net>, linux <linux@lists.openrisc.net>
List-Id: devicetree@vger.kernel.org

--===============7685081224710807049==
Content-Type: multipart/alternative; boundary=047d7b10cb750b16b804eb5fa864

--047d7b10cb750b16b804eb5fa864
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 17, 2013 at 10:44 AM, Jonas Bonn <jonas@southpole.se> wrote:

> 2013/11/16 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
>>
>>> On Fri, Nov 15, 2013 at 10:50:18AM +0100, Jonas Bonn wrote:
>>>
>>>> +
>>>>> +    i2c0: ocores@a0000000 {
>>>>> +            #address-cells = <1>;
>>>>> +            #size-cells = <0>;
>>>>> +            compatible = "opencores,i2c-ocores";
>>>>>
>>>> Version number needed.  OpenCores wanted "projectname-rtlsvn###"
>>>> where ### is the SVN commit number of the RTL directory in the
>>>> project's source repository.
>>>>
>>>>  That will also require a change to the driver.
>>>
>> The drivers in question aren't upstream so it's not a big deal. Making a
> change to get sane revisioning would be worth it anyway.
>
>
Actually, the i2c driver *is* upstream.
The remark was mostly meant as a reminder of that.

Stefan

--047d7b10cb750b16b804eb5fa864
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
un, Nov 17, 2013 at 10:44 AM, Jonas Bonn <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jonas@southpole.se" target=3D"_blank">jonas@southpole.se</a>&gt; wrot=
e:</span><br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;padding=
-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-l=
eft-style:solid"><div class=3D"im"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204=
,204);border-left-width:1px;border-left-style:solid">

2013/11/16 Stefan Kristiansson &lt;<a href=3D"mailto:stefan.kristiansson@sa=
unalahti.fi" target=3D"_blank">stefan.kristiansson@<u></u>saunalahti.fi</a>=
&gt;<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;padding=
-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-l=
eft-style:solid">
On Fri, Nov 15, 2013 at 10:50:18AM +0100, Jonas Bonn wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;padding=
-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-l=
eft-style:solid"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-w=
idth:1px;border-left-style:solid">

+<br>
+ =A0 =A0i2c0: ocores@a0000000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D &lt;1&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0#size-cells =3D &lt;0&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0compatible =3D &quot;opencores,i2c-ocores&quot;;<b=
r>
</blockquote>
Version number needed. =A0OpenCores wanted &quot;projectname-rtlsvn###&quot=
;<br>
where ### is the SVN commit number of the RTL directory in the<br>
project&#39;s source repository.<br>
<br>
</blockquote>
That will also require a change to the driver.<br>
</blockquote></blockquote></div>
The drivers in question aren&#39;t upstream so it&#39;s not a big deal. Mak=
ing a change to get sane revisioning would be worth it anyway.<div class=3D=
"im"><br>

</div></blockquote><div>=A0</div><div>Actually, the i2c driver *is* upstrea=
m.</div><div>The remark was mostly meant as a reminder of that.</div><div>=
=A0</div><div>Stefan</div></div></div></div>

--047d7b10cb750b16b804eb5fa864--

--===============7685081224710807049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============7685081224710807049==--
