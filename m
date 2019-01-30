From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 0/2] USB SS PHY for Qualcomm's QCS404
Date: Wed, 30 Jan 2019 13:58:04 -0600
Message-ID: <20190130195804.GA5908@bogus>
References: <1548761715-4004-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548761715-4004-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, jackp@codeaurora.org, andy.gross@linaro.org, swboyd@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, khasim.mohammed@linaro.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 29, 2019 at 12:35:13PM +0100, Jorge Ramirez-Ortiz wrote:
> This set adds USB SS PHY support to Qualcomm's QCS404 SoC
> The PHY is implemented using Synopsys SS PHY 1.0.0 IP
> 
> The code is losely based on Sriharsha Allenki's
> <sallenki@codeaurora.org> original implementation.
> 
> v2:
>   enable OTG mode detection
>   move vdd voltage levels to driver
>   use bulk_ control interfaces
>   ss-phy-bindings [1]
> 
> [1] ss-phy-binding discussion:
>  - qcom,dwc3-ss-usb-phy exist for a generic usb2/usb3 phy driver that
>  was never merged. Rather than trying to re-use these bindings (or
>  delete them) I  propose that we go ahead with the new separate
>  bindings for HS and SS: if  not now - investigation  in progress- in
>  the  future  it might be  possible to have again a common phy driver
>  for  which these old  bindings would be the binding agreement. 

Either use/extend the old binding or remove it if it is not being used.

Rob
