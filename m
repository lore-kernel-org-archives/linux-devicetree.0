From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v0 07/10] arm: orion5x: Remove old non-DT-based WNR854T
 support
Date: Sat, 16 Jul 2016 18:36:59 +0200
Message-ID: <20160716163659.GH1777@lunn.ch>
References: <1468679348-10522-1-git-send-email-jm@lentin.co.uk>
 <1468679348-10522-8-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468679348-10522-8-git-send-email-jm@lentin.co.uk>
Sender: netdev-owner@vger.kernel.org
To: Jamie Lentin <jm@lentin.co.uk>
Cc: Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Imre Kaloz <kaloz@openwrt.org>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 16, 2016 at 03:29:05PM +0100, Jamie Lentin wrote:

Again, you need a commit log. It could be something like:

The setup file for the wnr854t has bit rotted to such an extent it no
longer works. Replace it with a working device tree description.

       Andrew
