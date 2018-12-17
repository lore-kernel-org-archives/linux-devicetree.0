From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: net: ath10k: fix node name and
 device type in qcom ath10k example
Date: Mon, 17 Dec 2018 15:44:57 -0600
Message-ID: <20181217214457.GA21038@bogus>
References: <1544544804-4039-1-git-send-email-bperumal@codeaurora.org>
 <1544544804-4039-2-git-send-email-bperumal@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1544544804-4039-2-git-send-email-bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 11 Dec 2018 21:43:22 +0530, Bhagavathi Perumal S wrote:
> In qcom,ath10k documentation, ath10k is used as node name in the example of
> pci based device. Normally, node name should be class of device and not the
> model name, so fix it to node name "wifi". And remove the property device_type
> pci since only pci bridges should have this property.
> 
> Signed-off-by: Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
