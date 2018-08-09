Return-Path: <robherring2@gmail.com>
Message-ID: <5b6cc312.1c69fb81.87ce1.1389@mx.google.com>
Date: Thu, 09 Aug 2018 16:41:20 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 4/4] dt-bindigs: Update documentation of qcom,llcc
References: <1533155615-27929-1-git-send-email-vnkgutta@codeaurora.org> <1533155615-27929-5-git-send-email-vnkgutta@codeaurora.org>
In-Reply-To: <1533155615-27929-5-git-send-email-vnkgutta@codeaurora.org>
To: vnkgutta@codeaurora.org
Cc: evgreen@chromium.org, robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, bp@alien8.de
List-ID: <devicetree@vger.kernel.org>

Hi, this is an automated email from Rob's (experimental) review bot. I
found a couple of common problems with your patch. Please see below.

On Wed,  1 Aug 2018 13:33:35 -0700, Venkata Narendra Kumar Gutta wrote:
> Add reg-names and interrupts for LLCC documentation and the usage
> examples. llcc broadcast base is added in addition to llcc base,
> which is used for llcc broadcast writes.
> 
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>

The preferred subject prefix is "dt-bindings: <binding dir>: ...".

> ---
>  Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
