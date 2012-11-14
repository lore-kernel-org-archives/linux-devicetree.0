From: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] MIPS: BCM63XX: enable serial through Device Tree
Date: Wed, 14 Nov 2012 13:17:17 +0100
Message-ID: <CAOiHx=kO2pY7N98mokYucFWU0E8VOns-CLgwyP+J9JgGO4=3LA@mail.gmail.com>
References: <1352638249-29298-1-git-send-email-jonas.gorski@gmail.com>
 <1352638249-29298-16-git-send-email-jonas.gorski@gmail.com>
 <50A1D6ED.50001@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5693148214925239167=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50A1D6ED.50001-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============5693148214925239167==
Content-Type: multipart/alternative; boundary=e89a8fb1f7542998e804ce7385a7

--e89a8fb1f7542998e804ce7385a7
Content-Type: text/plain; charset=UTF-8

On Nov 13, 2012 6:13 AM, "Stephen Warren" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>
> On 11/11/2012 05:50 AM, Jonas Gorski wrote:
> > Enable serial through Device Tree board files instead of legacy
> > board files.
>
> > diff --git a/arch/mips/bcm63xx/dts/96328avng.dts
b/arch/mips/bcm63xx/dts/96328avng.dts
>
> >       ubus@10000000 {
> >
> > +             serial@100 {
>
> Very minor nit: Why the blank line there?
I can't remember why. I'll remove it if, I'm not particularly attached to
it.


Jonas

--e89a8fb1f7542998e804ce7385a7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p>On Nov 13, 2012 6:13 AM, &quot;Stephen Warren&quot; &lt;<a href=3D"mailt=
o:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" target=3D"_blank">swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; On 11/11/2012 05:50 AM, Jonas Gorski wrote:<br>
&gt; &gt; Enable serial through Device Tree board files instead of legacy<b=
r>
&gt; &gt; board files.<br>
&gt;<br>
&gt; &gt; diff --git a/arch/mips/bcm63xx/dts/96328avng.dts b/arch/mips/bcm6=
3xx/dts/96328avng.dts<br>
&gt;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 ubus@10000000 {<br>
&gt; &gt;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial@100 {<br>
&gt;<br>
&gt; Very minor nit: Why the blank line there?</p>
<div>I can&#39;t remember why. I&#39;ll remove it if, I&#39;m not particula=
rly attached to it.</div>
<div><br></div><div><br></div><div>Jonas<br></div><p>
</p>

--e89a8fb1f7542998e804ce7385a7--

--===============5693148214925239167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5693148214925239167==--
