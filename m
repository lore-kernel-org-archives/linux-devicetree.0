From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] [media] ir-hix5hd2: make hisilicon,power-syscon property
 deprecated
Date: Wed, 16 Nov 2016 07:37:04 -0600
Message-ID: <20161116133704.uj6bubfocosfljpc@rob-hp-laptop>
References: <1479195092-20090-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479195092-20090-1-git-send-email-xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bin.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Ruqiang Ju <juruqiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 15, 2016 at 03:31:32PM +0800, Jiancheng Xue wrote:
> From: Ruqiang Ju <juruqiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> 
> The clock of IR can be provided by the clock provider and controlled
> by common clock framework APIs.
> 
> Signed-off-by: Ruqiang Ju <juruqiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> ---
>  .../devicetree/bindings/media/hix5hd2-ir.txt       |  6 +++---

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/media/rc/ir-hix5hd2.c                      | 25 ++++++++++++++--------
>  2 files changed, 19 insertions(+), 12 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
