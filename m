From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: dts: kirkwood: Add DTS for Linksys EA4200v2/EA4500
Date: Mon, 4 Apr 2016 14:15:48 +0200
Message-ID: <20160404121548.GC21828@lunn.ch>
References: <1459601753-31193-1-git-send-email-bert@biot.com>
 <20160402161639.GF32554@lunn.ch>
 <5702555C.1020408@biot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5702555C.1020408@biot.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bert Vermeulen <bert@biot.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> >Could you dual license this under X11 as well? You will need agreement
> >from the copyright holders above, if they wrote DT fragments.
> >
> > Not many kirkwood boards are, but we encourage most Marvell SoCs DT
> > files to be dual license.
> 
> I did not get responses from all authors, so no dice.

O.K. We can change this later if they do reply.
 
> >The 6171 is a 7 port device. Is the last port also a 'cpu' port?
> 
> I don't think so. I didn't manage to get anything through it, and I
> can't see the CPU traces on the PCB (neither 5 nor 6).

You might need to set the RGMII delay. Here is an example i use with
another board:

port@6 {
	reg = <6>;
        label = "cpu";
	phy-mode = "rgmii-txid";
};

	Andrew
