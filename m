Return-Path: <robherring2@gmail.com>
Date: Fri, 20 Jul 2018 07:49:02 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: can: xilinx_can: add Xilinx CAN FD
 bindings
Message-ID: <20180720134902.GA30085@rob-hp-laptop>
References: <20180706141817.19729-1-anssi.hannula@bitwise.fi>
 <20180706141817.19729-2-anssi.hannula@bitwise.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180706141817.19729-2-anssi.hannula@bitwise.fi>
To: Anssi Hannula <anssi.hannula@bitwise.fi>
Cc: Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Michal Simek <michal.simek@xilinx.com>, linux-can@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 06, 2018 at 05:18:15PM +0300, Anssi Hannula wrote:
> Add compatible string and new attributes to support the Xilinx CAN FD
> core.
> 
> Unlike the previously documented Xilinx CAN cores, the CAN FD core has
> TX mailboxes instead of TX FIFO, and optionally RX mailboxes instead of
> RX FIFO (selected at core generation time, not switchable at runtime).
> Add "tx-mailbox-count" and "rx-mailbox-count" to specify the mailbox
> counts instead of reusing "tx-fifo-depth" and "rx-fifo-depth".
> 
> The RX FIFO depth is constant 32, but allow it to be specified via
> "rx-fifo-depth" to match DT usage with Zynq CAN (which has constant RX
> FIFO of depth of 64).
> 
> v2: Remove unnecessary "rx-mode" DT property.
> 
> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
> Cc: Michal Simek <michal.simek@xilinx.com>
> ---
>  .../devicetree/bindings/net/can/xilinx_can.txt     | 35 ++++++++++++++++------
>  1 file changed, 26 insertions(+), 9 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
