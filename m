From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: Add support for msm8998
Date: Wed, 30 Jan 2019 09:42:57 -0600
Message-ID: <20190130154257.GA15568@bogus>
References: <1548106307-4762-1-git-send-email-jhugo@codeaurora.org>
 <1548106366-5042-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548106366-5042-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: mark.rutland@arm.com, balbi@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 02:32:46PM -0700, Jeffrey Hugo wrote:
> msm8998 USB has a dwc3 controller just like the existing sdm845 support.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 1 +
>  1 file changed, 1 insertion(+)

You missed my R-by.
