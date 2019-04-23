Return-Path: <SRS0=TBo3=SZ=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <CAMuHMdX30QG6QzJt4c=Aq=4Jad4x7EZ1jwboXfBein20VBUpYg@mail.gmail.com>
References: <1553847606-18122-1-git-send-email-masonccyang@mxic.com.tw> <1553847606-18122-3-git-send-email-masonccyang@mxic.com.tw> <1e2bf23d-db39-0d1d-0bcc-6d9cd2935a82@cogentembedded.com> <cdee3d53-6ee3-4435-117e-8ba4a58ca72b@cogentembedded.com> <OF82CE76E9.E6395EF7-ON482583DD.000E37D7-482583DD.000E5077@mxic.com.tw> <3d334751-8fd4-7db1-9deb-e6c94936df13@cogentembedded.com> <OF4ABCC306.B053BA23-ON482583E0.000F480C-482583E0.000FAD4A@mxic.com.tw> <3971c669-9095-9d18-d029-37f9663a54b2@cogentembedded.com> <OF58AAFF49.C4593DEB-ON482583E1.001D551E-482583E1.001F089D@mxic.com.tw> <CAMuHMdX30QG6QzJt4c=Aq=4Jad4x7EZ1jwboXfBein20VBUpYg@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller driver
MIME-Version: 1.0
Message-ID: <OF3DDAFD5C.6AD0E98D-ON482583E5.0033E965-482583E5.003479AB@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 23 Apr 2019 17:33:09 +0800
Content-Type: multipart/alternative; boundary="=_alternative 003479AA482583E5_="
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Mark Brown <broonie@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, Lee Jones <lee.jones@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 003479AA482583E5_=
Content-Type: text/plain; charset="US-ASCII"


Hi Geert,

> On Fri, Apr 19, 2019 at 7:39 AM <masonccyang@mxic.com.tw> wrote:
> > > Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI 
> controller driver
> > > On 04/18/2019 05:51 AM, masonccyang@mxic.com.tw wrote:
> > > >>    Still hangs for me. After I patches spi-mem.c and the driver 
to
> > > >> call RPM for the MFD, it started working again. Perhaps, that 
clock
> > > >> is still enabled on your target. What does the following print 
(for
> > > >> the RPC clocks)?
> > > >>
> > > >> $ mount none -t debugfs /sys/kernel/debug/
> > > >> $ cat /sys/kernel/debug/clk/clk_summary
> > > >>
> > > >
> > > > root@draak:/# cat /sys/kernel/debug/clk/clk_summary
> > > >                                  enable  prepare  protect duty
> > > >    clock                          count    count    count
> > > rate   accuracy phase  cycle
> > > >
> > > 
> 
---------------------------------------------------------------------------------------------
> > > >  audio_clkout1                        0        0        0 
> 11289600          0     0  50000
> > > >  x19_clk                              0        0        0 
> 24576000          0     0  50000
> > > >  dclkin-0                             0        0        0 
> 0          0     0  50000
> > > >  scif                                 1        1        0 
> 0          0     0  50000
> > > >  audio_clkb                           0        0        0 
> 22579200          0     0  50000
> > > >  msiof-ref-clock                      0        0        0 
> 66666666          0     0  50000
> > > >  extal                                2        3        0 
> 48000000          0     0  50000
> > > >     r                                 0        2        0 
> 31250          0     0  50000
> > > >        rpc-if                         0        1        0 
> 31250          0     0  50000
> > >
> > >    This looks wrong, the RPC-IF module clock should have RPC or
> > > RPCD2 (where ae they?)
> > > as a source, not RLCK...
> >
> > I check the Ch8 CPG of R-Car datasheet, figure 8.1f(R-Car D3),
> > the RPC/RPCD2 is derived from PLL1 -> PLL1CK
> >
> > I didn't patch it and it should be exposed afrer the .sdsrc
> >
> >     .main                                 2            2 
> 48000000          0 0
> >        .pll3                              0            0 
> 928000000          0 0
> >        .pll1                              4            4 
> 1600000000          0 0
> >           lv1                             0            0 
> 1600000000          0 0
> >           lv0                             1            1 
> 1600000000          0 0
> >              lvds                         1            1 
> 1600000000          0 0
> >           cl                              0            0 
> 33333333          0 0
> >           zx                              0            0 
> 533333333          0 0
> >           zt                              0            0 
> 400000000          0 0
> >           ztr                             0            0 
> 266666666          0 0
> >           .sdsrc                          1            1 
> 800000000          0 0
> >              sd0                          1            1 
> 200000000          0 0
> >                 emmc0
> > ---> here !
> 
> Upstream drivers/clk/renesas/r8a77995-cpg-mssr.c does not have the 
"rpc-if"
> clock, and we have not yet seen the patch to add it that you must be 
using
> to make your driver work. If the clock is defined wrongly, that might
> explain why your driver is working for you, but not for Sergei.

yes, I think so.

Before I have test "CPG_MOD 917" bit for RPC-IF CLK ON/OFF.

thanks & best regards,
Mason


CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================

--=_alternative 003479AA482583E5_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Geert,<br>
<br>
&gt; On Fri, Apr 19, 2019 at 7:39 AM &lt;masonccyang@mxic.com.tw&gt; wrote:<br>
&gt; &gt; &gt; Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI
<br>
&gt; controller driver<br>
&gt; &gt; &gt; On 04/18/2019 05:51 AM, masonccyang@mxic.com.tw wrote:<br>
&gt; &gt; &gt; &gt;&gt; &nbsp; &nbsp;Still hangs for me. After I patches
spi-mem.c and the driver to<br>
&gt; &gt; &gt; &gt;&gt; call RPM for the MFD, it started working again.
Perhaps, that clock<br>
&gt; &gt; &gt; &gt;&gt; is still enabled on your target. What does the
following print (for<br>
&gt; &gt; &gt; &gt;&gt; the RPC clocks)?<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; $ mount none -t debugfs /sys/kernel/debug/<br>
&gt; &gt; &gt; &gt;&gt; $ cat /sys/kernel/debug/clk/clk_summary<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; root@draak:/# cat /sys/kernel/debug/clk/clk_summary<br>
&gt; &gt; &gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enable &nbsp;prepare
&nbsp;protect &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;duty<br>
&gt; &gt; &gt; &gt; &nbsp; &nbsp;clock &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;count &nbsp; &nbsp;count
&nbsp; &nbsp;count<br>
&gt; &gt; &gt; rate &nbsp; accuracy phase &nbsp;cycle<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; <br>
&gt; ---------------------------------------------------------------------------------------------<br>
&gt; &gt; &gt; &gt; &nbsp;audio_clkout1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp;
&nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; <br>
&gt; 11289600 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000<br>
&gt; &gt; &gt; &gt; &nbsp;x19_clk &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;
&nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;<br>
&gt; 24576000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000<br>
&gt; &gt; &gt; &gt; &nbsp;dclkin-0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 &nbsp; &nbsp;
&nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; <br>
&gt; 0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000<br>
&gt; &gt; &gt; &gt; &nbsp;scif &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1
&nbsp; &nbsp; &nbsp; &nbsp;1 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;
<br>
&gt; 0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000<br>
&gt; &gt; &gt; &gt; &nbsp;audio_clkb &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 &nbsp; &nbsp;
&nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;<br>
&gt; 22579200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000<br>
&gt; &gt; &gt; &gt; &nbsp;msiof-ref-clock &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0
&nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;<br>
&gt; 66666666 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000<br>
&gt; &gt; &gt; &gt; &nbsp;extal &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2
&nbsp; &nbsp; &nbsp; &nbsp;3 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;<br>
&gt; 48000000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000<br>
&gt; &gt; &gt; &gt; &nbsp; &nbsp; r &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
0 &nbsp; &nbsp; &nbsp; &nbsp;2 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;
<br>
&gt; 31250 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000<br>
&gt; &gt; &gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp;rpc-if &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 &nbsp;
&nbsp; &nbsp; &nbsp;1 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; <br>
&gt; 31250 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &nbsp; &nbsp;This looks wrong, the RPC-IF module clock should
have RPC or<br>
&gt; &gt; &gt; RPCD2 (where ae they?)<br>
&gt; &gt; &gt; as a source, not RLCK...<br>
&gt; &gt;<br>
&gt; &gt; I check the Ch8 CPG of R-Car datasheet, figure 8.1f(R-Car D3),<br>
&gt; &gt; the RPC/RPCD2 is derived from PLL1 -&gt; PLL1CK<br>
&gt; &gt;<br>
&gt; &gt; I didn't patch it and it should be exposed afrer the .sdsrc<br>
&gt; &gt;<br>
&gt; &gt; &nbsp; &nbsp; .main &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2 &nbsp; &nbsp;<br>
&gt; 48000000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 0<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp;.pll3 &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; <br>
&gt; 928000000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 0<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp;.pll1 &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4 &nbsp;<br>
&gt; 1600000000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 0<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; lv1 &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;<br>
&gt; 1600000000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 0<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; lv0 &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1 &nbsp;<br>
&gt; 1600000000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 0<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;lvds &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1 &nbsp;<br>
&gt; 1600000000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 0<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cl &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;<br>
&gt; 33333333 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 0<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; zx &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; <br>
&gt; 533333333 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 0<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; zt &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; <br>
&gt; 400000000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 0<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ztr &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; <br>
&gt; 266666666 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 0<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .sdsrc &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1 &nbsp; <br>
&gt; 800000000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 0<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sd0 &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1 &nbsp; <br>
&gt; 200000000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 0<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; emmc0<br>
&gt; &gt; ---&gt; here !<br>
&gt; <br>
&gt; Upstream drivers/clk/renesas/r8a77995-cpg-mssr.c does not have the
&quot;rpc-if&quot;<br>
&gt; clock, and we have not yet seen the patch to add it that you must
be using<br>
&gt; to make your driver work. If the clock is defined wrongly, that might<br>
&gt; explain why your driver is working for you, but not for Sergei.</font></tt>
<br>
<br><tt><font size=2>yes, I think so.</font></tt>
<br>
<br><tt><font size=2>Before I have test &quot;CPG_MOD 917&quot; bit for
RPC-IF CLK ON/OFF.</font></tt>
<br>
<br><tt><font size=2>thanks &amp; best regards,</font></tt>
<br><tt><font size=2>Mason<br>
<br>
<br>
CONFIDENTIALITY NOTE:<br>
<br>
This e-mail and any attachments may contain confidential information and/or
personal data, which is protected by applicable laws. Please be reminded
that duplication, disclosure, distribution, or use of this e-mail (and/or
its attachments) or any part thereof is prohibited. If you receive this
e-mail in error, please notify us immediately and delete this mail as well
as its attachment(s) from your system. In addition, please be informed
that collection, processing, and/or use of personal data is prohibited
unless expressly permitted by personal data protection laws. Thank you
for your attention and cooperation.<br>
<br>
Macronix International Co., Ltd.<br>
<br>
=====================================================================<br>
</font></tt>

--=_alternative 003479AA482583E5_=--
