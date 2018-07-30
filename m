From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 4/7] net: phy: Disable external master access in bcm
 mdio mux driver
Date: Mon, 30 Jul 2018 15:51:03 -0700
Message-ID: <bf2a03e1-f4af-130d-83cb-641e5bcf680d@gmail.com>
References: <1532726613-6483-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532726613-6483-5-git-send-email-arun.parameswaran@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532726613-6483-5-git-send-email-arun.parameswaran@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 07/27/2018 02:23 PM, Arun Parameswaran wrote:
> Configure the scan control register in the Broadcom iProc
> mdio mux driver to disable access to external master.
> 
> In some SoC's, the scan control register defaults to an incorrect
> value.
> 
> Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
--
Florian
