Return-Path: <robherring2@gmail.com>
Date: Sun, 11 Nov 2018 16:32:35 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/3] usb: dwc3: Add disabling of start_transfer
 failure quirk
Message-ID: <20181111223235.GA18660@bogus>
References: <cover.1541707248.git.thinhn@synopsys.com>
 <ead428b935b52df74dbe386185e1b8298b0135b4.1541707248.git.thinhn@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ead428b935b52df74dbe386185e1b8298b0135b4.1541707248.git.thinhn@synopsys.com>
To: Thinh Nguyen <thinh.nguyen@synopsys.com>
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Nov 08, 2018 at 12:06:57PM -0800, Thinh Nguyen wrote:
> DWC_usb31 peripheral v1.70a-ea06 and prior needs a SW workaround for
> isoc START TRANSFER command failure. However, some affected versions may
> have RTL patches to fix this without a SW workaround. Add this quirk to
> disable the SW workaround when it is not needed.
> 
> Synopsys STAR 9001202023: Wrong microframe number for isochronous IN
> endpoints.
> 
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
