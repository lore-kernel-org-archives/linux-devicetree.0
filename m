From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Add UART nodes
Date: Wed, 3 Oct 2018 15:59:13 -0700
Message-ID: <20181003225913.GK22824@google.com>
References: <20181003211239.41069-1-mka@chromium.org>
 <CAD=FV=XAqyLqyQQmM8pqPUh-ZvbxXgjSaypqGd4-orpWg3btgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=XAqyLqyQQmM8pqPUh-ZvbxXgjSaypqGd4-orpWg3btgA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 03, 2018 at 03:31:03PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Oct 3, 2018 at 2:12 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > +                       uart8: serial@a80000 {
> > +                               compatible = "qcom,geni-uart";
> > +                               reg = <0xa80000 0x4000>;
> > +                               clock-names = "se";
> > +                               clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> 
> uart8/10/11/12/13/14/15 are on GCC_QUPV3_WRAP1_S0_CLK, not WRAP0.
> 
> Everything else here looks good.  I ran my old hacky script at
> <http://crosreview.com/1091631> (mentioned in the message of commit
> 897cf34e7305 ("arm64: dts: qcom: sdm845: Add I2C, SPI, and UART9
> nodes")) after changing it to generate "qcom,geni-uart" as the
> compatible string and changing it to generate nodes for all UARTs and
> the diff looks fine.
> 
> ...so once you fix the clock reference feel free to add my Reviewed-by.

Thanks for catching this! I'll send out a fixed version soon.
