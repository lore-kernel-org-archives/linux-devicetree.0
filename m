From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH 2/2] soc: sprd: Add Spreadtrum multi-channel data transfer support
Date: Mon, 22 Apr 2019 10:30:46 +0800
Message-ID: <CAMz4kuKd4KF=62MX+Kf9mdNZhGa5zHDq-=2RceLFs-Aiqa3qqg@mail.gmail.com>
References: <f7edc4078b2d6f44ed5ad47c14dd58da5cc50f21.1555670768.git.baolin.wang@linaro.org>
 <64ca5af0373c35590d8ac9f2b62e3c9fa46e3551.1555670768.git.baolin.wang@linaro.org>
 <20190419144125.GQ2803@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190419144125.GQ2803@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, DTML <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Fri, 19 Apr 2019 at 22:50, Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Apr 19, 2019 at 06:54:32PM +0800, Baolin Wang wrote:
> > On Spreadtrum platform, the audio subsystem will use the multi-channel
> > data transfer controller to transfer sound stream between audio subsystem
> > and other AP/CP subsystem.
> >
> > It can support 10 DAC channel and 10 ADC channel, and each channel has
> > 512 bytes depth data fifo. Moreover each channel can be used DMA mode
> > or interrupt mode to transfer data.
>
> Acked-by: Mark Brown <broonie@kernel.org>

Thanks for your reviewing.

>
> However if there's no non-audio users of this DSP then it's probably
> better to just move the driver into sound/soc.

Yes, only audio will use this driver. OK, I will move it into
sound/soc if no other objections. Thanks.

-- 
Baolin Wang
Best Regards
