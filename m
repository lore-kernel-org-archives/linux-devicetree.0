From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC v2 6/9] arm/dt: add devicetree support to sp804 timer support
Date: Mon, 12 Dec 2011 17:29:17 -0700
Message-ID: <CACxGe6tY-kfwOCYk31UwUtfD33pGbc+OsL7UBq_aXFqVggeBww@mail.gmail.com>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca>
 <1323727329-4989-6-git-send-email-grant.likely@secretlab.ca>
 <4EE69446.2060009@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4424475833006134458=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EE69446.2060009-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============4424475833006134458==
Content-Type: multipart/alternative; boundary=20cf3020759077adb504b3ee5781

--20cf3020759077adb504b3ee5781
Content-Type: text/plain; charset=ISO-8859-1

On Dec 12, 2011 4:54 PM, "Rob Herring" <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Grant,
>
> On 12/12/2011 04:02 PM, Grant Likely wrote:
> > This patch adds support to the sp804 code for retrieving timer
> > configuration from the device tree.  sp804 channels can be used as
> > a clock event device or a clock source.
> >
> > Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> > ---
>
> [snip]
>
> > +
> > +     /*
> > +      * Figure out how to use this clock
> > +      *
> > +      * Note: This is kind of ugly since it requires linux-specific
> > +      * properties in the device tree so that Linux knows which sp804
> > +      * channels can be used as the clock source and the clock events
> > +      * trigger.  Something OS agnostic would be nicer, but it isn't
> > +      * obvious what that should look like.
> > +      */
> > +     if (of_get_property(node, "linux,clock-source", NULL)) {
> > +             __sp804_clocksource_init(base, node->full_name, clk);
> > +     } else if (of_get_property(node, "linux,clockevents-device",
NULL)) {
> > +             irq = irq_of_parse_and_map(node, 0);
> > +             __sp804_clockevents_init(base, irq, node->full_name, clk);
>
> At least in the case of highbank, there is no interrupt connected for
> 2nd timer in the h/w. So we could use that fact and presence of a clock
> for each timer to determine which to use. Some of the ARM boards have 2
> sp804's (4 timers) though and you could use any combination I think.
> Does it really matter which one is selected as long as it meets the
> needs of the OS? Yes, we could think of possible scenarios that don't
> work, but it's not likely to see a slew of new platforms with sp804's as
> new ARM core integrate the timers in. Although, bcmring is a bit strange
> setting up 2 clksrc's, but that doesn't really present a problem.

Interesting idea. I'll take a look at that tomorrow. It would be nice to be
rid of that hack. I was mostly concerned about sp804s getting clocked from
different sources and if there were any constraints I didn't understand.

> The fact that you split the timer to 2 nodes is a bit of Linux's needs
> defining the binding. The h/w block is a block with 2 timers. It's not
> really split. The block does have a single set of primecell ID registers
> at 0xfe0 for example.

Yeah, I kind of bodged it that way because it was easier. I realized it
probably should remain as one node when I wrote it. I'll take another look
tomorrow.

g.

--20cf3020759077adb504b3ee5781
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Dec 12, 2011 4:54 PM, &quot;Rob Herring&quot; &lt;<a href=3D"mailto:robh=
erring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Grant,<br>
&gt;<br>
&gt; On 12/12/2011 04:02 PM, Grant Likely wrote:<br>
&gt; &gt; This patch adds support to the sp804 code for retrieving timer<br=
>
&gt; &gt; configuration from the device tree. =A0sp804 channels can be used=
 as<br>
&gt; &gt; a clock event device or a clock source.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Grant Likely &lt;<a href=3D"mailto:grant.likely@se=
cretlab.ca">grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;<br>
&gt; &gt; Cc: Russell King &lt;<a href=3D"mailto:linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org">li=
nux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt;<br>
&gt; [snip]<br>
&gt;<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 /*<br>
&gt; &gt; + =A0 =A0 =A0* Figure out how to use this clock<br>
&gt; &gt; + =A0 =A0 =A0*<br>
&gt; &gt; + =A0 =A0 =A0* Note: This is kind of ugly since it requires linux=
-specific<br>
&gt; &gt; + =A0 =A0 =A0* properties in the device tree so that Linux knows =
which sp804<br>
&gt; &gt; + =A0 =A0 =A0* channels can be used as the clock source and the c=
lock events<br>
&gt; &gt; + =A0 =A0 =A0* trigger. =A0Something OS agnostic would be nicer, =
but it isn&#39;t<br>
&gt; &gt; + =A0 =A0 =A0* obvious what that should look like.<br>
&gt; &gt; + =A0 =A0 =A0*/<br>
&gt; &gt; + =A0 =A0 if (of_get_property(node, &quot;linux,clock-source&quot=
;, NULL)) {<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 __sp804_clocksource_init(base, node-&gt=
;full_name, clk);<br>
&gt; &gt; + =A0 =A0 } else if (of_get_property(node, &quot;linux,clockevent=
s-device&quot;, NULL)) {<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 irq =3D irq_of_parse_and_map(node, 0);<=
br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 __sp804_clockevents_init(base, irq, nod=
e-&gt;full_name, clk);<br>
&gt;<br>
&gt; At least in the case of highbank, there is no interrupt connected for<=
br>
&gt; 2nd timer in the h/w. So we could use that fact and presence of a cloc=
k<br>
&gt; for each timer to determine which to use. Some of the ARM boards have =
2<br>
&gt; sp804&#39;s (4 timers) though and you could use any combination I thin=
k.<br>
&gt; Does it really matter which one is selected as long as it meets the<br=
>
&gt; needs of the OS? Yes, we could think of possible scenarios that don&#3=
9;t<br>
&gt; work, but it&#39;s not likely to see a slew of new platforms with sp80=
4&#39;s as<br>
&gt; new ARM core integrate the timers in. Although, bcmring is a bit stran=
ge<br>
&gt; setting up 2 clksrc&#39;s, but that doesn&#39;t really present a probl=
em.</p>
<p>Interesting idea. I&#39;ll take a look at that tomorrow. It would be nic=
e to be rid of that hack. I was mostly concerned about sp804s getting clock=
ed from different sources and if there were any constraints I didn&#39;t un=
derstand.</p>

<p>&gt; The fact that you split the timer to 2 nodes is a bit of Linux&#39;=
s needs<br>
&gt; defining the binding. The h/w block is a block with 2 timers. It&#39;s=
 not<br>
&gt; really split. The block does have a single set of primecell ID registe=
rs<br>
&gt; at 0xfe0 for example.</p>
<p>Yeah, I kind of bodged it that way because it was easier. I realized it =
probably should remain as one node when I wrote it. I&#39;ll take another l=
ook tomorrow.</p>
<p>g.<br>
</p>

--20cf3020759077adb504b3ee5781--

--===============4424475833006134458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4424475833006134458==--
