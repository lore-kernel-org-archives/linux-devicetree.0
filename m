From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V3 1/2] powerpc/fsl: Add PCI node in device tree of
 bsc9132qds
Date: Wed, 4 Nov 2015 21:09:14 -0600
Message-ID: <1446692954.12676.42.camel@freescale.com>
References: <1446691975-8965-1-git-send-email-Zhiqiang.Hou@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446691975-8965-1-git-send-email-Zhiqiang.Hou-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhiqiang Hou <Zhiqiang.Hou-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Hou Zhiqiang <B48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-11-05 at 10:52 +0800, Zhiqiang Hou wrote:
> From: Harninder Rai <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Signed-off-by: Harninder Rai <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Reviewed-by: Zang Tiefei-R61911 <tie-fei.zang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Reviewed-by: Kushwaha Prabhakar-B32579 <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Reviewed-by: Fleming Andrew-AFLEMING <AFLEMING-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Tested-by: Fleming Andrew-AFLEMING <AFLEMING-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Hou Zhiqiang <B48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> V3:
>  - Remove gerrit stuff.

No, you didn't remove all of the Gerrit stuff.  Get rid of all the Reviewed-
by and Tested-by since they are not relevant to this context.  Hitting "+1" 
in Gerrit to allow a patch to go into the SDK tree a few years ago is not the 
same as reviewing it for inclusion in mainline Linux today.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
