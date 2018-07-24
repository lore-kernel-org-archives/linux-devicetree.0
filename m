Return-Path: <robherring2@gmail.com>
Date: Tue, 24 Jul 2018 17:23:49 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv5 4/4] dt-bindings: serial: Add binding for uartlite
Message-ID: <20180724232349.GA21550@rob-hp-laptop>
References: <1532173747-19115-1-git-send-email-shubhrajyoti.datta@gmail.com>
 <1532173747-19115-5-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532173747-19115-5-git-send-email-shubhrajyoti.datta@gmail.com>
To: shubhrajyoti.datta@gmail.com
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

On Sat, Jul 21, 2018 at 05:19:07PM +0530, shubhrajyoti.datta@gmail.com wrote:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> 
> The uartlite devicetree binding was missed out.
> Add the binding documentation for uartlite that is already in use.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v2:
> lowercase for hex values
> interrupt description updated
> v3:
> squashed the clock changes
> v4:
> Updated the patch description
> and the interrupt description
> 
>  .../bindings/serial/xlnx,opb-uartlite.txt          | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt

Reviewed-by: Rob Herring <robh@kernel.org>
