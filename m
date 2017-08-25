MIME-Version: 1.0
In-Reply-To: <20170825004943.GN5379@umbus.fritz.box>
References: <20170822230208.20987-1-robh@kernel.org>
	<20170822230208.20987-2-robh@kernel.org>
	<20170824020338.GV5379@umbus.fritz.box>
	<CAL_Jsq+0Njjs_PHBSD-B7W9YFzdfpB2ApBcBD=48+BoXQKv2pw@mail.gmail.com>
	<20170825004943.GN5379@umbus.fritz.box>
Date: Thu, 24 Aug 2017 20:58:14 -0500
Message-ID: <CAL_JsqJWEKfuaxU_sWDTwCNH3ffkqhcfu8xeLJ4JaPCZAdSZDQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] checks: add phandle with arg property checks
From: Rob Herring <robh@kernel.org>
Content-Type: multipart/alternative; boundary="001a1146f6082c13f705578a470b"
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a1146f6082c13f705578a470b
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 24, 2017 at 7:49 PM, David Gibson <david@gibson.dropbear.id.au>
wrote:
> On Thu, Aug 24, 2017 at 12:23:16PM -0500, Rob Herring wrote:
>> On Wed, Aug 23, 2017 at 9:03 PM, David Gibson
>> <david@gibson.dropbear.id.au> wrote:
>> > On Tue, Aug 22, 2017 at 06:02:06PM -0500, Rob Herring wrote:
>> >> Many common bindings follow the same pattern of client properties
>> >> containing a phandle and N arg cells where N is defined in the
provider
>> >> with a '#<specifier>-cells' property such as:
>> >>

[...]

>> However, the check here is not perfect because we could have
>> "<&phandle1 1 2>" when really it should be "<&phandle1 &phandle2
>> &phandle3>". We don't fail until we're checking the 2nd phandle.
>> That's why I added the "or bad phandle" and the cell # in the message
>> above. In the opposite case, we'd be silent. One thing that could be
>> done is double check things against the markers if they are present.
>
> Uh.. I don't really understand what you're getting at here.  We should
> be able to determine which of these cases it should be by the
> #whatever-cells at &phandle1.

If #whatever-cells is wrong, we can't tell immediately. Say it is 1 in the
above case, but really should be 2. Then on the 2nd loop iteration, we
think the value "2" is a phandle which will actually succeed in the lookup.
The failure we get is #whatever-cells couldn't be found (or maybe it is
found by luck, who knows) in the node pointed to by phandle 2. There's a
case of this in the kernel that I hit which took me a minute to realize
what was going on. The point is that if the property value has errors, we
may go into the weeds and the error reported may not be that precise.

Rob

--001a1146f6082c13f705578a470b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 24, 2017 at 7:49 PM, David Gibson &lt;<a href=
=3D"mailto:david@gibson.dropbear.id.au">david@gibson.dropbear.id.au</a>&gt;=
 wrote:<br>&gt; On Thu, Aug 24, 2017 at 12:23:16PM -0500, Rob Herring wrote=
:<br>&gt;&gt; On Wed, Aug 23, 2017 at 9:03 PM, David Gibson<br>&gt;&gt; &lt=
;<a href=3D"mailto:david@gibson.dropbear.id.au">david@gibson.dropbear.id.au=
</a>&gt; wrote:<br>&gt;&gt; &gt; On Tue, Aug 22, 2017 at 06:02:06PM -0500, =
Rob Herring wrote:<br>&gt;&gt; &gt;&gt; Many common bindings follow the sam=
e pattern of client properties<br>&gt;&gt; &gt;&gt; containing a phandle an=
d N arg cells where N is defined in the provider<br>&gt;&gt; &gt;&gt; with =
a &#39;#&lt;specifier&gt;-cells&#39; property such as:<br>&gt;&gt; &gt;&gt;=
<br><br><div>[...]</div><div><br></div><div>&gt;&gt; However, the check her=
e is not perfect because we could have<br>&gt;&gt; &quot;&lt;&amp;phandle1 =
1 2&gt;&quot; when really it should be &quot;&lt;&amp;phandle1 &amp;phandle=
2<br>&gt;&gt; &amp;phandle3&gt;&quot;. We don&#39;t fail until we&#39;re ch=
ecking the 2nd phandle.<br>&gt;&gt; That&#39;s why I added the &quot;or bad=
 phandle&quot; and the cell # in the message<br>&gt;&gt; above. In the oppo=
site case, we&#39;d be silent. One thing that could be<br>&gt;&gt; done is =
double check things against the markers if they are present.<br>&gt;<br>&gt=
; Uh.. I don&#39;t really understand what you&#39;re getting at here.=C2=A0=
 We should<br>&gt; be able to determine which of these cases it should be b=
y the<br>&gt; #whatever-cells at &amp;phandle1.<div><br></div><div>If #what=
ever-cells is wrong, we can&#39;t tell immediately. Say it is 1 in the abov=
e case, but really should be 2. Then on the 2nd loop iteration, we think th=
e value &quot;2&quot; is a phandle which will actually succeed in the looku=
p. The failure we get is #whatever-cells couldn&#39;t be found (or maybe it=
 is found by luck, who knows) in the node pointed to by phandle 2. There&#3=
9;s a case of this in the kernel that I hit which took me a minute to reali=
ze what was going on. The point is that if the property value has errors, w=
e may go into the weeds and the error reported may not be that precise.</di=
v><div><br></div><div>Rob</div><div><br></div></div></div>

--001a1146f6082c13f705578a470b--
