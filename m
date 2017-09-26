From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 00/14] ARM: dts: sunxi: Fix DT build warnings
Date: Tue, 26 Sep 2017 15:48:17 +0800
Message-ID: <CAGb2v64AK-xifjcowUk1mp4TRwHFPOqjZR58Bd5w7Bei52T06g@mail.gmail.com>
References: <20170926072234.27481-1-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170926072234.27481-1-clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 26, 2017 at 3:22 PM, Corentin Labbe
<clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello
>
> The goal of this patch series is to have a clean DT build with W=1.
>
> Regards
>
> Changes since v1:
> - moved i2c2 unit address change from patch #2 in patch #1
>
> Changes since v2
> - added two patch for fixing pin names

The first twelve patches are good. Maxime, I think we can go ahead and
merge them, instead of having them resent again in v3?

The last two patches are not what I asked for though.

ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
