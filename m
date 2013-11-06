Return-Path: <dinh.linux@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20131105190633.GA21178@roeck-us.net>
References: <1383676898-29819-1-git-send-email-panto@antoniou-consulting.com>
	<20131105190633.GA21178@roeck-us.net>
Date: Tue, 5 Nov 2013 18:01:33 -0600
Message-ID: <CADhT+wf+=WMVwa0=pY=aR17_a_pGfbvt9q9g3iw6HNDXaD4csw@mail.gmail.com>
Subject: Re: [PATCH 0/3 - V2] Introducing Device Tree Overlays
From: Dinh Nguyen <dinh.linux@gmail.com>
Content-Type: multipart/alternative; boundary=089e013d14b21fff6504ea76da7a
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pantelis Antoniou <panto@antoniou-consulting.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Alison Chaiken <Alison_Chaiken@mentor.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--089e013d14b21fff6504ea76da7a
Content-Type: text/plain; charset=ISO-8859-1

Hi Pantelis,


On Tue, Nov 5, 2013 at 1:06 PM, Guenter Roeck <linux@roeck-us.net> wrote:

> On Tue, Nov 05, 2013 at 08:41:35PM +0200, Pantelis Antoniou wrote:
> > The following patchset introduces Device Tree overlays, a method
> > of dynamically altering the kernel's live Device Tree, along with
> > a generic interface to use it in a board agnostic manner.
> >
> Hi Pantelis,
>
> great to see this going. I'll apply the patches to our tree and test.
>
> I have a couple of patches on top of yours:
> - export overlay functions
> - declare of_free_overlay_info as static inline if OF is undefined.
> - ignore PCI devices when inserting or removing overlays
>   [ Based on the idea that PCI/PCIe ports are handled by the PCI subsystem
> ]
>
> I'll rebase those to the new version of your patches and send it out
> after I get it all working.
>

Alan and  I will also test on top of the FPGA framework.

Thanks,
Dinh

>
> Thanks,
> Guenter
>

--089e013d14b21fff6504ea76da7a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Pantelis,<br><div class=3D"gmail_extra"><br><br><div cl=
ass=3D"gmail_quote">On Tue, Nov 5, 2013 at 1:06 PM, Guenter Roeck <span dir=
=3D"ltr">&lt;<a href=3D"mailto:linux@roeck-us.net" target=3D"_blank">linux@=
roeck-us.net</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, Nov 05, 2013 at 08=
:41:35PM +0200, Pantelis Antoniou wrote:<br>
&gt; The following patchset introduces Device Tree overlays, a method<br>
&gt; of dynamically altering the kernel&#39;s live Device Tree, along with<=
br>
&gt; a generic interface to use it in a board agnostic manner.<br>
&gt;<br>
</div>Hi Pantelis,<br>
<br>
great to see this going. I&#39;ll apply the patches to our tree and test.<b=
r>
<br>
I have a couple of patches on top of yours:<br>
- export overlay functions<br>
- declare of_free_overlay_info as static inline if OF is undefined.<br>
- ignore PCI devices when inserting or removing overlays<br>
=A0 [ Based on the idea that PCI/PCIe ports are handled by the PCI subsyste=
m ]<br>
<br>
I&#39;ll rebase those to the new version of your patches and send it out<br=
>
after I get it all working.<br></blockquote><div><br></div><div>Alan and =
=A0I will also test on top of the FPGA framework.</div><div><br></div><div>=
Thanks,</div><div>Dinh=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<br>
Thanks,<br>
Guenter<br>
</blockquote></div><br></div></div>

--089e013d14b21fff6504ea76da7a--
