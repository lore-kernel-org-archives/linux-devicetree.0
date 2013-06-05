From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: getting allwinner SoC support upstream (was Re: Uploading linux
 (3.9.4-1))
Date: Wed, 5 Jun 2013 16:46:38 -0400
Message-ID: <CAKON4OxDD5orX2w-_+d5kawTGXbE3KKj2QLERo9m7=NiUSXhgQ@mail.gmail.com>
References: <CAPweEDx3mAy40BZrzrKPRbvg7vKMj7KevDQ3m_v4p6Yo50eSGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2578717634753910929=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPweEDx3mAy40BZrzrKPRbvg7vKMj7KevDQ3m_v4p6Yo50eSGg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Luke Kenneth Casson Leighton <lkcl-fw2G7BUl9JU@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, debian-arm-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org, debian-release-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org, Linux on small ARM machines <arm-netbook-Fj0DB6SUpRXNuVmtMlwsDbVCufUGDwFn@public.gmane.org>, ARM Linux Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, debian-kernel-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2578717634753910929==
Content-Type: multipart/alternative; boundary=001a11c368984f9f8c04de6e4b87

--001a11c368984f9f8c04de6e4b87
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 5, 2013 at 3:46 PM, Luke Kenneth Casson Leighton
<lkcl-fw2G7BUl9JU@public.gmane.org>wrote:

> On Fri, May 31, 2013 at 3:52 AM, Ben Hutchings <ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>
> wrote:
>
> > The 3.8.y branch is over, so I think we have to move to 3.9, ready or
> > not.  I merged the work in progress from trunk to sid and am going
> > through the config changes at the moment.
> >
> > I'm rather disappointed that nothing at all has been committed by ARM
> > porters to either branch in the last month.
>
>  *sigh* i didn't want to leave this as it stood, ben, purely for the
> reason that i don't want to see you discouraged!  but, i also had to
> think a bit about what potentially to say.
>
>  the one SoC family that's going to become increasingly important to
> have both upstream and in debian is support for allwinner's
> processors.  with 40% world-wide tablet market share [*0], they must
> be doing something right, and it's basically getting a staggering
> price-performance value as well as having a set of interfaces and
> level of integration that is really second to none.
>
>  to begin to describe the problem in getting allwinner soc source code
> upstream is this: not only do we have the usual "let's get it out the
> door as fast as possible" learning curve of a very young, very new and
> bewilderingly-successful fabless SoC company, but we also have a
> completely new type of very successful and comprehensive
> device-tree-like dynamic configuration system to deal with, which
> allwinner have called "fex" [*1].
>
>  basically at the time when device-tree was being thought of,
> allwinner needed something that they could *right then* - not waiting
> for developers to finish device-tree - they needed to be able to
> reconfigure their customer's kernels *without* needing a recompile.
> so they invented the script.fex system, which is a simple config.ini
> file-format, compile it to binary, and get the bootloader to upload it
> to memory and read it.
>

Why don't you try converting the sunxi code over to device tree? I don't
think it will be as hard as you may think it is. Start off by mapping the
existing fex syntax into a DTS file. Send your DTS file to
devicetree-discuss to get help with the correct syntax. Once this DTS
template is constructed you can write a program to convert any fex file
into it.

Now boot with this DTB; that will get all of the existing info into the
kernel's internal FDT.  Then start converting your drivers over to use the
of_ support for accessing the FDT. You've already done all of the hard work
in making the drivers configurable at boot. As a transition tool allow the
kernel to boot with both fex and DT untill you get all of the drivers
converted.

BTW, device tree has been in the kernel since 2007 (or earlier).  About two
years ago the ARM community decided to switch all new development onto it
in order to stop the proliferation of platform/machine files. I believe the
rule about no new non-DT ARM platforms has been in place for over eighteen
months.

If fex is add to the kernel every device driver will have to get two
bindings. One for when the chip is used on a fex machine, and another when
the chip is used with device tree. For example most of the I2C device
drivers have been converted to device tree and they now know how to
interpret device tree data for set up. And so on, and so on -- this problem
exists for every bus based device. fex is simply a re-implementation of
device tree. We don't need too implementations of this.


>
>  fex covers *eeeeeevvveeerryyyythiiiing* - right from flipping the
> multiplexing for all 3 SD/MMC cards so that you can pretend that SD0
> is SD2 and you can specify *different* GPIOs for each to say which is
>

You can do all of this in device tree too. If the exact syntax doesn't
exist you can use 'allwinner,' prefixes on the node names.
Also check out pinctrl so that it doesn't get reinvented.



> the detect line, which is the write-protect line, to setting the DRAM
> clock timings, saying which kernel driver must be loaded to support
> the touchscreen, enabling debugging, JTAG, naming the GPIOs for easy
> and convenient use in the kernel code: basically there isn't a single
> piece of hardware on the allwinner SoC family which *isn't*
> reconfigureable through script.fex... and they've even integrated it
> into u-boot *and* their low-level (early) bootloader as well [which
>

Device tree support has been integrated into uboot for about five years now.



> they've just properly complied with the GPL on, hooray! [*2]].
>
> what's the point of mentioning this?
>
> well, the point is: the expectation of the linux kernel developers is
> that Everyone Must Convert To DeviceTree.  implicitly behind that is,
> i believe, an expectation that if you *don't* convert to Device Tree,
> you can kiss upstream submission goodbye.  and, in allwinner's case,
> that's simply not going to happen.
>
> add to this the fact that they've already taken *five* near-identical
> copies of each version of their drivers (for sun3i up to sun7i) - if
> you do a recursive diff in the drivers/usb/sun7i_usb and
> drivers/usb/sun4i_usb directories, the discrepancies are negligeable
> (and are in many cases a regression, reintroducing known or new
> bugs!), you can start to see that they simply have no idea how to work
> with the free software community (they're too busy) and that they're
> not really about to start, either.
>
> ... and yet they're unbelievably successful, despite making a dog's
> dinner of things as far as upstream integration is concerned,
> precisely because they really really do only need to get one single
> kernel compiled (for *all* their multi-million-dollar clients) and
> err... that's it.  everything else goes into a per-client (per
> product) customized script.fex.
>

Device tree on ARM's goal is to achieve a single kernel across vendors, not
just a single kernel for a single vendor.


> so, i don't have all the answers, but i can clearly see that there
> needs to be some discussion and dialog - we can't have the world's
> most successful SoC vendor *not* supported upstream: that's just a
> ridiculous situation that is not helping any of the linux distros to
> be an easy install option on some of the world's highest
> price-performance ratio hardware.
>
> thoughts and discussion appreciated.
>
> l.
>
>
> [*0]
> http://hardware.slashdot.org/story/13/05/08/1636217/chinas-allwinner-outsold-intel-qualcomm-in-tablet-processors-in-2012
> [*1] - fex guide for SoCs up to but excluding the Allwinner A20
> http://linux-sunxi.org/Fex_Guide
> [*2] http://lists.phcomp.co.uk/pipermail/arm-netbook/2013-June/007619.htmland
>
> http://lists.phcomp.co.uk/pipermail/arm-netbook/2013-June/007611.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>



-- 
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--001a11c368984f9f8c04de6e4b87
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jun 5, 2013 at 3:46 PM, Luke Kenneth Casson Leighton <span =
dir=3D"ltr">&lt;<a href=3D"mailto:lkcl-fw2G7BUl9JU@public.gmane.org" target=3D"_blank">lkcl@lkc=
l.net</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">On Fri, May 31, 2013 at 3:52 AM, Ben Hutchings &lt;<a href=
=3D"mailto:ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org" target=3D"_blank">ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org</a>&g=
t; wrote:<br>



<br>
&gt; The 3.8.y branch is over, so I think we have to move to 3.9, ready or<=
br>
&gt; not. =A0I merged the work in progress from trunk to sid and am going<b=
r>
&gt; through the config changes at the moment.<br>
&gt;<br>
&gt; I&#39;m rather disappointed that nothing at all has been committed by =
ARM<br>
&gt; porters to either branch in the last month.<br>
<br>
=A0*sigh* i didn&#39;t want to leave this as it stood, ben, purely for the<=
br>
reason that i don&#39;t want to see you discouraged! =A0but, i also had to<=
br>
think a bit about what potentially to say.<br>
<br>
=A0the one SoC family that&#39;s going to become increasingly important to<=
br>
have both upstream and in debian is support for allwinner&#39;s<br>
processors. =A0with 40% world-wide tablet market share [*0], they must<br>
be doing something right, and it&#39;s basically getting a staggering<br>
price-performance value as well as having a set of interfaces and<br>
level of integration that is really second to none.<br>
<br>
=A0to begin to describe the problem in getting allwinner soc source code<br=
>
upstream is this: not only do we have the usual &quot;let&#39;s get it out =
the<br>
door as fast as possible&quot; learning curve of a very young, very new and=
<br>
bewilderingly-successful fabless SoC company, but we also have a<br>
completely new type of very successful and comprehensive<br>
device-tree-like dynamic configuration system to deal with, which<br>
allwinner have called &quot;fex&quot; [*1].<br>
<br>
=A0basically at the time when device-tree was being thought of,<br>
allwinner needed something that they could *right then* - not waiting<br>
for developers to finish device-tree - they needed to be able to<br>
reconfigure their customer&#39;s kernels *without* needing a recompile.<br>
so they invented the script.fex system, which is a simple config.ini<br>
file-format, compile it to binary, and get the bootloader to upload it<br>
to memory and read it.<br></blockquote><div><br></div><div>Why don&#39;t yo=
u try converting the sunxi code over to device tree? I don&#39;t think it w=
ill be as hard as you may think it is. Start off by mapping the existing fe=
x syntax into a DTS file. Send your DTS file to devicetree-discuss to get h=
elp with the correct syntax. Once this DTS template is constructed you can =
write a program to convert any fex file into it.</div>
<div><br></div><div>Now boot with this DTB; that will get all of the existi=
ng info into the kernel&#39;s internal FDT. =A0Then start converting your d=
rivers over to use the of_ support for accessing the FDT. You&#39;ve alread=
y done all of the hard work in making the drivers configurable at boot. As =
a transition tool allow the kernel to boot with both fex and DT untill you =
get all of the drivers converted.=A0</div>
<div><br></div><div>BTW, device tree has been in the kernel since 2007 (or =
earlier). =A0About two years ago the ARM community decided to switch all ne=
w development onto it in order to stop the proliferation of platform/machin=
e files. I believe the rule about no new non-DT ARM platforms has been in p=
lace for over eighteen months.=A0<br>
</div>
<div><br></div><div>If fex is add to the kernel every device driver will ha=
ve to get two bindings. One for when the chip is used on a fex machine, and=
 another when the chip is used with device tree.=A0For example most of the =
I2C device drivers have been converted to device tree and they now know how=
 to interpret device tree data for set up.=A0And so on, and so on -- this p=
roblem exists for every bus based device. fex is simply a re-implementation=
 of device tree. We don&#39;t need too implementations of this.</div>
<div style>=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex">

<br>
=A0fex covers *eeeeeevvveeerryyyythiiiing* - right from flipping the<br>
multiplexing for all 3 SD/MMC cards so that you can pretend that SD0<br>
is SD2 and you can specify *different* GPIOs for each to say which is<br></=
blockquote><div><br></div><div style>You can do all of this in device tree =
too. If the exact syntax doesn&#39;t exist you can use &#39;allwinner,&#39;=
 prefixes on the node names.</div>
<div style>Also check out pinctrl so that it doesn&#39;t get reinvented.</d=
iv><div><br></div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,20=
4,204);border-left-style:solid;padding-left:1ex">

the detect line, which is the write-protect line, to setting the DRAM<br>
clock timings, saying which kernel driver must be loaded to support<br>
the touchscreen, enabling debugging, JTAG, naming the GPIOs for easy<br>
and convenient use in the kernel code: basically there isn&#39;t a single<b=
r>
piece of hardware on the allwinner SoC family which *isn&#39;t*<br>
reconfigureable through script.fex... and they&#39;ve even integrated it<br=
>
into u-boot *and* their low-level (early) bootloader as well [which<br></bl=
ockquote><div><br></div><div style>Device tree support has been integrated =
into uboot for about five years now.</div><div><br></div><div>=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;paddi=
ng-left:1ex">

they&#39;ve just properly complied with the GPL on, hooray! [*2]].<br>
<br>
what&#39;s the point of mentioning this?<br>
<br>
well, the point is: the expectation of the linux kernel developers is<br>
that Everyone Must Convert To DeviceTree. =A0implicitly behind that is,<br>
i believe, an expectation that if you *don&#39;t* convert to Device Tree,<b=
r>
you can kiss upstream submission goodbye. =A0and, in allwinner&#39;s case,<=
br>
that&#39;s simply not going to happen.<br>
<br>
add to this the fact that they&#39;ve already taken *five* near-identical<b=
r>
copies of each version of their drivers (for sun3i up to sun7i) - if<br>
you do a recursive diff in the drivers/usb/sun7i_usb and<br>
drivers/usb/sun4i_usb directories, the discrepancies are negligeable<br>
(and are in many cases a regression, reintroducing known or new<br>
bugs!), you can start to see that they simply have no idea how to work<br>
with the free software community (they&#39;re too busy) and that they&#39;r=
e<br>
not really about to start, either.<br>
<br>
... and yet they&#39;re unbelievably successful, despite making a dog&#39;s=
<br>
dinner of things as far as upstream integration is concerned,<br>
precisely because they really really do only need to get one single<br>
kernel compiled (for *all* their multi-million-dollar clients) and<br>
err... that&#39;s it. =A0everything else goes into a per-client (per<br>
product) customized script.fex.<br></blockquote><div><br></div><div style>D=
evice tree on ARM&#39;s goal is to achieve a single kernel across vendors, =
not just a single kernel for a single vendor.</div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-le=
ft:1ex">
<br>
so, i don&#39;t have all the answers, but i can clearly see that there<br>
needs to be some discussion and dialog - we can&#39;t have the world&#39;s<=
br>
most successful SoC vendor *not* supported upstream: that&#39;s just a<br>
ridiculous situation that is not helping any of the linux distros to<br>
be an easy install option on some of the world&#39;s highest<br>
price-performance ratio hardware.<br>
<br>
thoughts and discussion appreciated.<br>
<br>
l.<br>
<br>
<br>
[*0] <a href=3D"http://hardware.slashdot.org/story/13/05/08/1636217/chinas-=
allwinner-outsold-intel-qualcomm-in-tablet-processors-in-2012" target=3D"_b=
lank">http://hardware.slashdot.org/story/13/05/08/1636217/chinas-allwinner-=
outsold-intel-qualcomm-in-tablet-processors-in-2012</a><br>



[*1] - fex guide for SoCs up to but excluding the Allwinner A20<br>
<a href=3D"http://linux-sunxi.org/Fex_Guide" target=3D"_blank">http://linux=
-sunxi.org/Fex_Guide</a><br>
[*2] <a href=3D"http://lists.phcomp.co.uk/pipermail/arm-netbook/2013-June/0=
07619.html" target=3D"_blank">http://lists.phcomp.co.uk/pipermail/arm-netbo=
ok/2013-June/007619.html</a> and<br>
=A0 =A0 =A0 <a href=3D"http://lists.phcomp.co.uk/pipermail/arm-netbook/2013=
-June/007611.html" target=3D"_blank">http://lists.phcomp.co.uk/pipermail/ar=
m-netbook/2013-June/007611.html</a><br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-kernel=
&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" targe=
t=3D"_blank">majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
Please read the FAQ at =A0<a href=3D"http://www.tux.org/lkml/" target=3D"_b=
lank">http://www.tux.org/lkml/</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>Jon Smirl<br=
><a href=3D"mailto:jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
</a>
</div></div>

--001a11c368984f9f8c04de6e4b87--

--===============2578717634753910929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2578717634753910929==--
