From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: media: i2c: Fix external clock frequency
 for OV5645
Date: Sat, 17 Nov 2018 09:48:06 -0600
Message-ID: <20181117154806.GA11193@bogus>
References: <20181114121338.28026-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181114121338.28026-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: mchehab@kernel.org, robh+dt@kernel.org, todor.tomov@linaro.org, hansverk@cisco.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, 14 Nov 2018 17:43:38 +0530, Manivannan Sadhasivam wrote:
> Commit "4adb0a0432f4 media: ov5645: Supported external clock is 24MHz"
> modified the external clock frequency to be 24MHz instead of the
> 23.88MHz in driver. Hence, modify the frequency value in binding.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> 
> Changes in v2:
> 
> * Removed the wording about supported frequency since the hardware is
>   capable of accepting freq range from 6-27MHz.
> 
>  Documentation/devicetree/bindings/media/i2c/ov5645.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
