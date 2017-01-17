From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 7/8] ARM: dts: kirkwood-mv88f6281gtw-ge: Utilize new
 DSA binding
Date: Tue, 17 Jan 2017 18:30:47 +0100
Message-ID: <20170117173047.GF9470@lunn.ch>
References: <20170105192957.14304-1-f.fainelli@gmail.com>
 <20170105192957.14304-8-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170105192957.14304-8-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, vivien.didelot@savoirfairelinux.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 05, 2017 at 11:29:56AM -0800, Florian Fainelli wrote:
> Utilize the new DSA binding, introduced with commit 8c5ad1d6179d ("net: dsa:
> Document new binding"). The legacy binding node is kept included, but is marked
> disabled.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
