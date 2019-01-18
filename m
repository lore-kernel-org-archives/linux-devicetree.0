From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [v2, 3/5] dt-binding: ptp_qoriq: document "fsl,extts-fifo"
 property
Date: Thu, 17 Jan 2019 17:34:34 -0800
Message-ID: <20190118013434.qwuiqi5iwo5gw2nk@localhost>
References: <20190117014936.48117-1-yangbo.lu@nxp.com>
 <20190117014936.48117-4-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190117014936.48117-4-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: Yangbo Lu <yangbo.lu@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 17, 2019 at 09:49:34AM +0800, Yangbo Lu wrote:
> Documented "fsl,extts-fifo" property.
> 
> Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
> ---
> Changes for v2:
> 	- Modified binding description.
> ---
>  .../devicetree/bindings/ptp/ptp-qoriq.txt          |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt b/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
> index c5d0e79..101fe5f 100644
> --- a/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
> +++ b/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
> @@ -17,6 +17,7 @@ Clock Properties:
>    - fsl,tmr-fiper1   Fixed interval period pulse generator.
>    - fsl,tmr-fiper2   Fixed interval period pulse generator.
>    - fsl,max-adj      Maximum frequency adjustment in parts per billion.
> +  - fsl,extts-fifo   Required if hardware uses external trigger stamp FIFO.

Does this take a Boolean value?  Please explain the semantics.

Thanks,
Richard
