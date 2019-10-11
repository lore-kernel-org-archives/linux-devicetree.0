From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: net: ftgmac100: Describe clock
 properties
Date: Fri, 11 Oct 2019 12:02:03 -0500
Message-ID: <20191011170203.GA16724@bogus>
References: <20191010020756.4198-1-andrew@aj.id.au>
 <20191010020756.4198-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191010020756.4198-3-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: netdev@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, benh@kernel.crashing.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, 10 Oct 2019 12:37:55 +1030, Andrew Jeffery wrote:
> Critically, the AST2600 requires ungating the RMII RCLK if e.g. NCSI is
> in use.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Joel Stanley <joel@jms.id.au>
> ---
>  Documentation/devicetree/bindings/net/ftgmac100.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
