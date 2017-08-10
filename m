From: Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH 2/2] ARM: dts: r8a7743: Add IIC cores to dtsi
Date: Thu, 10 Aug 2017 13:49:05 +0000
Message-ID: <TY1PR06MB0702EA22AFE7D8145BF623A6B7880@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <1502196418-31341-1-git-send-email-biju.das@bp.renesas.com>
 <12d923ba-184c-ef59-f27b-41a7592a5f93@cogentembedded.com>
 <20170810080121.GE16647@verge.net.au> <20170810112411.GA4380@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170810112411.GA4380@katana>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wolfram Sang <wsa@the-dreams.de>, Simon Horman <horms@verge.net.au>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello,

> From: Wolfram Sang [mailto:wsa@the-dreams.de]
> Sent: 10 August 2017 12:24
> 
> 
> > > >+		i2c6: i2c@e60b0000 {
> > >
> > >    I'd use iic0 as the label.
> >
> > I have no preference here other than that we try to be consistent in
> > DT for different R-Car SoCs. Wolfram, do you have an opinion on this?
> 
> Back then, for M2-W, I decided to go with the schematics/datasheets.
> And those mentioned i2c6 rather than iic0. For that reason, the comment

The M2 schematics still use i2c6, and for consistency I'd vote to use the same with RZ/G1M.

> 
> "/* The memory map in the User's Manual maps the cores to bus numbers */"
> 
> exists in r8a7791.dtsi. Dunno the manual of this SoC here.

The manual for r8a7743 uses the same terminology as the r8a7791 manuals.

Kind regards, Chris
