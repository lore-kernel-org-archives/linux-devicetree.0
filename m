From: Michal Bachraty <michal.bachraty-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] clk: add si5351 i2c common clock driver
Date: Tue, 9 Apr 2013 10:34:29 +0200
Message-ID: <CAAfrEwZPx69uAtUATHS-HAYHMeD53HWQPLsr136zE4nqFQrFmA@mail.gmail.com>
References: <fa.WZVD0OA/Ooajh6BejiLf7TwBsJ8@ifi.uio.no>
 <fa.iIqrS6k+Vb5mLqAeL7iTsNsbKyo@ifi.uio.no>
 <fa.L0b41q+fYFZG0WOFTGKLhn/cGPA@ifi.uio.no>
 <fa.XCuSmq9Zwp3+wqFO8NEjpwADVZ0@ifi.uio.no>
 <6e120226-8a3c-415f-90f2-c44e7b6bbf96@googlegroups.com>
 <5149E85E.90701@gmail.com>
 <CABJ1b_T2x-DkTuYZGLBiedFRWcgYbcN3VCorN2nm3Y54A--wyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3020334606861672192=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CABJ1b_T2x-DkTuYZGLBiedFRWcgYbcN3VCorN2nm3Y54A--wyw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dom Cobley <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rabeeh Khoury <rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>, fa.linux.kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============3020334606861672192==
Content-Type: multipart/alternative; boundary=047d7b10c8affedd8904d9e96bbc

--047d7b10c8affedd8904d9e96bbc
Content-Type: text/plain; charset=ISO-8859-1

Hi Sebastian,

I posted patch for gap-less tuning. It is based on v5 of your driver.  This
patch was tested for tuning with 1ppm clock step.

Best,
Michal.


On Mon, Mar 25, 2013 at 12:54 PM, Sebastian Hesselbarth <
sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Wed, Mar 20, 2013 at 5:48 PM, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On 20.03.2013 14:55, michal.bachraty-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> >> Thanks for writing this driver! I have tested your si5351 clock
> >> driver and his tuning capabilities. It works well, it generates
> >> proper clock frequency, but when new frequency is generated, little
> >> clock gap (1ms) is generated. Si5351 datasheet and WP claims, clock
> >> tuning can be without gaps -
> >>
> http://www.silabs.com/Support%20Documents/TechnicalDocs/Si5350-51-Frequency-Shifting-WP.pdf
> >>
> >> I made some tests with Si5351A chip and I found that when tuning touch
> >> only Multisynth registers, it can tune without gaps. There is no need
> >> for soft PLL reset. I found also, accessing Multisynth registers is not
> >> atomic, so there can be another frequency at output, while not all
> >> registers are written. Writing only to one register seems to be atomic.
>
> Michael,
>
> if you don't configure the clock output to modify the pll, changing output
> frequency will not alter pll config and there will be no reset of pll.
>
> > Yeah, but limiting possible changes to the PLLs to one single register
> > also means that you cannot offer to generate all the frequencies any
> > more. What could probably be done is refine the algorithm so that it
> > stays 'as close as possible' to the former values, but I'm not sure how
> > much work that implies.
> >
> > Can you provide a patch against Sebastian's v3 to do that? Then it can
> > be cleanly applied on top of the driver later.
>
> Ack. Feel free to post a patch on top of v4 now.
>
> Sebastian
>

--047d7b10c8affedd8904d9e96bbc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Sebastian,<br><br></div>I posted patch for ga=
p-less tuning. It is based on v5 of your driver.=A0 This patch was tested f=
or tuning with 1ppm clock step.<br><br></div><div>Best,<br></div>Michal.<br=
>
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon,=
 Mar 25, 2013 at 12:54 PM, Sebastian Hesselbarth <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">sebastian.=
hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, Mar 20, 2013 at 5:=
48 PM, Daniel Mack &lt;<a href=3D"mailto:zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
</a>&gt; wrote:<br>

&gt; On 20.03.2013 14:55, <a href=3D"mailto:michal.bachraty-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">mich=
al.bachraty-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a> wrote:<br>
&gt;&gt; Thanks for writing this driver! I have tested your si5351 clock<br=
>
&gt;&gt; driver and his tuning capabilities. It works well, it generates<br=
>
&gt;&gt; proper clock frequency, but when new frequency is generated, littl=
e<br>
&gt;&gt; clock gap (1ms) is generated. Si5351 datasheet and WP claims, cloc=
k<br>
&gt;&gt; tuning can be without gaps -<br>
&gt;&gt; <a href=3D"http://www.silabs.com/Support%20Documents/TechnicalDocs=
/Si5350-51-Frequency-Shifting-WP.pdf" target=3D"_blank">http://www.silabs.c=
om/Support%20Documents/TechnicalDocs/Si5350-51-Frequency-Shifting-WP.pdf</a=
><br>

&gt;&gt;<br>
&gt;&gt; I made some tests with Si5351A chip and I found that when tuning t=
ouch<br>
&gt;&gt; only Multisynth registers, it can tune without gaps. There is no n=
eed<br>
&gt;&gt; for soft PLL reset. I found also, accessing Multisynth registers i=
s not<br>
&gt;&gt; atomic, so there can be another frequency at output, while not all=
<br>
&gt;&gt; registers are written. Writing only to one register seems to be at=
omic.<br>
<br>
</div>Michael,<br>
<br>
if you don&#39;t configure the clock output to modify the pll, changing out=
put<br>
frequency will not alter pll config and there will be no reset of pll.<br>
<div class=3D"im"><br>
&gt; Yeah, but limiting possible changes to the PLLs to one single register=
<br>
&gt; also means that you cannot offer to generate all the frequencies any<b=
r>
&gt; more. What could probably be done is refine the algorithm so that it<b=
r>
&gt; stays &#39;as close as possible&#39; to the former values, but I&#39;m=
 not sure how<br>
&gt; much work that implies.<br>
&gt;<br>
&gt; Can you provide a patch against Sebastian&#39;s v3 to do that? Then it=
 can<br>
&gt; be cleanly applied on top of the driver later.<br>
<br>
</div>Ack. Feel free to post a patch on top of v4 now.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Sebastian<br>
</font></span></blockquote></div><br></div>

--047d7b10c8affedd8904d9e96bbc--

--===============3020334606861672192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3020334606861672192==--
