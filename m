From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] usb: dwc3: Add avoiding vbus glitch happen during
 xhci  reset
Date: Tue, 26 Feb 2019 10:39:48 -0600
Message-ID: <20190226163948.GA8854@bogus>
References: <20190226070016.27372-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190226070016.27372-1-ran.wang_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yang Li <pku.leo@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ran Wang <ran.wang_1@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, 26 Feb 2019 06:59:21 +0000, Ran Wang wrote:
> When DWC3 is set to host mode by programming register DWC3_GCTL, VBUS
> (or its control signal) will turn on immediately on related Root Hub
> ports. Then the VBUS will be de-asserted for a little while during xhci
> reset (conducted by xhci driver) for a little while and back to normal.
> 
> This VBUS glitch might cause some USB devices emuration fail if kernel
> boot with them connected. One SW workaround which can fix this is to
> program all PORTSC[PP] to 0 to turn off VBUS immediately after setting
> host mode in DWC3 driver(per signal measurement result, it will be too
> late to do it in xhci-plat.c or xhci.c).
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Changes in v3:
>   - None
> 
> Changes in v2:
>   - Correct typos
>   - Shorten the name to snps,host-vbus-glitches
> 
>  Documentation/devicetree/bindings/usb/dwc3.txt |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
