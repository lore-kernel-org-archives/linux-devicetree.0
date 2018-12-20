From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: net: ath10k: fix node name and device
 type in qcom ath10k example
Date: Thu, 20 Dec 2018 17:10:50 +0000 (UTC)
Message-ID: <20181220171050.27DC0602CB@smtp.codeaurora.org>
References: <1544544804-4039-2-git-send-email-bperumal@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1544544804-4039-2-git-send-email-bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:

> In qcom,ath10k documentation, ath10k is used as node name in the example of
> pci based device. Normally, node name should be class of device and not the
> model name, so fix it to node name "wifi". And remove the property device_type
> pci since only pci bridges should have this property.
> 
> Signed-off-by: Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

3 patches applied to ath-next branch of ath.git, thanks.

e5404969a335 dt-bindings: net: ath10k: fix node name and device type in qcom ath10k example
f3f587995c5a dt-bindings: net: ath10k: add new dt entry to identify external FEM
84758d4d43e9 ath10k: add support to configure BB timing over wmi

-- 
https://patchwork.kernel.org/patch/10724123/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
