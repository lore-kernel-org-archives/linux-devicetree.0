From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V5 1/4] arm64: dts: Add basic DT to support Spreadtrum's SP9860G
Date: Thu, 27 Apr 2017 21:56:34 +0200
Message-ID: <CAK8P3a1igaayFWFES85bJ4riFOHKhVURT3CRnAHKa1FkV6oQ-Q@mail.gmail.com>
References: <20170419142425.GB12105@localhost> <1492746440-11071-1-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492746440-11071-1-git-send-email-chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?B?T3Jzb24gWmhhaSAo57+f5LqsKQ==?= <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 21, 2017 at 5:47 AM, Chunyan Zhang
<chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:
> From: Orson Zhai <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
>
> SC9860G is a 8 cores of A53 SoC with 4G LTE support SoC from Spreadtrum.
>
> According to regular hierarchy of sprd dts, whale2.dtsi contains SoC
> peripherals IP nodes, sc9860.dtsi contains stuff related to ARM core stuff
> and sp9860g dts is for the board level.
>
> Signed-off-by: Orson Zhai <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> Signed-off-by: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied to next/dt64 now, thanks!

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
