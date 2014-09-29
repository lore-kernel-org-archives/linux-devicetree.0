From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 0/6] Add Spreadtrum Shark64 SoC support
Date: Mon, 29 Sep 2014 16:08:03 +0200
Message-ID: <4929446.AOyTEh2uOW@wuerfel>
References: <1411992293-7729-1-git-send-email-zhang.lyra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411992293-7729-1-git-send-email-zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, artagnon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 29 September 2014 20:04:47 zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: "chunyan.zhang" <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> 
> Spreadtrum is a rapid growing chip vendor providing smart phone total solutions. 
> Shark64 is nominated as a SoC infrastructure that supports 4G/3G/2G standards based on ARMv8 multiple core architecture.
> 
> This patchset adds shark64 supports in arm64 device tree and implements the basic earlycon serial driver.

Hi Lyra and/or Chunyan,

Thanks for your submission, it's great to see another company join the
upstream submission process.

Your patches look good overall, but I have replied with a few comments
on the details that need to be worked out.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
