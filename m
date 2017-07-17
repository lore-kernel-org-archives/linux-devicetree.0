From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/7] dt-bindings: phy: qmp: Add output-clock-names
Date: Mon, 17 Jul 2017 15:15:08 -0500
Message-ID: <20170717201508.2sng5aywcxsitisb@rob-hp-laptop>
References: <1500293043-1887-1-git-send-email-varada@codeaurora.org>
 <1500293043-1887-2-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1500293043-1887-2-git-send-email-varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 17, 2017 at 05:33:57PM +0530, Varadarajan Narayanan wrote:
> The phy outputs a clock that will act as the parent for
> the phy's pipe clock. Add the name of this clock to the
> lane's DT node.
> 
> Signed-off-by: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
