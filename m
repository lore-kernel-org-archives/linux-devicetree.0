From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 0/3] net: ftgmac100: Ungate RCLK for RMII on ASPEED MACs
Date: Tue, 8 Oct 2019 17:38:05 -0700
Message-ID: <938706da-d329-c4aa-fcce-2d390a4e98f7@gmail.com>
References: <20191008115143.14149-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008115143.14149-1-andrew@aj.id.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, netdev@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, benh@kernel.crashing.org
List-Id: devicetree@vger.kernel.org



On 10/8/2019 4:51 AM, Andrew Jeffery wrote:
> Hello,
> 
> This series slightly extends the devicetree binding and driver for the
> FTGMAC100 to describe an optional RMII RCLK gate in the clocks property.
> Currently it's necessary for the kernel to ungate RCLK on the AST2600 in NCSI
> configurations as u-boot does not yet support NCSI (which uses the RMII).

RMII as in Reduced MII or Reverse MII in that context?

> 
> Please review!
> 
> Andrew
> 
> Andrew Jeffery (3):
>   dt-bindings: net: ftgmac100: Document AST2600 compatible
>   dt-bindings: net: ftgmac100: Describe clock properties
>   net: ftgmac100: Ungate RCLK for RMII on ASPEED MACs
> 
>  .../devicetree/bindings/net/ftgmac100.txt     |  7 ++++
>  drivers/net/ethernet/faraday/ftgmac100.c      | 35 +++++++++++++++----
>  2 files changed, 35 insertions(+), 7 deletions(-)
> 

-- 
Florian
