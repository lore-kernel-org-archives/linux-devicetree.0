From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/2] arm64: dts: r8a7795: Add USB3.0 host
Date: Tue, 26 Jan 2016 09:42:17 +0900
Message-ID: <20160126004217.GI26945@verge.net.au>
References: <1453457003-7720-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20160125000845.GC774@verge.net.au>
 <CAMuHMdUor3YxMAjL=YWgmG+7p-6+=h=C5vZAr4NkgroermgshA@mail.gmail.com>
 <SG2PR06MB0919CD279BBA09E9F4831663D8C70@SG2PR06MB0919.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB0919CD279BBA09E9F4831663D8C70@SG2PR06MB0919.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 25, 2016 at 08:41:54AM +0000, Yoshihiro Shimoda wrote:
> Hi Geert-san, Simon-san,
> 
> > -----Original Message-----
> > From: geert.uytterhoeven@gmail.com [mailto:geert.uytterhoeven@gmail.com] On Behalf Of Geert Uytterhoeven
> > Sent: Monday, January 25, 2016 5:25 PM
> > To: Simon Horman <horms@verge.net.au>
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Magnus Damm <magnus.damm@gmail.com>; Rob Herring
> > <robh+dt@kernel.org>; Pawel Moll <pawel.moll@arm.com>; Mark Rutland <mark.rutland@arm.com>; Ian Campbell
> > <ijc+devicetree@hellion.org.uk>; Kumar Gala <galak@codeaurora.org>; devicetree@vger.kernel.org;
> > linux-renesas-soc@vger.kernel.org
> > Subject: Re: [PATCH 0/2] arm64: dts: r8a7795: Add USB3.0 host
> > 
> > Hi Simon,
> > 
> > On Mon, Jan 25, 2016 at 1:08 AM, Simon Horman <horms@verge.net.au> wrote:
> > > On Fri, Jan 22, 2016 at 07:03:21PM +0900, Yoshihiro Shimoda wrote:
> > >> This patch set is based on the latest renesas.git / renesas-devel-20160121-v4.4
> > >> tag. (commit id = 3740ade0617955c76e1767b6d49347d5446eed74)
> > >>
> > >> This patch needs r8a7795-cpg-mssr.c update for usb3.0 clocks.
> > >
> > > Thanks. Please let me know if I should wait for that change before
> > > queuing up these patches.
> > 
> > I think you can queue it up fine. It should start working in next
> > renesas-drivers
> > release.
> 
> Thank you for your comment!
> I think so.

Thanks, I have queued these up.
