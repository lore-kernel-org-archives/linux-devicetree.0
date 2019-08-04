From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [RFC PATCH 1/2] dt-bindings: net: macb: Add new property for PS
 SGMII only
Date: Sun, 4 Aug 2019 16:56:33 +0200
Message-ID: <20190804145633.GB6800@lunn.ch>
References: <1564566033-676-1-git-send-email-harini.katakam@xilinx.com>
 <1564566033-676-2-git-send-email-harini.katakam@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1564566033-676-2-git-send-email-harini.katakam@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Harini Katakam <harini.katakam@xilinx.com>
Cc: nicolas.ferre@microchip.com, davem@davemloft.net, claudiu.beznea@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, michal.simek@xilinx.com, harinikatakamlinux@gmail.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 03:10:32PM +0530, Harini Katakam wrote:
> Add a new property to indicate when PS SGMII is used with NO
> external PHY on board.

Hi Harini

What exactly is you use case? Are you connecting to a Ethernet switch?
To an SFP cage with a copper module?

   Andrew
