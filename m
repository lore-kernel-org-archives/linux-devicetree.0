From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: qcom: Support GLINK intents
Date: Fri, 27 Oct 2017 09:38:28 -0500
Message-ID: <20171027142342.wuxzdyns27fmxajs@rob-hp-laptop>
References: <1509056936-26578-1-git-send-email-clew@codeaurora.org>
 <1509056936-26578-2-git-send-email-clew@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1509056936-26578-2-git-send-email-clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Lew <clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, aneela-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, smaliyap-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 26, 2017 at 03:28:54PM -0700, Chris Lew wrote:
> Virtual GLINK channels may know what throughput to expect from a
> remoteproc. An intent advertises to the remoteproc this channel is
> ready to receive data. Allow a channel to define the size and amount of
> intents to be prequeued.
> 
> Signed-off-by: Chris Lew <clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
> 
> Changes since v1:
> - Change intents property to qcom,intents and update example
> - Change second sentence in definition to better describe usage
> 
>  Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
