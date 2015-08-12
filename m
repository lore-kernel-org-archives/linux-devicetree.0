From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] powerpc/85xx: Add binding for SCFG
Date: Wed, 12 Aug 2015 10:27:33 -0500
Message-ID: <1439393253.4099.87.camel@freescale.com>
References: <1439364555-1996-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439364555-1996-1-git-send-email-dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dongsheng Wang <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-08-12 at 15:29 +0800, Dongsheng Wang wrote:
> From: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> SCFG provides SoC specific configuration and status registers for
> the chip. Add this for powerpc platform.
> 
> Signed-off-by: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> *V2*
> - Remove scfg description in board.txt and create scfg.txt for scfg.
> - Change "fsl,<board>-scfg" to "fsl,<chip>-scfg"

If you want me to apply these patches they need to be sent to 
linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsieG/Ez6ZCGd0@public.gmane.org

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
