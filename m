From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] doc: dt: bindings: usb: dwc3: Update entries for
 disabling U1 and U2
Date: Mon, 13 May 2019 12:31:37 -0500
Message-ID: <20190513173137.GA20313@bogus>
References: <1557472048-10536-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <1557472048-10536-2-git-send-email-anurag.kumar.vulisha@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557472048-10536-2-git-send-email-anurag.kumar.vulisha@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "Claus H. Stovgaard" <cst@phaseone.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, v.anuragkumar@gmail.com, Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Fri, 10 May 2019 12:37:26 +0530, Anurag Kumar Vulisha wrote:
> This patch updates the documentation with the information related
> to the quirks that needs to be added for disabling the link entering
> into the U1 and U2 states
> 
> Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
> ---
>  Changes in v3:
> 	-None
> 
>  Changes in v2
> 	1. As suggested by Thinh Nguyen changed the "snps,dis_u1_entry_quirk"
> 	   to "snps,dis-u1-entry-quirk"
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
