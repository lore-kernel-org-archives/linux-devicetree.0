From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH 1/2] dt-bindings: drm/msm: Update bindings for MDP5
Date: Sat, 17 Oct 2015 20:19:11 -0700
Message-ID: <CAJAp7OhSLFHAdg9POwfhFRU2NmYS8Oc-Zpn8-UCdLfpBWepbdw@mail.gmail.com>
References: <1444997172-9308-1-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1444997172-9308-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: Andy Gross <agross@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 16, 2015 at 5:06 AM, Archit Taneja <architt@codeaurora.org> wrote:
> MDP5 has a different compatible string (which causes checkpatch warnings
> when we try to add MDP5 device nodes). It also has different list of
> clocks.
>
> Update the bindings for MDP5.
>
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/drm/msm/mdp.txt | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/drm/msm/mdp.txt b/Documentation/devicetree/bindings/drm/msm/mdp.txt
> index 1a0598e..e926daa 100644
> --- a/Documentation/devicetree/bindings/drm/msm/mdp.txt
> +++ b/Documentation/devicetree/bindings/drm/msm/mdp.txt
> @@ -3,18 +3,27 @@ Qualcomm adreno/snapdragon display controller
>  Required properties:
>  - compatible:
>    * "qcom,mdp" - mdp4
> +  * "qcom,mdss_mdp" - mdp5

Wouldn't it be better to name these "qcom,mdp4" and "qcom,mdp5" so
that we don't have to rely on some magic detection mechanism to
support future versions?

Regards,
Bjorn
