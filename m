From: viresh kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: SPEAr600: Add device-tree support to SPEAr600 boards
Date: Tue, 27 Mar 2012 19:14:27 +0530
Message-ID: <CAOh2x==7gNt2Jb3-EHz9-R1pTy6zL93FmUmTBMdpYUnW3F=9Uw@mail.gmail.com>
References: <1331650032-15274-1-git-send-email-sr@denx.de>
 <201203271115.07805.arnd@arndb.de> <4F71A42C.3090108@st.com>
 <201203271159.35306.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1731826494041055716=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203271159.35306.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============1731826494041055716==
Content-Type: multipart/alternative; boundary=f46d0418255888547c04bc39b0c1

--f46d0418255888547c04bc39b0c1
Content-Type: text/plain; charset=ISO-8859-1

On Mar 27, 2012 7:07 PM, "Arnd Bergmann" <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>
> On Tuesday 27 March 2012, Viresh Kumar wrote:
> > On 3/27/2012 4:45 PM, Arnd Bergmann wrote:
> > > On Tuesday 27 March 2012, Viresh Kumar wrote:
> > > The normal way is to turn around the logic so you don't have to
include this test
> > > at all. Just have one soc-specific init_machine and map_io function,
that calls
> > > both soc-specific and shared soc functions, e.g.
> >
> > But with that, i need multiple DT_MACHINE_START(). Isn't it?
> > Is this advisable?
>
> Having one DT_MACHINE_START per soc is ok if it helps you. Of course if
you
> have multiple ones that are basically identical, it's simpler to just
> combine them.

That's what i have done in V1. And then only i came to
The first problem i mentioned.

> > > In case of the clocks, I think you could already merge all the
clk_lookup
> > > arrays into one, which would result in a larger kernel image but
should
> > > do no harm otherwise.
> >
> > Actually we can't do it. :(
> > If i boot 300 then i will also get clocks of 310 and 320 in my clock
list.
> > And once i go through this clock list to create clock tree (parent-child
> > relationship), i will try to access hardware registers of 310 & 320,
> > which are just not valid for 300. Kernel Crash!!
>
> Ok, I see. BTW, have you tried what I first recommended to you, which is
> to check the compatible property of the clock node instead of the machine?

I haven't.

> Obviously that only works when you initialize the clocks from init_early()
> instead of from map_io(), but I think that would be the cleanest choice
> if you want to have single function with run-time dependencies.

But then why not use machine_init() for doing this too.

--
Viresh

--f46d0418255888547c04bc39b0c1
Content-Type: text/html; charset=ISO-8859-1

<p><br>
On Mar 27, 2012 7:07 PM, &quot;Arnd Bergmann&quot; &lt;<a href="mailto:arnd-r2nGTMty4D4@public.gmane.org">arnd-r2nGTMty4D4@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tuesday 27 March 2012, Viresh Kumar wrote:<br>
&gt; &gt; On 3/27/2012 4:45 PM, Arnd Bergmann wrote:<br>
&gt; &gt; &gt; On Tuesday 27 March 2012, Viresh Kumar wrote:<br>
&gt; &gt; &gt; The normal way is to turn around the logic so you don&#39;t have to include this test<br>
&gt; &gt; &gt; at all. Just have one soc-specific init_machine and map_io function, that calls<br>
&gt; &gt; &gt; both soc-specific and shared soc functions, e.g.<br>
&gt; &gt;<br>
&gt; &gt; But with that, i need multiple DT_MACHINE_START(). Isn&#39;t it?<br>
&gt; &gt; Is this advisable?<br>
&gt;<br>
&gt; Having one DT_MACHINE_START per soc is ok if it helps you. Of course if you<br>
&gt; have multiple ones that are basically identical, it&#39;s simpler to just<br>
&gt; combine them.</p>
<p>That&#39;s what i have done in V1. And then only i came to<br>
The first problem i mentioned.</p>
<p>&gt; &gt; &gt; In case of the clocks, I think you could already merge all the clk_lookup<br>
&gt; &gt; &gt; arrays into one, which would result in a larger kernel image but should<br>
&gt; &gt; &gt; do no harm otherwise.<br>
&gt; &gt;<br>
&gt; &gt; Actually we can&#39;t do it. :(<br>
&gt; &gt; If i boot 300 then i will also get clocks of 310 and 320 in my clock list.<br>
&gt; &gt; And once i go through this clock list to create clock tree (parent-child<br>
&gt; &gt; relationship), i will try to access hardware registers of 310 &amp; 320,<br>
&gt; &gt; which are just not valid for 300. Kernel Crash!!<br>
&gt;<br>
&gt; Ok, I see. BTW, have you tried what I first recommended to you, which is<br>
&gt; to check the compatible property of the clock node instead of the machine?</p>
<p>I haven&#39;t.</p>
<p>&gt; Obviously that only works when you initialize the clocks from init_early()<br>
&gt; instead of from map_io(), but I think that would be the cleanest choice<br>
&gt; if you want to have single function with run-time dependencies.</p>
<p>But then why not use machine_init() for doing this too.</p>
<p>--<br>
Viresh</p>

--f46d0418255888547c04bc39b0c1--

--===============1731826494041055716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1731826494041055716==--
