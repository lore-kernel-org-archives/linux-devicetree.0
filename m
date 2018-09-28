From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 6/9] kbuild: consolidate Devicetree dtb build rules
Date: Fri, 28 Sep 2018 13:41:51 -0500
Message-ID: <CAL_JsqKLOohxGx0Je9niMQ5H3o0Y=EcMQTB6YkbV0sfUOZHu8g@mail.gmail.com>
References: <20180910150403.19476-1-robh@kernel.org> <20180910150403.19476-7-robh@kernel.org>
 <CAL_Jsq+=VbdcVLiwXbOA5d+R2YY6=2Pw2bQpci-jj-JvereD1A@mail.gmail.com>
 <CAK7LNAQFqhWw+LwDoypGG=OP6tH4qf2tT=LvtchK2GoiNyzDXg@mail.gmail.com>
 <CAMuHMdWEnoh97_jiDWMq=ke4PrhSFbToYnx91CPLBuq3mOGzoQ@mail.gmail.com> <75740733-d0d4-4c0c-838c-f01a5e7291d3@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <75740733-d0d4-4c0c-838c-f01a5e7291d3@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>Linux Kbuild mailing list <linux->
List-Id: devicetree@vger.kernel.org

On Fri, Sep 28, 2018 at 12:21 PM Andreas F=C3=A4rber <afaerber@suse.de> wro=
te:
>
> Hi Geert,
>
> Am 13.09.18 um 17:51 schrieb Geert Uytterhoeven:
> > On Wed, Sep 12, 2018 at 3:02 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> >> Even x86 can enable OF and OF_UNITTEST.
> >>
> >> Another solution might be,
> >> guard it by 'depends on ARCH_SUPPORTS_OF'.
> >>
> >> This is actually what ACPI does.
> >>
> >> menuconfig ACPI
> >>         bool "ACPI (Advanced Configuration and Power Interface) Suppor=
t"
> >>         depends on ARCH_SUPPORTS_ACPI
> >>          ...
> >
> > ACPI is a real platform feature, as it depends on firmware.
> >
> > CONFIG_OF can be enabled, and DT overlays can be loaded, on any platfor=
m,
> > even if it has ACPI ;-)
>
> How would loading a DT overlay work on an ACPI platform? I.e., what
> would it overlay against and how to practically load such a file?

The DT unittests do just that. I run them on x86 and UM builds. In
this case, the loading source is built-in.

> I wonder whether that could be helpful for USB devices and serdev...

How to load the overlays is pretty orthogonal to the issues to be
solved here. It would certainly be possible to move forward with
prototyping this and just have the overlay built-in. It may not even
need to be an overlay if we can support multiple root nodes.

Rob
