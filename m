From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: net: ath10k: add new dt entry to
 identify external FEM
Date: Mon, 10 Dec 2018 21:27:08 -0600
Message-ID: <20181211032708.GA14508@bogus>
References: <1544466691-11821-1-git-send-email-bperumal@codeaurora.org>
 <1544466691-11821-3-git-send-email-bperumal@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1544466691-11821-3-git-send-email-bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 11 Dec 2018 00:01:30 +0530, Bhagavathi Perumal S wrote:
> This adds new dt entry ext-fem-name, it is used by ath10k driver
> to select correct timing parameters and configure it in target wifi hardware.
> The Front End Module(FEM) normally includes tx power amplifier(PA) and
> rx low noise amplifier(LNA). The default timing parameters like tx end to
> PA off timing values were fine tuned for internal FEM used in reference
> design. And these timing values can not be same if ODM modifies hardware
> design with different external FEM. This DT entry helps to choose correct
> timing values in driver if different external FEM hardware used.
> 
> Signed-off-by: Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
