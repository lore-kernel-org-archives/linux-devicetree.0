From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH 1/8] dt/bindings: firmware: Add Qualcomm SCM binding
Date: Sat, 23 Apr 2016 10:51:18 +0300
Message-ID: <571B2976.9070106@linaro.org>
References: <1461363432-5730-1-git-send-email-andy.gross@linaro.org>
 <1461363432-5730-2-git-send-email-andy.gross@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461363432-5730-2-git-send-email-andy.gross@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, jilai wang <jilaiw@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On 04/23/2016 01:17 AM, Andy Gross wrote:
> This patch adds the device tree support for the Qualcomm SCM firmware.
> 
> Signed-off-by: Andy Gross <andy.gross@linaro.org>
> ---
>  .../devicetree/bindings/firmware/qcom,scm.txt      | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/qcom,scm.txt
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> new file mode 100644
> index 0000000..57b9b3a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> @@ -0,0 +1,31 @@
> +QCOM Secure Channel Manager (SCM)
> +
> +Qualcomm processors include an interface to communicate to the secure firmware.
> +This interface allows for clients to request different types of actions.  These
> +can include CPU power up/down, HDCP requests, loading of firmware, and other
> +assorted actions.
> +
> +Required properties:
> +- compatible: must contain one of the following:
> + * "qcom,scm-apq8064" for APQ8064
> + * "qcom,scm-apq8084" for MSM8084

s/MSM8084/APQ8084

regards,
Stan
