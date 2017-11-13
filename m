From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] MIPS: implement a "bootargs-append" DT property
Date: Mon, 13 Nov 2017 13:31:33 +0100
Message-ID: <CAMuHMdUtHhSLbrgmOW7gkEUg8pif+Ddc-zZgWzCZ4WL3JTeOKg@mail.gmail.com>
References: <1510420788-25184-1-git-send-email-daniel@gimpelevich.san-francisco.ca.us>
 <20171113112312.GZ15260@jhogan-linux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171113112312.GZ15260@jhogan-linux>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: James Hogan <james.hogan@mips.com>, Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
Cc: Linux MIPS Mailing List <linux-mips@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi James, Daniel,

On Mon, Nov 13, 2017 at 12:23 PM, James Hogan <james.hogan@mips.com> wrote:
> On Sat, Nov 11, 2017 at 09:19:48AM -0800, Daniel Gimpelevich wrote:
>> There are two uses for this:
>>
>> 1) It may be useful to split a device-specific kernel command line between
>> a .dts file and a .dtsi file, with "bootargs" in one and "bootargs-append"
>> in the other, such as for variations of a reference board.

I've seen other use cases, e.g. the extension of the du node's "clocks" and
"clock-names" properties from arch/arm64/boot/dts/renesas/r8a7795.dtsi to
arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts.

To avoid the proliferation of "-append" versions of existing properties, what
about handling this in dtc, by adding support for an "/append-property/"
keyword?

     bootargs = "first part"
     ...
     /append-property/ bootargs = " second part".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
