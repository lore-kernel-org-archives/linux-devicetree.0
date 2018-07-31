From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/7] dt-bindings: net: Add clock handle to Broadcom
 iProc mdio mux
Date: Tue, 31 Jul 2018 14:48:28 -0600
Message-ID: <20180731204828.GA12431@rob-hp-laptop>
References: <1532726613-6483-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532726613-6483-6-git-send-email-arun.parameswaran@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532726613-6483-6-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Fri, Jul 27, 2018 at 02:23:31PM -0700, Arun Parameswaran wrote:
> Add clock phandle, of the core clock driving the mdio block, as an
> optional property to the Broadcom iProc mdio mux.
> 
> The clock, when specified, will be used to setup the rate adjust registers
> in the mdio to derrive the mdio's operating frequency.
> 
> Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>
> ---
>  Documentation/devicetree/bindings/net/brcm,mdio-mux-iproc.txt | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
