From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/1] Add R8A77970/Eagle I2C support
Date: Fri, 17 Nov 2017 00:06:16 +0300
Message-ID: <aec5b863-3f0c-1b64-c26c-70b4aa0c5dd8@cogentembedded.com>
References: <20171116205647.152964720@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171116205647.152964720-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Content-Language: en-MW
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/16/2017 11:56 PM, Sergei Shtylyov wrote:

> Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20171113-v4.14' tag. We're adding the R8A77970 I2C nodes
> and then describing the PCA9654 I/O expander connected to the I2C0 bus.
> These patches depend on the R8A77970/Eagle PFC suport patchset in order
> to apply/compile.
> 
> [1/2] arm64: dts: renesas: r8a77970: add I2C support
> [2/2] arm64: dts: renesas: eagle: add I2C support

    Sorry, my command line got messed up. I'll post the full series now.

WBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
