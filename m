From: Harini Katakam <harinik@xilinx.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: net: macb: Add new property for PS
 SGMII only
Date: Tue, 6 Aug 2019 11:17:11 +0530
Message-ID: <CAFcVECKp0N-82WX-mtT_J_jZ0u8C221bwLRrrSELZ1jgMKs-wA@mail.gmail.com>
References: <1564566033-676-1-git-send-email-harini.katakam@xilinx.com>
 <1564566033-676-2-git-send-email-harini.katakam@xilinx.com>
 <20190804145633.GB6800@lunn.ch> <CAFcVECL6cvCjeo+fn1NDyMDZyZXDrWyhD9djvcVXiLVLiLgGeA@mail.gmail.com>
 <20190805132045.GC24275@lunn.ch> <CAFcVECLUNYRC-iZbKvvq2_XMLfXg7E10yAU5J_8GaEB3ExWRxg@mail.gmail.com>
 <CAFcVECLVHY5X=wctxVqRqDTDyG7Zavkt5ui4RtFBLP8g8MW1SA@mail.gmail.com> <20190805171639.GV24275@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190805171639.GV24275@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Harini Katakam <harini.katakam@xilinx.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, David Miller <davem@davemloft.net>, Claudiu Beznea <claudiu.beznea@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Mon, Aug 5, 2019 at 10:47 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Even with the use of this interrupt, the link status actions (link print and
> > netif ops) will still be required. And also the need for macb_open to
> > proceed without phydev. Could you please let me know if that is acceptable
> > to patch or if there's a cleaner way to
> > report this link status?
>
> It sounds like you need to convert to phylink, so you get full sfp
> support. phylib does not handle hotplug of PHYs.
>
> Please look at the comments Russell gave the last time this was
> attempted.

Yes, I looked at the comments from Russell and wasn't sure if this
case qualified for phylink.

Regards,
Harini
