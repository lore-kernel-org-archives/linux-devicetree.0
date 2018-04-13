Return-Path: <SRS0=S/Wl=HC=verge.net.au=horms@kernel.org>
Date: Fri, 13 Apr 2018 10:09:10 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 4/4] soc: renesas: rcar-rst: Add support for R-Car E3
Message-ID: <20180413080910.7sbcsyngcozosbs7@verge.net.au>
References: <1523439386-1032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1523439386-1032-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVssUyEq7ipQ-p4DzCpZKkV64TZnSV0OKpshjigaNFb2g@mail.gmail.com>
 <20180412075430.kkqg63djci6jkno2@verge.net.au>
 <TY1PR06MB099243FEB726CEEF0CD8C616D8BC0@TY1PR06MB0992.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR06MB099243FEB726CEEF0CD8C616D8BC0@TY1PR06MB0992.apcprd06.prod.outlook.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, TAKESHI KIHARA <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 12, 2018 at 08:11:22AM +0000, Yoshihiro Shimoda wrote:
> Hi Simon-san,
> 
> > From: Simon Horman, Sent: Thursday, April 12, 2018 4:55 PM
> > 
> > On Wed, Apr 11, 2018 at 05:18:28PM +0200, Geert Uytterhoeven wrote:
> > > Hi Shimoda-san,
> > >
> > > Thanks for your patch!
> > >
> > > On Wed, Apr 11, 2018 at 11:36 AM, Yoshihiro Shimoda
> > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > >
> > > > This patch adds definition of reset vector for the R8A77990 SoC.
> > >
> > > The description doesn't seem to match what the patch does?
> > 
> > How about this text, based on Sergei's test for the R8a77980?
> > 
> > Add support for R-Car E3 (R8A77990) to the R-Car RST driver.
> > This driver is needed for the clock driver to work.
> 
> It's good to me. So, should I submit v2 patch?

No need, I have applied the patch with the changelog text above.
