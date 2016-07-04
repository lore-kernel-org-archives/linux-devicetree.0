From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/4] arm64: dts: r8a7795: Add HSUSB device node and
 enable channel 0 of USB2.0
Date: Mon, 4 Jul 2016 14:39:18 +0200
Message-ID: <20160704123917.GG26270@verge.net.au>
References: <1464086058-1276-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20160526024636.GH18393@verge.net.au>
 <20160530012252.GA12180@verge.net.au>
 <SG2PR06MB0919E6D163804F427DFC1ECAD8450@SG2PR06MB0919.apcprd06.prod.outlook.com>
 <SG2PR06MB091964752DE05021C42FEB06D8220@SG2PR06MB0919.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB091964752DE05021C42FEB06D8220@SG2PR06MB0919.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 28, 2016 at 11:25:04AM +0000, Yoshihiro Shimoda wrote:
> Hi Simon-san,
> 
> > From: Yoshihiro Shimoda
> > Sent: Monday, May 30, 2016 12:30 PM
> > 
> > Hi Simon-san,
> > 
> > > From: Simon Horman
> > > Sent: Monday, May 30, 2016 10:23 AM
> > >
> > > On Thu, May 26, 2016 at 11:46:36AM +0900, Simon Horman wrote:
> > > > On Tue, May 24, 2016 at 07:34:14PM +0900, Yoshihiro Shimoda wrote:
> > > > > This patch is based on the renesas-drivers / renesas-drivers-2016-05-17-v4.6 tag.
> > > >
> > > > Thanks, I have queued this up for v4.8.
> > > > Please let me know if that was not your intention.
> > >
> > > Hi Shimoda-san,
> > >
> > > unfortunately I have observed a problem with patch 3/4 ("arm64: dts:
> > > salvator-x: enable USB 2.0 Host channel 0") after rebasing the
> > > arm64-dt-for-v4.8 branch of the renesas tree on v4.7-rc1.
> > >
> > > The problem I see occurs when booting using "defconfig" to an NFS-root
> > > Debian user-space as per the boot log below. It appears to be readily
> > > reproducible in my environment.
> > 
> > Thank you for the report!
> > I also reproduced this issue if I set the SW15 to pin 1-2 side on the board (this is the default setting).
> > (My environment is NFS-rootfs and Yocto user-space.)
> > If I set the SW15 to pin 2-3 side (as the commit log mentioned), this issue disappeared.
> > Anyway, I will investigate this issue later.
> 
> I found a root cause and I sent fixed patch to the phy maintainer:
> http://thread.gmane.org/gmane.linux.kernel.renesas-soc/5187
> 
> However, I guess there is a bad timing to submit this patch set now,
> So, I intend to resubmit the integration patches after the fixed patch is merged
> into the phy maintainer's repo.
> (In other words, the integration patches should be for v4.9)

Understood.

Please feel free to send the integration patches for v4.9 at any time:
there is no need to wait for rc1 or anything like that.
