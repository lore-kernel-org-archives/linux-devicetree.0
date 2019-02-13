From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: connector: Add vbus-supply property
Date: Wed, 13 Feb 2019 15:44:22 -0600
Message-ID: <20190213214422.GA31951@bogus>
References: <20190207111734.24171-1-jorge.ramirez-ortiz@linaro.org>
 <20190207111734.24171-3-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190207111734.24171-3-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: jorge.ramirez-ortiz@linaro.org, robh@kernel.org, bjorn.andersson@linaro.org, swboyd@chromium.org, andy.gross@linaro.org, shawn.guo@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, jackp@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

On Thu,  7 Feb 2019 12:17:32 +0100, Jorge Ramirez-Ortiz wrote:
> Some phys might need to control their VBUS regulators while not being
> supplied by them. If such support is required, use the vbus-supply
> property in the connector to retrieve the regulator.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  Documentation/devicetree/bindings/connector/usb-connector.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
