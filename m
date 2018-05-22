From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next v2 1/7] net: dsa: qca8k: Add QCA8334 binding
 documentation
Date: Tue, 22 May 2018 14:40:39 -0500
Message-ID: <20180522194039.GA15413@rob-hp-laptop>
References: <1526987792-56861-1-git-send-email-michal.vokac@ysoft.com>
 <1526987792-56861-2-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1526987792-56861-2-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <vokac.m@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, mark.rutland@arm.com, davem@davemloft.net, michal.vokac@ysoft.com
List-Id: devicetree@vger.kernel.org

On Tue, May 22, 2018 at 01:16:26PM +0200, Michal Vokáč wrote:
> Add support for the four-port variant of the Qualcomm QCA833x switch.
> 
> The CPU port default link settings can be reconfigured using
> a fixed-link sub-node.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
> Changes in v2:
>  - Add commit message and document fixed-link binding.
> 
>  .../devicetree/bindings/net/dsa/qca8k.txt          | 23 +++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.txt b/Documentation/devicetree/bindings/net/dsa/qca8k.txt
> index 9c67ee4..15b9057 100644
> --- a/Documentation/devicetree/bindings/net/dsa/qca8k.txt
> +++ b/Documentation/devicetree/bindings/net/dsa/qca8k.txt
> @@ -2,7 +2,10 @@
>  
>  Required properties:
>  
> -- compatible: should be "qca,qca8337"
> +- compatible: should be one of:
> +    "qca,qca8334"
> +    "qca,qca8337"
> +
>  - #size-cells: must be 0
>  - #address-cells: must be 1
>  
> @@ -14,6 +17,20 @@ port and PHY id, each subnode describing a port needs to have a valid phandle
>  referencing the internal PHY connected to it. The CPU port of this switch is
>  always port 0.
>  
> +A CPU port node has the following optional property:

s/property/node/

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
