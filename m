From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: Add USB DT nodes for Stingray SoC
Date: Tue, 26 Mar 2019 10:23:21 -0700
Message-ID: <20190326172321.26289-1-f.fainelli@gmail.com>
References: <1552986944-3398-1-git-send-email-srinath.mannam@broadcom.com> <1552986944-3398-4-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552986944-3398-4-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jayachandran C <jnair@caviumnetworks.com>, Tejun Heo <tj@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 19 Mar 2019 14:45:44 +0530, Srinath Mannam <srinath.mannam@broadcom.com> wrote:
> Add DT nodes for
>   - Two xHCI host controllers
>   - Two BDC Broadcom USB device controller
>   - Five USB PHY controllers
> 
> [xHCI0]      [BDC0]            [xHCI1]            [BDC1]
>    |           |                  |                 |
>   ---------------               -----------------------
>    |           |                 |         |         |
> [SS-PHY0]   [HS-PHY0]        [SS-PHY1] [HS-PHY2] [HS-PHY1]
> 
> [SS-PHY0/HS-PHY0] and [SS-PHY1/HS-PHY1] are combo PHYs has one SS and
> one HS PHYs. [HS-PHY2] is a single HS PHY.
> 
> xHCI use SS-PHY to detect SS devices and HS-PHY to detect HS/FS/LS
> devices. BDC use SS-PHY in SS mode and HS-PHY in HS mode.
> 
> xHCI0 port1 is SS-PHY0, port2 is HS-PHY0.
> xHCI1 port1 is SS-PHY1, port2 is HS-PHY2 and port3 is HS-PHY1.
> 
> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> ---

Applied to devicetree-arm64/next, thanks!
--
Florian
