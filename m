From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/p1010rdb:update dts for pcie interrupt-map
Date: Fri, 24 Jul 2015 11:29:29 -0500
Message-ID: <1437755369.2993.243.camel@freescale.com>
References: <1437377539-15911-1-git-send-email-qiang.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437377539-15911-1-git-send-email-qiang.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhao Qiang <qiang.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-07-20 at 15:32 +0800, Zhao Qiang wrote:
> From: Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> p1010rdb-pb use the irq[4:5] for inta and intb to pcie,
> it is active-high, so set it.

What about revisions of p1010rdb other than pb?

> Signed-off-by: Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Change-Id: I29db41b4a8b5a67c18151099884edda6de4d9d1a
> Reviewed-on: http://git.am.freescale.net:8181/9915
> Tested-by: Review Code-CDREVIEW <CDREVIEW-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Reviewed-by: Xiaobo Xie <X.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Reviewed-by: Jose Rivera <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Get rid of the gerrit crud.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
