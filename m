From: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH v9 5/5] dt-bindings: media: Document bindings for venus
 firmware device
Date: Wed, 19 Sep 2018 16:32:27 +0900
Message-ID: <CAPBb6MV0egcso8fDcfkvc_+Un2PKX+H=fz-1aKFRJ38ciOBd7g@mail.gmail.com>
References: <1537314192-26892-1-git-send-email-vgarodia@codeaurora.org> <1537314192-26892-6-git-send-email-vgarodia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537314192-26892-6-git-send-email-vgarodia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vgarodia@codeaurora.org
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, robh@kernel.org, mark.rutland@arm.com, Andy Gross <andy.gross@linaro.org>, Arnd Bergmann <arnd@arndb.de>, bjorn.andersson@linaro.org, Linux Media Mailing List <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 19, 2018 at 8:44 AM Vikash Garodia <vgarodia@codeaurora.org> wrote:
>
> Add devicetree binding documentation for firmware loader for video
> hardware running on qualcomm chip.
>
> Signed-off-by: Vikash Garodia <vgarodia@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/media/qcom,venus.txt | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,venus.txt b/Documentation/devicetree/bindings/media/qcom,venus.txt
> index 00d0d1b..7e04586 100644
> --- a/Documentation/devicetree/bindings/media/qcom,venus.txt
> +++ b/Documentation/devicetree/bindings/media/qcom,venus.txt
> @@ -53,7 +53,7 @@
>
>  * Subnodes
>  The Venus video-codec node must contain two subnodes representing
> -video-decoder and video-encoder.
> +video-decoder and video-encoder, and one optional firmware subnode.

I think I mentioned this in my previous review, but it would be nice
to explain in which circumstances the firmware node is optional. I.e.
it should not be specified if TrustZone is used.

>
>  Every of video-encoder or video-decoder subnode should have:
>
> @@ -79,6 +79,13 @@ Every of video-encoder or video-decoder subnode should have:
>                     power domain which is responsible for collapsing
>                     and restoring power to the subcore.
>
> +The firmware subnode must have:
> +
> +- iommus:
> +       Usage: required
> +       Value type: <prop-encoded-array>
> +       Definition: A list of phandle and IOMMU specifier pairs.
> +
>  * An Example
>         video-codec@1d00000 {
>                 compatible = "qcom,msm8916-venus";
> @@ -105,4 +112,8 @@ Every of video-encoder or video-decoder subnode should have:
>                         clock-names = "core";
>                         power-domains = <&mmcc VENUS_CORE1_GDSC>;
>                 };
> +
> +               video-firmware {
> +                       iommus = <&apps_iommu 0x10b2 0x0>;
> +               };
>         };
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
