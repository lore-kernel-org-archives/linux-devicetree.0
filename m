From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [U-Boot] [PATCH] fdt: Enhance dts/Makefile to be all things to
 all men
Date: Wed, 29 May 2013 21:46:14 -0700
Message-ID: <CAPnjgZ2_dR90CDtihSun3Yu7_i8TVpxn85XMFQRmzNJeRzDSmQ@mail.gmail.com>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
 <51A51A50.4050308@wwwdotorg.org>
 <CAPnjgZ04BKhQtpJct9tvN8rW5Wae+6fxxOOQDnEkmgrr-mAfwg@mail.gmail.com>
 <51A62F8D.9010208@wwwdotorg.org>
 <20130529213145.698353831A5@gemini.denx.de>
 <51A67EC1.2000208@wwwdotorg.org>
 <20130529223621.8B147383069@gemini.denx.de>
 <51A68A4C.4060505@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1163150110641234791=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51A68A4C.4060505-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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

--===============1163150110641234791==
Content-Type: multipart/alternative; boundary=089e0149bb02a8756504dde82d4b

--089e0149bb02a8756504dde82d4b
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Wed, May 29, 2013 at 4:07 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>wrote:

> On 05/29/2013 04:36 PM, Wolfgang Denk wrote:
> > Dear Stephen Warren,
> >
> > In message <51A67EC1.2000208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> you wrote:
> >>
> >> To keep this process in check a bit, we could always pick a specific git
> >> commit or release version of dtc that each U-Boot version (release) will
> >> be allowed to assume. That will limit the number of times people need to
> >> update their locally-built dtc to at most once per U-Boot release.
> >> Hopefully much less often.
> >
> > I think this is broken by design, in several aspects.  First, U-Boot
> > is usually not the only user of DTC.  Second, assume you run a "git
> > bisect" over a U-Boot tree - would you really want to switch DTC in-
> > flight?
> >
> > Sorry, instead we should strive to be compatible to a reasonably old,
> > stable version of DTC, like we do for all other tools as well.  As
> > mentioned before - just because RHEL 5 ships an ancient version of -
> > say - "make" we will NOT start building this from the sources ourself.
> > This cannot be the way to go.
>
> So the result of that is that we can never ever use new features in any
> tool, at least in any meaningful time-frame.
>
> I think we need to differentiate between tools that are already stable
> and/or core to all aspects of the U-Boot build process (such as make),
> and tools that enable new features that are under development.
>
> Clearly the U-Boot makefiles have to be fairly cautious in their use of
> any new make features, so that everyone with any reasonable version of
> make can build U-Boot.
>
> However, when enabling a new feature, such as using device trees to
> configure U-Boot[1], for which tool support is new and evolving along
> with the feature itself, and which is only used on a very very few
> boards and even fewer SoCs right now within U-Boot, it seems entirely
> reasonable to demand that the people working on/with that new feature
> are aware that it's evolving, and that they may need to take a few extra
> steps to go out and get tools that support that new feature. No doubt
> once this feature has settled down a bit, and distros have pulled in
> newer versions of dtc, everthing will "just work" just like any other
> stable feature.
>
> If you don't accept this, then we simply have to ban any include use in
> U-Boot; dtc -i isn't in distro-packaged versions of dtc, so we'd need to
> stop using that. We'd need to move *.dts into a single directory within
> U-Boot to work around that, or perhaps hard-coding relative include
> paths in *.dts might work. Similarly for the patches to support dtc+cpp
> usage, so we wouldn't be able to use named constants in DT files for
> many years, which would prevent sharing DT files with the kernel and/or
> any other standard repository of DT files, which are bound to use this
> feature.
>
> [1] Which is very specifically a different feature than simply having
> U-Boot pass a DT to the Linux kernel during boot, and perhaps modify it
> a little, which clearly is not a new feature.
>

My patch:

- doesn't require -i but uses it if available (ARCH_CPU_DTS works around
this)
- honours #define, #include, etc.
- works with old and new versions of dtc
- uses -Ulinux which we are thinking might be better done another way

Let's not throw the baby out with the bathwater. I have no problem with
updating my dtc as needed, but it would certainly be nice if U-Boot didn't
require this.

However, let's say Tegra needs a newer dtc than 1.3. I wonder whether we
should just add a setting to tell U-Boot to not build the device tree at
all? The same U-Boot binary can run on many different board times, just
needing a different device tree. Rather than pick one, we could just pick
none. Then if you want to use new features in dtc, just define
CONFIG_OF_NO_BUILD, or similar, and you can deal with the device tree
details yourself. MAKEALL/buildman will be happy with this.

Otherwise for now I think my patch is a reasonable compromise in terms of
features.

Regards,
Simon

--089e0149bb02a8756504dde82d4b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Wed, May 29, 2013 at 4:07 PM, Stephen Warren <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" target=3D"_blank">swarren@wwwdotorg.=
org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On 05/29/2013 04:36 PM, Wolfgang Denk wr=
ote:<br>

&gt; Dear Stephen Warren,<br>
&gt;<br>
&gt; In message &lt;<a href=3D"mailto:51A67EC1.2000208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org">51A67=
EC1.2000208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org</a>&gt; you wrote:<br>
&gt;&gt;<br>
&gt;&gt; To keep this process in check a bit, we could always pick a specif=
ic git<br>
&gt;&gt; commit or release version of dtc that each U-Boot version (release=
) will<br>
&gt;&gt; be allowed to assume. That will limit the number of times people n=
eed to<br>
&gt;&gt; update their locally-built dtc to at most once per U-Boot release.=
<br>
&gt;&gt; Hopefully much less often.<br>
&gt;<br>
&gt; I think this is broken by design, in several aspects. =A0First, U-Boot=
<br>
&gt; is usually not the only user of DTC. =A0Second, assume you run a &quot=
;git<br>
&gt; bisect&quot; over a U-Boot tree - would you really want to switch DTC =
in-<br>
&gt; flight?<br>
&gt;<br>
&gt; Sorry, instead we should strive to be compatible to a reasonably old,<=
br>
&gt; stable version of DTC, like we do for all other tools as well. =A0As<b=
r>
&gt; mentioned before - just because RHEL 5 ships an ancient version of -<b=
r>
&gt; say - &quot;make&quot; we will NOT start building this from the source=
s ourself.<br>
&gt; This cannot be the way to go.<br>
<br>
</div>So the result of that is that we can never ever use new features in a=
ny<br>
tool, at least in any meaningful time-frame.<br>
<br>
I think we need to differentiate between tools that are already stable<br>
and/or core to all aspects of the U-Boot build process (such as make),<br>
and tools that enable new features that are under development.<br>
<br>
Clearly the U-Boot makefiles have to be fairly cautious in their use of<br>
any new make features, so that everyone with any reasonable version of<br>
make can build U-Boot.<br>
<br>
However, when enabling a new feature, such as using device trees to<br>
configure U-Boot[1], for which tool support is new and evolving along<br>
with the feature itself, and which is only used on a very very few<br>
boards and even fewer SoCs right now within U-Boot, it seems entirely<br>
reasonable to demand that the people working on/with that new feature<br>
are aware that it&#39;s evolving, and that they may need to take a few extr=
a<br>
steps to go out and get tools that support that new feature. No doubt<br>
once this feature has settled down a bit, and distros have pulled in<br>
newer versions of dtc, everthing will &quot;just work&quot; just like any o=
ther<br>
stable feature.<br>
<br>
If you don&#39;t accept this, then we simply have to ban any include use in=
<br>
U-Boot; dtc -i isn&#39;t in distro-packaged versions of dtc, so we&#39;d ne=
ed to<br>
stop using that. We&#39;d need to move *.dts into a single directory within=
<br>
U-Boot to work around that, or perhaps hard-coding relative include<br>
paths in *.dts might work. Similarly for the patches to support dtc+cpp<br>
usage, so we wouldn&#39;t be able to use named constants in DT files for<br=
>
many years, which would prevent sharing DT files with the kernel and/or<br>
any other standard repository of DT files, which are bound to use this<br>
feature.<br>
<br>
[1] Which is very specifically a different feature than simply having<br>
U-Boot pass a DT to the Linux kernel during boot, and perhaps modify it<br>
a little, which clearly is not a new feature.<br>
</blockquote></div><br></div><div class=3D"gmail_extra" style>My patch:</di=
v><div class=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" sty=
le>- doesn&#39;t require -i but uses it if available (ARCH_CPU_DTS works ar=
ound this)</div>
<div class=3D"gmail_extra" style>- honours #define, #include, etc.</div><di=
v class=3D"gmail_extra" style>- works with old and new versions of dtc</div=
><div class=3D"gmail_extra" style>- uses -Ulinux which we are thinking migh=
t be better done another way</div>
<div class=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" style=
>Let&#39;s not throw the baby out with the bathwater. I have no problem wit=
h updating my dtc as needed, but it would certainly be nice if U-Boot didn&=
#39;t require this.</div>
<div class=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" style=
>However, let&#39;s say Tegra needs a newer dtc than 1.3. I wonder whether =
we should just add a setting to tell U-Boot to not build the device tree at=
 all? The same U-Boot binary can run on many different board times, just ne=
eding a different device tree. Rather than pick one, we could just pick non=
e. Then if you want to use new features in dtc, just define CONFIG_OF_NO_BU=
ILD, or similar, and you can deal with the device tree details yourself. MA=
KEALL/buildman will be happy with this.</div>
<div class=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" style=
>Otherwise for now I think my patch is a reasonable compromise in terms of =
features.</div><div class=3D"gmail_extra" style><br></div><div class=3D"gma=
il_extra" style>
Regards,</div><div class=3D"gmail_extra" style>Simon</div><div class=3D"gma=
il_extra" style><br></div></div>

--089e0149bb02a8756504dde82d4b--

--===============1163150110641234791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1163150110641234791==--
