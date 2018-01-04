From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RECEND PATCH V7 12/12] arm64: dts: add clocks for SC9860
Date: Thu, 4 Jan 2018 17:51:29 +0100
Message-ID: <CAK8P3a0NNQYkXjYLZoPpzacc0pf8Cydv7muVigm_r9UsMqO_og@mail.gmail.com>
References: <20171207125715.16160-1-chunyan.zhang@spreadtrum.com>
 <1515049684-23481-1-git-send-email-zhang.chunyan@linaro.org> <1515049684-23481-2-git-send-email-zhang.chunyan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515049684-23481-2-git-send-email-zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 4, 2018 at 8:08 AM, Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> From: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
>
> Some clocks on SC9860 are in the same address area with syscon devices,
> those are what have a property of 'sprd,syscon' which would refer to
> syscon devices, others would have a reg property indicated their address
> ranges.
>
> Signed-off-by: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>

Applied, thanks!

     Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
