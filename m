From: Harini Katakam <harinik@xilinx.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: net: macb: Add new property for PS
 SGMII only
Date: Mon, 5 Aug 2019 11:45:05 +0530
Message-ID: <CAFcVECL6cvCjeo+fn1NDyMDZyZXDrWyhD9djvcVXiLVLiLgGeA@mail.gmail.com>
References: <1564566033-676-1-git-send-email-harini.katakam@xilinx.com>
 <1564566033-676-2-git-send-email-harini.katakam@xilinx.com> <20190804145633.GB6800@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190804145633.GB6800@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Harini Katakam <harini.katakam@xilinx.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, David Miller <davem@davemloft.net>, Claudiu Beznea <claudiu.beznea@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Sun, Aug 4, 2019 at 8:26 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Jul 31, 2019 at 03:10:32PM +0530, Harini Katakam wrote:
> > Add a new property to indicate when PS SGMII is used with NO
> > external PHY on board.
>
> Hi Harini
>
> What exactly is you use case? Are you connecting to a Ethernet switch?
> To an SFP cage with a copper module?

Yes, an SFP cage is the common HW target for this patch. Essentially, there
is no external PHY driver that the macb can "connect" to; if there was an
external PHY on board, its link status would also indicate when the GEM(PCS)
to external PHY link was down. But in the absence of an external PHY on
HW, PCS link status needs to be monitored and reported to users.

Regards,
Harini
