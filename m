From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 0/3] ARM: NSP updates to support switch interrupts/SFP
Date: Thu, 13 Sep 2018 11:10:20 -0700
Message-ID: <5751f9e2-6056-37cc-4749-cb8509b56916@gmail.com>
References: <20180831192039.11842-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831192039.11842-1-f.fainelli@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, andrew@lunn.ch, rmk+kernel@armlinux.org.uk
List-Id: devicetree@vger.kernel.org



On 08/31/18 12:20, Florian Fainelli wrote:
> Hi all,
> 
> This patch series updates the ARM NSP DTS and BCM958625HR in order to
> support the SFP connected to port 5 on these reference boards.
> 
> I will be submitting the functional changes to drivers/net/dsa/b53 once
> net-next opens back up, but this is largely independent from getting
> these 3 patches out.

Series applied to devicetree/next.
-- 
Florian
