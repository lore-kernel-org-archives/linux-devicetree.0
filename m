From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH] arm64: dts: msm8916: drop legacy suffix for clocks used
 by MSM DRM driver
Date: Sat, 21 Jul 2018 13:51:47 -0500
Message-ID: <20180721185147.GH7404@hector.attlocal.net>
References: <20180718145258.15254-1-niklas.cassel@linaro.org>
 <CAP71WjzPxxwNp-FkUsRAP4e_+Z_q12wcLeXryk-eYdLi-WJexg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAP71WjzPxxwNp-FkUsRAP4e_+Z_q12wcLeXryk-eYdLi-WJexg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 19, 2018 at 12:53:04PM +0200, Nicolas Dechesne wrote:
> hi Niklas,
> 
> On Wed, Jul 18, 2018 at 4:53 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
> >
> > Drop legacy suffix for clocks used by MSM DRM driver.
> 
> I had the same patch locally, which I forgot to send.. so thanks for
> sending it ;)
> 
> you might want to add in the commit log:
> 
>     Since "720c3bb80235 (drm/msm: drop _clk suffix from clk names)",
> we can see such
>     messages when booting:
> 

I'll amend the log to contain that info Nicolas.

Thanks,

Andy
