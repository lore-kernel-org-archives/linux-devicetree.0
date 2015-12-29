From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/4] dt-binding: remoteproc: Introduce Qualcomm WCNSS
 loader binding
Date: Tue, 29 Dec 2015 12:34:44 -0600
Message-ID: <20151229183444.GD12450@rob-hp-laptop>
References: <1451265346-14969-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1451265346-14969-4-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1451265346-14969-4-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, fengwei.yin@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

On Sun, Dec 27, 2015 at 05:15:45PM -0800, Bjorn Andersson wrote:
> The document defines the binding for a component that loads firmware for
> and boots the Qualcomm WCNSS core.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
> 
> Changes since v1:
> - Dropped custom properties for firmware-name and crash-reason
> 
>  .../bindings/remoteproc/qcom,wcnss-pil.txt         | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt

Seems reasonable to me. I'd like to see some acks from QC folks.

Acked-by: Rob Herring <robh@kernel.org>


> +- clock-names:
> +	Usage: requireduired

typo
