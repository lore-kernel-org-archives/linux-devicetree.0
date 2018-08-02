From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 7/8] net: phy: Add support to configure clock in
 Broadcom iProc mdio mux
Date: Wed, 1 Aug 2018 18:40:06 -0700
Message-ID: <a63d5c49-3657-c8f8-ce86-6c775a51de24@gmail.com>
References: <1533171233-14557-1-git-send-email-arun.parameswaran@broadcom.com>
 <1533171233-14557-8-git-send-email-arun.parameswaran@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533171233-14557-8-git-send-email-arun.parameswaran@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>, "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org



On 08/01/2018 05:53 PM, Arun Parameswaran wrote:
> Add support to configure the internal rate adjust register based on the
> core clock supplied through device tree in the Broadcom iProc mdio mux.
> 
> The operating frequency of the mdio mux block is 11MHz. This is derrived
> by dividing the clock to the mdio mux with the rate adjust register.
> 
> In some SoC's the default values of the rate adjust register do not yield
> 11MHz. These SoC's are required to specify the clock via the device tree
> for proper operation.
> 
> Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
