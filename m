From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/9] Broadcom Cygnus device tree changes
Date: Tue, 22 Sep 2015 17:58:07 -0700
Message-ID: <5601F91F.1020307@gmail.com>
References: <1442873570-20947-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442873570-20947-1-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 21/09/15 15:12, Ray Jui wrote:
> This patch series cleans up the Broadcom Cygnus device tree files and makes it
> more consistent with the rest of Broadcom iProc device tree files. This patch
> series also enables various peripherals on Cygnus boards. They include:
> 
> bcm11360_entphn:
> NAND
> 
> bcm958300k:
> touchscreen
> 
> bcm958305k:
> I2C, PCIe, NAND, touchscreen
> 
> Code is based on v4.3-rc1 and is available on GITHUB:
> https://github.com/Broadcom/cygnus-linux/tree/cygnus-dt-v3
> 
> Changes from V2:
>  - Drop PCIe device node change that removes the I/O resource
>  - Set up appropriate address range for the 'core' bus
>  - Rename the 'soc' bus node to 'axi'
>  - Remove incorrect 3rd compatible string 'brcm,brcmnand' in the NAND node
> 
> Chages from V1:
>  - Break the major clean up change into separate patches

Series applied, thanks!
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
