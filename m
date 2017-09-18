From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC RESEND 0/3] Add support for Hisilicon Hi3521A SoC
Date: Mon, 18 Sep 2017 12:55:20 +0200
Message-ID: <20170918105520.GA2837@kroah.com>
References: <20170917082327.10058-1-hanetzer@startmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170917082327.10058-1-hanetzer@startmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: "Marty E. Plummer" <hanetzer@startmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, xuejiancheng@hisilicon.com, leo.yan@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, wenpan@hisilicon.com, robh+dt@kernel.org, linux@armlinux.org.uk, sboyd@codeaurora.org, xuwei5@hisilicon.com, zhangfei.gao@linaro.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

On Sun, Sep 17, 2017 at 03:23:24AM -0500, Marty E. Plummer wrote:
> Greetings,
> 
> I'd like the community's feedback on the following patchset. I've attempted to
> split my changes up in what I believe to be a sensible setup.
> 
> The device I'm working against is the 'SamsungSV SDR-B74301' HD CCTV surveillance
> system, which uses a Hisilicon Hi3521A arm SoC as its basis.
> 
> Resending due to a typo, s/primcell/primecell/
> 
> Marty E. Plummer (3):
>   clk: hisilicon: add CRG driver Hi3521A SoC
>   arm: hisi: enable Hi3521A SoC
>   arm: dts: add Hi3521A dts

Seems reasonable to me, but I'll let the clk maintainers/developers give
you a better review...

thanks,

greg k-h
