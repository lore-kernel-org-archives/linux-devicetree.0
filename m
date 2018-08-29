From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/4] dt-bindings: msm: Update documentation of
 qcom,llcc
Date: Wed, 29 Aug 2018 07:48:19 -0500
Message-ID: <20180829124819.GA21262@bogus>
References: <1535503347-20507-1-git-send-email-vnkgutta@codeaurora.org>
 <1535503347-20507-5-git-send-email-vnkgutta@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1535503347-20507-5-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: evgreen@chromium.org, robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, bp@alien8.de, swboyd@chromium.org, Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, 28 Aug 2018 17:42:27 -0700, Venkata Narendra Kumar Gutta wrote:
> Add reg-names and interrupts for LLCC documentation and the usage
> examples. llcc broadcast base is added in addition to llcc base,
> which is used for llcc broadcast writes.
> 
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> ---
>  .../devicetree/bindings/arm/msm/qcom,llcc.txt         | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
