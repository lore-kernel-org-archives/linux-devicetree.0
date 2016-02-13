From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2 v2] devicetree: Add DTS file to support the Nexus7
 2013 (flo) device.
Date: Fri, 12 Feb 2016 22:06:34 -0800
Message-ID: <20160213060634.GI15783@tuxbot>
References: <CAL_JsqL1koD3OWM4-cqEOJUz-yuZuUeg1tmp6V39mPE0zrNPgg@mail.gmail.com>
 <1454700065-16256-1-git-send-email-john.stultz@linaro.org>
 <CALAqxLXCy9QHriAqP1VK-7ApYhSk+91Rfp5znt=BK_4k96k2AQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALAqxLXCy9QHriAqP1VK-7ApYhSk+91Rfp5znt=BK_4k96k2AQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>, Andy Gross <agross@codeaurora.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Vinay Simha BN <simhavcs@gmail.com>, Stephen Boyd <stephen.boyd@linaro.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 12 Feb 21:16 PST 2016, John Stultz wrote:

> On Fri, Feb 5, 2016 at 11:21 AM, John Stultz <john.stultz@linaro.org> wrote:
> > This patch adds a dts file to support the Nexus7 2013
> > device. Its based off of the qcom-apq8064-ifc6410.dts
> > which is similar hardware.
> >
> > Also includes some comments and context folded in
> > from Vinay Simha BN <simhavcs@gmail.com>
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Arnd Bergmann <arnd.bergmann@linaro.org>
> > Cc: Pawel Moll <pawel.moll@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> > Cc: Kumar Gala <galak@codeaurora.org>
> > Cc: Andy Gross <agross@codeaurora.org>
> > Cc: Russell King <linux@arm.linux.org.uk>
> > Cc: Vinay Simha BN <simhavcs@gmail.com>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Stephen Boyd <stephen.boyd@linaro.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Acked-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> > v2: Fix dts/dtb typeo in makefile pointed out by Rob
> 
> 
> Ping?  Is there someone I'm missing on the CC list for this? Or is
> there some special submission process?
> 

You're doing it right, sorry for not looking at this earlier.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Andy can you apply these two patches, please.

Regards,
Bjorn
