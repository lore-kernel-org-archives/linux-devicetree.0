Return-Path: <robherring2@gmail.com>
Date: Mon, 19 Feb 2018 14:16:05 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: net: Add bindings for National
 Instruments XGE netdev
Message-ID: <20180219201605.f7lhgcqxpcjh2ujc@rob-hp-laptop>
References: <20180216170033.3834-1-mdf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180216170033.3834-1-mdf@kernel.org>
To: Moritz Fischer <mdf@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net
List-ID: <devicetree@vger.kernel.org>

On Fri, Feb 16, 2018 at 09:00:32AM -0800, Moritz Fischer wrote:
> This adds bindings for the NI XGE 1G/10G network device.
> 
> Signed-off-by: Moritz Fischer <mdf@kernel.org>
> ---
> 
> Changes from v2:
> - Addressed Rob's comments w.r.t to IRQ names and typo
> 
> Changes from v1:
> - Corrected from nixge -> nixge.txt
> 
> ---
>  Documentation/devicetree/bindings/net/nixge.txt | 32 +++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nixge.txt

Reviewed-by: Rob Herring <robh@kernel.org>
