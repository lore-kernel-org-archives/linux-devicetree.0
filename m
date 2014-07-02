From: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [RFC] drm/msm: DT support for 8960/8064
Date: Wed, 02 Jul 2014 08:26:36 -0600
Message-ID: <53B4169C.2030207@codeaurora.org>
References: <1404241055-3579-1-git-send-email-robdclark@gmail.com>
Reply-To: jcrouse@codeaurora.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1404241055-3579-1-git-send-email-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/01/2014 12:57 PM, Rob Clark wrote:
> diff --git a/Documentation/devicetree/bindings/drm/msm/gpu.txt b/Documentation/devicetree/bindings/drm/msm/gpu.txt
> new file mode 100644
> index 0000000..6e33efe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/msm/gpu.txt
> @@ -0,0 +1,51 @@
> +Qualcomm adreno/snapdragon GPU
> +
> +Required properties:
> +- compatible: "qcom,adreno-3xx"

3xx won't always be the only game in town. Not that I have a better name,
just pointing out that it has a limited shelf life.

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
