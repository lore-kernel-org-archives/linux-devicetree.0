From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [U-Boot] [PATCH] fdt: Enhance dts/Makefile to be all things to
 all men
Date: Wed, 29 May 2013 22:33:29 -0700
Message-ID: <CAPnjgZ2R68L0-ShbpbkwurCS8suOD9uaH+cSJ=Z=-U3FExHOcw@mail.gmail.com>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
 <51A51A50.4050308@wwwdotorg.org>
 <CAPnjgZ04BKhQtpJct9tvN8rW5Wae+6fxxOOQDnEkmgrr-mAfwg@mail.gmail.com>
 <51A62F8D.9010208@wwwdotorg.org>
 <20130529213145.698353831A5@gemini.denx.de>
 <51A67EC1.2000208@wwwdotorg.org>
 <20130529223621.8B147383069@gemini.denx.de>
 <51A68A4C.4060505@wwwdotorg.org>
 <CAPnjgZ2_dR90CDtihSun3Yu7_i8TVpxn85XMFQRmzNJeRzDSmQ@mail.gmail.com>
 <51A6DF7C.30903@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6498915460649200778=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51A6DF7C.30903-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
Cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>, u-boot-review <u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============6498915460649200778==
Content-Type: multipart/alternative; boundary=047d7b3a989ca43fe604dde8d6fb

--047d7b3a989ca43fe604dde8d6fb
Content-Type: text/plain; charset=ISO-8859-1

Hi Stephen,

On Wed, May 29, 2013 at 10:11 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>wrote:

> On 05/29/2013 10:46 PM, Simon Glass wrote:
> > Hi,
> >
> > On Wed, May 29, 2013 at 4:07 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
> > <mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>> wrote:
> >
> >     On 05/29/2013 04:36 PM, Wolfgang Denk wrote:
> >     > Dear Stephen Warren,
> >     >
> >     > In message <51A67EC1.2000208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
> >     <mailto:51A67EC1.2000208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>> you wrote:
> >     >>
> >     >> To keep this process in check a bit, we could always pick a
> >     specific git
> >     >> commit or release version of dtc that each U-Boot version
> >     (release) will
> >     >> be allowed to assume. That will limit the number of times people
> >     need to
> >     >> update their locally-built dtc to at most once per U-Boot release.
> >     >> Hopefully much less often.
> >     >
> >     > I think this is broken by design, in several aspects.  First,
> U-Boot
> >     > is usually not the only user of DTC.  Second, assume you run a "git
> >     > bisect" over a U-Boot tree - would you really want to switch DTC
> in-
> >     > flight?
> >     >
> >     > Sorry, instead we should strive to be compatible to a reasonably
> old,
> >     > stable version of DTC, like we do for all other tools as well.  As
> >     > mentioned before - just because RHEL 5 ships an ancient version of
> -
> >     > say - "make" we will NOT start building this from the sources
> ourself.
> >     > This cannot be the way to go.
> >
> >     So the result of that is that we can never ever use new features in
> any
> >     tool, at least in any meaningful time-frame.
> >
> >     I think we need to differentiate between tools that are already
> stable
> >     and/or core to all aspects of the U-Boot build process (such as
> make),
> >     and tools that enable new features that are under development.
> >
> >     Clearly the U-Boot makefiles have to be fairly cautious in their use
> of
> >     any new make features, so that everyone with any reasonable version
> of
> >     make can build U-Boot.
> >
> >     However, when enabling a new feature, such as using device trees to
> >     configure U-Boot[1], for which tool support is new and evolving along
> >     with the feature itself, and which is only used on a very very few
> >     boards and even fewer SoCs right now within U-Boot, it seems entirely
> >     reasonable to demand that the people working on/with that new feature
> >     are aware that it's evolving, and that they may need to take a few
> extra
> >     steps to go out and get tools that support that new feature. No doubt
> >     once this feature has settled down a bit, and distros have pulled in
> >     newer versions of dtc, everthing will "just work" just like any other
> >     stable feature.
> >
> >     If you don't accept this, then we simply have to ban any include use
> in
> >     U-Boot; dtc -i isn't in distro-packaged versions of dtc, so we'd
> need to
> >     stop using that. We'd need to move *.dts into a single directory
> within
> >     U-Boot to work around that, or perhaps hard-coding relative include
> >     paths in *.dts might work. Similarly for the patches to support
> dtc+cpp
> >     usage, so we wouldn't be able to use named constants in DT files for
> >     many years, which would prevent sharing DT files with the kernel
> and/or
> >     any other standard repository of DT files, which are bound to use
> this
> >     feature.
> >
> >     [1] Which is very specifically a different feature than simply having
> >     U-Boot pass a DT to the Linux kernel during boot, and perhaps modify
> it
> >     a little, which clearly is not a new feature.
> >
> >
> > My patch:
> >
> > - doesn't require -i but uses it if available (ARCH_CPU_DTS works around
> > this)
>

I had to remove all sharp objects from the room half-way through reading
your email :-) Gosh, things aren't that bad!


>
> If we ever need to support a dtc that doesn't implement -i, then we
> always need to support that. So, there's no point using -i when it's
> available; we should simply have a single way of writing the *.dts files
> that doesn't ever assume dtc -i is available. Otherwise, there will be
> rampant inconsistency between different *.dts files; how they're
> written, the flow by which they're compiled, etc.
>
> In other words, we /always/ have to use "ARCH_CPU_DTS" in *.dts
> throughout the entire U-Boot source tree if we're to support not using
> dtc -i.
>

Well realistically at some point there will be a new dtc release, and
perhaps a year or so after that we can maybe start deprecating this and
requiring -i.


>
> > - honours #define, #include, etc.
> > - works with old and new versions of dtc
>
> If we are forced to rely only upon features in old versions of dtc, we
> specifically shouldn't allow use of features that will only work with
> newer dtc. If we don't actively enforce this rule, we haven't achieved
> the goal of not relying upon new versions of dtc.
>

As you know I'm uncomfortable with the idea of using CPP to do things that
I feel dtc should do for itself, but yes if dtc does not grow these
features, we have little choice. But as an example, both #include and
symbols can be syntactically very similar whether CPP is used or not.


>
> ...
> > However, let's say Tegra needs a newer dtc than 1.3. I wonder whether we
>
> This shouldn't be about whether a specific Soc's DT requires some
> feature or not. All the U-Boot *.dts should work the same way.
>
> > should just add a setting to tell U-Boot to not build the device tree at
> > all? The same U-Boot binary can run on many different board times, just
> > needing a different device tree.
>
> Unfortunately, that's not remotely true yet for any Tegra system at
> least; there's still a bunch of C code specific to each board. The
> amount is reducing as things get migrated to DT, but we certainly aren't
> there yet.
>

OK, but that wasn't quite my point....

>
> > Rather than pick one, we could just
> > pick none. Then if you want to use new features in dtc, just define
> > CONFIG_OF_NO_BUILD, or similar, and you can deal with the device tree
> > details yourself. MAKEALL/buildman will be happy with this.
>
> So you're saying: move the *.dts files out of U-Boot into some separate
> project. It'd be nice to do that; hopefully that separate project could
> be the one where the kernel's *.dts files move to. The big issue here is
> that the DT bindings U-Boot uses are often different to the standard
> bindings, so U-Boot currently contains U-Boot-specific *.dts so there
> wouldn't be much point moving them out of U-Boot into some common DT
> repository. Again, hopefully that's changing over time, but we're still
> not there yet.
>

a. I didn't say move them out of U-Boot
b. If there are differences between the U-Boot and kernel bindings, we
should fix that
c. My point was that 'building nothing' fudges the 'failed build' problem
and might be an acceptable compromise. Then Tegra can use the whiz-bang new
features without breaking the build.


>
> > Otherwise for now I think my patch is a reasonable compromise in terms
> > of features.
>
> It seems to be aimed specifically at enabling use of new dtc features
> when present. That seems to be specifically against Wolfgang's goal of
> not requiring new dtc features. There's no point allowing use of new dtc
> features if we can't require them, since there's no fallback when they
> aren't there to use.
>

My patch is specifically designed to provide a fallback when the are not
there to use. I'm not sure how feasible this is long term, but it works for
now.

I have no problem with including dtc in with U-Boot if that is the chosen
approach. It solves some problems. In fact my Kbuild patch set could make
that quite easy. However I do understand Wolfgang's POV that it is
philosophically a dangerous path.

You know my strong support for some sort of symbolic support in dtc, and I
share your frustration that it hasn't happened yet.

Is my patch better than what is there, or is it just making things worse?

Regards,
Simon

--047d7b3a989ca43fe604dde8d6fb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Stephen,<div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Wed, May 29, 2013 at 10:11 PM, Stephen Warren <span dir=3D"lt=
r">&lt;<a href=3D"mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" target=3D"_blank">swarren@w=
wwdotorg.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 05/29/2013 10:46 PM, Si=
mon Glass wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; On Wed, May 29, 2013 at 4:07 PM, Stephen Warren &lt;<a href=3D"mailto:=
swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org">swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org</a><br>
</div><div class=3D"im">&gt; &lt;mailto:<a href=3D"mailto:swarren@wwwdotorg=
.org">swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt; =A0 =A0 On 05/29/2013 04:36 PM, Wolfgang Denk wrote:<br>
&gt; =A0 =A0 &gt; Dear Stephen Warren,<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; In message &lt;<a href=3D"mailto:51A67EC1.2000208@wwwdoto=
rg.org">51A67EC1.2000208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org</a><br>
</div><div><div class=3D"h5">&gt; =A0 =A0 &lt;mailto:<a href=3D"mailto:51A6=
7EC1.2000208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org">51A67EC1.2000208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org</a>&gt;&gt; you =
wrote:<br>
&gt; =A0 =A0 &gt;&gt;<br>
&gt; =A0 =A0 &gt;&gt; To keep this process in check a bit, we could always =
pick a<br>
&gt; =A0 =A0 specific git<br>
&gt; =A0 =A0 &gt;&gt; commit or release version of dtc that each U-Boot ver=
sion<br>
&gt; =A0 =A0 (release) will<br>
&gt; =A0 =A0 &gt;&gt; be allowed to assume. That will limit the number of t=
imes people<br>
&gt; =A0 =A0 need to<br>
&gt; =A0 =A0 &gt;&gt; update their locally-built dtc to at most once per U-=
Boot release.<br>
&gt; =A0 =A0 &gt;&gt; Hopefully much less often.<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; I think this is broken by design, in several aspects. =A0=
First, U-Boot<br>
&gt; =A0 =A0 &gt; is usually not the only user of DTC. =A0Second, assume yo=
u run a &quot;git<br>
&gt; =A0 =A0 &gt; bisect&quot; over a U-Boot tree - would you really want t=
o switch DTC in-<br>
&gt; =A0 =A0 &gt; flight?<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; Sorry, instead we should strive to be compatible to a rea=
sonably old,<br>
&gt; =A0 =A0 &gt; stable version of DTC, like we do for all other tools as =
well. =A0As<br>
&gt; =A0 =A0 &gt; mentioned before - just because RHEL 5 ships an ancient v=
ersion of -<br>
&gt; =A0 =A0 &gt; say - &quot;make&quot; we will NOT start building this fr=
om the sources ourself.<br>
&gt; =A0 =A0 &gt; This cannot be the way to go.<br>
&gt;<br>
&gt; =A0 =A0 So the result of that is that we can never ever use new featur=
es in any<br>
&gt; =A0 =A0 tool, at least in any meaningful time-frame.<br>
&gt;<br>
&gt; =A0 =A0 I think we need to differentiate between tools that are alread=
y stable<br>
&gt; =A0 =A0 and/or core to all aspects of the U-Boot build process (such a=
s make),<br>
&gt; =A0 =A0 and tools that enable new features that are under development.=
<br>
&gt;<br>
&gt; =A0 =A0 Clearly the U-Boot makefiles have to be fairly cautious in the=
ir use of<br>
&gt; =A0 =A0 any new make features, so that everyone with any reasonable ve=
rsion of<br>
&gt; =A0 =A0 make can build U-Boot.<br>
&gt;<br>
&gt; =A0 =A0 However, when enabling a new feature, such as using device tre=
es to<br>
&gt; =A0 =A0 configure U-Boot[1], for which tool support is new and evolvin=
g along<br>
&gt; =A0 =A0 with the feature itself, and which is only used on a very very=
 few<br>
&gt; =A0 =A0 boards and even fewer SoCs right now within U-Boot, it seems e=
ntirely<br>
&gt; =A0 =A0 reasonable to demand that the people working on/with that new =
feature<br>
&gt; =A0 =A0 are aware that it&#39;s evolving, and that they may need to ta=
ke a few extra<br>
&gt; =A0 =A0 steps to go out and get tools that support that new feature. N=
o doubt<br>
&gt; =A0 =A0 once this feature has settled down a bit, and distros have pul=
led in<br>
&gt; =A0 =A0 newer versions of dtc, everthing will &quot;just work&quot; ju=
st like any other<br>
&gt; =A0 =A0 stable feature.<br>
&gt;<br>
&gt; =A0 =A0 If you don&#39;t accept this, then we simply have to ban any i=
nclude use in<br>
&gt; =A0 =A0 U-Boot; dtc -i isn&#39;t in distro-packaged versions of dtc, s=
o we&#39;d need to<br>
&gt; =A0 =A0 stop using that. We&#39;d need to move *.dts into a single dir=
ectory within<br>
&gt; =A0 =A0 U-Boot to work around that, or perhaps hard-coding relative in=
clude<br>
&gt; =A0 =A0 paths in *.dts might work. Similarly for the patches to suppor=
t dtc+cpp<br>
&gt; =A0 =A0 usage, so we wouldn&#39;t be able to use named constants in DT=
 files for<br>
&gt; =A0 =A0 many years, which would prevent sharing DT files with the kern=
el and/or<br>
&gt; =A0 =A0 any other standard repository of DT files, which are bound to =
use this<br>
&gt; =A0 =A0 feature.<br>
&gt;<br>
&gt; =A0 =A0 [1] Which is very specifically a different feature than simply=
 having<br>
&gt; =A0 =A0 U-Boot pass a DT to the Linux kernel during boot, and perhaps =
modify it<br>
&gt; =A0 =A0 a little, which clearly is not a new feature.<br>
&gt;<br>
&gt;<br>
&gt; My patch:<br>
&gt;<br>
&gt; - doesn&#39;t require -i but uses it if available (ARCH_CPU_DTS works =
around<br>
&gt; this)<br></div></div></blockquote><div><br></div><div style>I had to r=
emove all sharp objects from the room half-way through reading your email :=
-) Gosh, things aren&#39;t that bad!</div><div>=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div><div class=3D"h5">
<br>
</div></div>If we ever need to support a dtc that doesn&#39;t implement -i,=
 then we<br>
always need to support that. So, there&#39;s no point using -i when it&#39;=
s<br>
available; we should simply have a single way of writing the *.dts files<br=
>
that doesn&#39;t ever assume dtc -i is available. Otherwise, there will be<=
br>
rampant inconsistency between different *.dts files; how they&#39;re<br>
written, the flow by which they&#39;re compiled, etc.<br>
<br>
In other words, we /always/ have to use &quot;ARCH_CPU_DTS&quot; in *.dts<b=
r>
throughout the entire U-Boot source tree if we&#39;re to support not using<=
br>
dtc -i.<br></blockquote><div><br></div><div style>Well realistically at som=
e point there will be a new dtc release, and perhaps a year or so after tha=
t we can maybe start deprecating this and requiring -i.</div><div>=A0</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
&gt; - honours #define, #include, etc.<br>
&gt; - works with old and new versions of dtc<br>
<br>
</div>If we are forced to rely only upon features in old versions of dtc, w=
e<br>
specifically shouldn&#39;t allow use of features that will only work with<b=
r>
newer dtc. If we don&#39;t actively enforce this rule, we haven&#39;t achie=
ved<br>
the goal of not relying upon new versions of dtc.<br></blockquote><div><br>=
</div><div style>As you know I&#39;m uncomfortable with the idea of using C=
PP to do things that I feel dtc should do for itself, but yes if dtc does n=
ot grow these features, we have little choice. But as an example, both #inc=
lude and symbols can be syntactically very similar whether CPP is used or n=
ot.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
...<br>
<div class=3D"im">&gt; However, let&#39;s say Tegra needs a newer dtc than =
1.3. I wonder whether we<br>
<br>
</div>This shouldn&#39;t be about whether a specific Soc&#39;s DT requires =
some<br>
feature or not. All the U-Boot *.dts should work the same way.<br>
<div class=3D"im"><br>
&gt; should just add a setting to tell U-Boot to not build the device tree =
at<br>
&gt; all? The same U-Boot binary can run on many different board times, jus=
t<br>
&gt; needing a different device tree.<br>
<br>
</div>Unfortunately, that&#39;s not remotely true yet for any Tegra system =
at<br>
least; there&#39;s still a bunch of C code specific to each board. The<br>
amount is reducing as things get migrated to DT, but we certainly aren&#39;=
t<br>
there yet.<br></blockquote><div><br></div><div style>OK, but that wasn&#39;=
t quite my point....=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
&gt; Rather than pick one, we could just<br>
&gt; pick none. Then if you want to use new features in dtc, just define<br=
>
&gt; CONFIG_OF_NO_BUILD, or similar, and you can deal with the device tree<=
br>
&gt; details yourself. MAKEALL/buildman will be happy with this.<br>
<br>
</div>So you&#39;re saying: move the *.dts files out of U-Boot into some se=
parate<br>
project. It&#39;d be nice to do that; hopefully that separate project could=
<br>
be the one where the kernel&#39;s *.dts files move to. The big issue here i=
s<br>
that the DT bindings U-Boot uses are often different to the standard<br>
bindings, so U-Boot currently contains U-Boot-specific *.dts so there<br>
wouldn&#39;t be much point moving them out of U-Boot into some common DT<br=
>
repository. Again, hopefully that&#39;s changing over time, but we&#39;re s=
till<br>
not there yet.<br></blockquote><div><br></div><div style>a. I didn&#39;t sa=
y move them out of U-Boot</div><div style>b. If there are differences betwe=
en the U-Boot and kernel bindings, we should fix that</div><div style>
c. My point was that &#39;building nothing&#39; fudges the &#39;failed buil=
d&#39; problem and might be an acceptable compromise. Then Tegra can use th=
e whiz-bang new features without breaking the build.</div><div>=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">

<div class=3D"im"><br>
&gt; Otherwise for now I think my patch is a reasonable compromise in terms=
<br>
&gt; of features.<br>
<br>
</div>It seems to be aimed specifically at enabling use of new dtc features=
<br>
when present. That seems to be specifically against Wolfgang&#39;s goal of<=
br>
not requiring new dtc features. There&#39;s no point allowing use of new dt=
c<br>
features if we can&#39;t require them, since there&#39;s no fallback when t=
hey<br>
aren&#39;t there to use.<br>
</blockquote></div><br></div><div class=3D"gmail_extra" style>My patch is s=
pecifically designed to provide a fallback when the are not there to use. I=
&#39;m not sure how feasible this is long term, but it works for now.</div>
<div class=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" style=
>I have no problem with including dtc in with U-Boot if that is the chosen =
approach. It solves some problems. In fact my Kbuild patch set could make t=
hat quite easy. However I do understand Wolfgang&#39;s POV that it is philo=
sophically a dangerous path.</div>
<div class=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" style=
>You know my strong support for some sort of symbolic support in dtc, and I=
 share your frustration that it hasn&#39;t happened yet.</div><div class=3D=
"gmail_extra" style>
<br></div><div class=3D"gmail_extra" style>Is my patch better than what is =
there, or is it just making things worse?</div><div class=3D"gmail_extra" s=
tyle><br></div><div class=3D"gmail_extra" style>Regards,</div><div class=3D=
"gmail_extra" style>
Simon</div><div class=3D"gmail_extra" style>=A0</div></div>

--047d7b3a989ca43fe604dde8d6fb--

--===============6498915460649200778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6498915460649200778==--
