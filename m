Return-Path: <SRS0=wv7m=HP=verge.net.au=horms@kernel.org>
Date: Wed, 25 Apr 2018 09:20:06 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: Add Renesas R8A77990 SoC
 support
Message-ID: <20180425072005.zstbvoipuzapjxgm@verge.net.au>
References: <1524227297-24955-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524227297-24955-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUx8CGoC=kMbAVUDO807g9BJ80w-TFdZ2vJZ9d0B6rbdA@mail.gmail.com>
 <20180424083633.ypkamflp3v6zlsz7@verge.net.au>
 <OSBPR01MB22938B6E2585810AEBCD9341D88F0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB22938B6E2585810AEBCD9341D88F0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 25, 2018 at 02:47:41AM +0000, Yoshihiro Shimoda wrote:
> Hi, Simon-san,
> 
> > From: Simon Horman, Sent: Tuesday, April 24, 2018 5:37 PM
> > 
> > On Tue, Apr 24, 2018 at 10:26:37AM +0200, Geert Uytterhoeven wrote:
> > > Hi Shimoda-san,
> > >
> > > On Fri, Apr 20, 2018 at 2:28 PM, Yoshihiro Shimoda
> > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > This patch adds basic support for the Renesas R-Car E3 (R8A77990) SoC:
> > > >   - PSCI
> > > >   - CPU (single)
> > > >   - Cache controller
> > > >   - Main clocks and controller
> > > >   - Interrupt controller
> > > >   - Timer
> > > >   - PMU
> > > >   - Reset controller
> > > >   - Product register
> > > >   - System controller
> > > >   - UART for console
> > > >
> > > > Inspried by a patch by Takeshi Kihara in the BSP.
> > > >
> > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > >
> > > Thanks for you patch!
> > 
> > Thanks for your review.
> > 
> > As I've already applied this patch I'd like to ask Shimoda-san
> > to send incremental patches to address the issues you raise below.
> 
> I got it. I'll send incremental patches.

Thanks, much appreciated.
