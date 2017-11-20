From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: Add an enable method to RISC-V
Date: Mon, 20 Nov 2017 15:47:09 -0600
Message-ID: <20171120214709.oss7rrtijw2cyjmw@rob-hp-laptop>
References: <20171120195022.2307-1-palmer@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171120195022.2307-1-palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 20, 2017 at 11:50:22AM -0800, Palmer Dabbelt wrote:
> RISC-V doesn't currently specify a mechanism for enabling or disabling
> CPUs.  Instead, we assume that all CPUs are enabled on boot, and if
> someone wants to save power we instead put a CPU to sleep via a WFI
> loop.
> 
> This patch adds "enable-method" to the RISC-V CPU binding, which
> currently only has the value "none".  This allows us to change the
> enable method in the future.

I think "none" should just be no cpu-enable-method property.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
