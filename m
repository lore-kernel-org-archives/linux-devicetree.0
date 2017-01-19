From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v9 0/4] arm64: arch_timer: Add workaround for
 hisilicon-161010101 erratum
Date: Thu, 19 Jan 2017 13:49:59 +0000
Message-ID: <23512329-e8d9-4b4f-c460-4d769ef7102e@arm.com>
References: <1484832916-7248-1-git-send-email-dingtianhong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484832916-7248-1-git-send-email-dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 19/01/17 13:35, Ding Tianhong wrote:
> Erratum Hisilicon-161010101 says that the ARM generic timer counter "has the
> potential to contain an erroneous value when the timer value changes".
> Accesses to TVAL (both read and write) are also affected due to the implicit counter
> read.  Accesses to CVAL are not affected.

Please. 3 series in 2 hours is not fun, and is not helping your case
either. Give us the time to properly review your patches, and wait until
we ask you to respin if we think that this is required.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
