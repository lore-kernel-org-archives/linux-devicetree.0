From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv3 1/2] gpio: xilinx: dt-binding: Add clock node
Date: Mon, 14 Nov 2016 19:44:41 -0600
Message-ID: <20161115014441.ne5ru2lhz3rz57b4@rob-hp-laptop>
References: <1478757365-3311-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478757365-3311-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, soren.brinkmann@xilinx.com, michal.simek@xilinx.com, shubhrajyoti.datta@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Nov 10, 2016 at 11:26:04AM +0530, Shubhrajyoti Datta wrote:
> Add the clock node to the dt binding.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v2: 
> Make clocks optional
> Add clock name
> v3:
> No change
> 
>  .../devicetree/bindings/gpio/gpio-xilinx.txt       |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
