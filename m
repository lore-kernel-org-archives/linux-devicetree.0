From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: pm8998: Add die temperature
 channel node to the ADC
Date: Thu, 6 Sep 2018 14:22:06 -0700
Message-ID: <20180906212206.GE22824@google.com>
References: <20180906210454.247219-1-mka@chromium.org>
 <20180906210454.247219-4-mka@chromium.org>
 <CAD=FV=WLcgKQWAp8HnBFZhZ4+32keMANcYJ+nGquePqsOnjJ7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WLcgKQWAp8HnBFZhZ4+32keMANcYJ+nGquePqsOnjJ7A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 06, 2018 at 02:10:43PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Sep 6, 2018 at 2:04 PM, Matthias Kaehlcke <mka@chromium.org> wrote:
> > Add a channel node for the die temperature to the ADC.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> 
> Double-SoB?

I must have run 'amend' with '-s' out of habit, which wasn't the right
thing to do in this case :/

> ...presumably Andy can remove that when he lands and doesn't need a re-post...

Andy, in case you need me to repost let me know.

Thanks

Matthias
