Return-Path: <robherring2@gmail.com>
Date: Mon, 16 Jul 2018 11:52:21 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2 5/5] dt-bindings: serial: Add clock to the binding for
 uartlite
Message-ID: <20180716175221.GA8257@rob-hp-laptop>
References: <1531477810-23346-1-git-send-email-shubhrajyoti.datta@gmail.com>
 <1531477810-23346-5-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531477810-23346-5-git-send-email-shubhrajyoti.datta@gmail.com>
To: shubhrajyoti.datta@gmail.com
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jacmet@sunsite.dk, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 13, 2018 at 04:00:10PM +0530, shubhrajyoti.datta@gmail.com wrote:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> 
> Add clock to the binding for uartlite
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt | 2 ++
>  1 file changed, 2 insertions(+)

While driver features can be split to different patches, bindings should 
not. So please combine this with the 1st patch.

Rob
