Return-Path: <robherring2@gmail.com>
Date: Tue, 3 Jul 2018 16:45:24 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] Documentation: uartlite: Add clock to the binding
Message-ID: <20180703224524.GA12545@rob-hp-laptop>
References: <1530102225-6459-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1530102225-6459-4-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530102225-6459-4-git-send-email-shubhrajyoti.datta@xilinx.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, shubhrajyoti.datta@gmail.com
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 27, 2018 at 05:53:45PM +0530, Shubhrajyoti Datta wrote:
> Add clock to the binding

Just squash this into the previous patch. Bindings should be complete, 
not evolving...

> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt | 2 ++
>  1 file changed, 2 insertions(+)
