From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v6 1/4] arm64: arch_timer: Add device tree binding for
 A-008585 erratum
Date: Fri, 23 Sep 2016 15:41:53 +0100
Message-ID: <57E53F31.8000509@arm.com>
References: <1474533318-7796-1-git-send-email-oss@buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474533318-7796-1-git-send-email-oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/09/16 09:35, Scott Wood wrote:
> This erratum describes a bug in logic outside the core, so MIDR can't be
> used to identify its presence, and reading an SoC-specific revision
> register from common arch timer code would be awkward.  So, describe it
> in the device tree.
> 
> Signed-off-by: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/arch_timer.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
