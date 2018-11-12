Return-Path: <robherring2@gmail.com>
Message-ID: <5bea0ed6.1c69fb81.e14d2.779f@mx.google.com>
Date: Mon, 12 Nov 2018 17:37:56 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] usb: dwc3: Add a property to disable USB2 LPM
References: <cover.1541642865.git.thinhn@synopsys.com> <9aa6ae1c68f7936f5f145c8f770348d76106b865.1541642865.git.thinhn@synopsys.com>
In-Reply-To: <9aa6ae1c68f7936f5f145c8f770348d76106b865.1541642865.git.thinhn@synopsys.com>
To: Thinh Nguyen <thinh.nguyen@synopsys.com>
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, 7 Nov 2018 18:10:36 -0800, Thinh Nguyen wrote:
> Add an option to disable USB2 LPM from host. There maybe cases where the
> user does not want to enable USB2 LPM (e.g. USB2 LPM is broken).
> 
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
