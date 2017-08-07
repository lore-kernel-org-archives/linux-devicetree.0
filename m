From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/7] Add more DT nodes for Stingray SoC
Date: Mon, 7 Aug 2017 10:30:37 -0700
Message-ID: <77f099ec-5cbe-b2c9-241a-c00ea63ee3ae@gmail.com>
References: <1501303349-30007-1-git-send-email-abhishek.shah@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501303349-30007-1-git-send-email-abhishek.shah-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Shah <abhishek.shah-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/28/2017 09:42 PM, Abhishek Shah wrote:
> This is round two of adding DT nodes for Stingray SoC.
> Corresponding drivers and dt binding documents are already
> checked in the kernel and will be present in v4.14.
> 
> Abhishek Shah (1):
>   arm64: dts: Add DT node to enable BGMAC driver on Stingray
> 
> Anup Patel (3):
>   arm64: dts: Add sp804 DT nodes for Stingray SoC
>   arm64: dts: Add FlexRM DT nodes for Stingray
>   arm64: dts: Add SBA-RAID DT nodes for Stingray SoC
> 
> Srinath Mannam (2):
>   arm64: dts: Add MDIO multiplexer DT node for Stingray
>   arm64: dts: Add SATA DT nodes for Stingray SoC
> 
> Velibor Markovski (1):
>   arm64: dts: Enable stats for CCN-502 interconnect on Stingray

Series applied, thanks
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
