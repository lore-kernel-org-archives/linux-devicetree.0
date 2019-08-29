From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCHv1 0/3] Odroid c2 missing regulator linking
Date: Fri, 30 Aug 2019 00:05:37 +0530
Message-ID: <CANAwSgShr-K-44UzdxFC7pvpTye_pbEMdS6ug1eWwYhnsVNGdQ@mail.gmail.com>
References: <20190828202723.1145-1-linux.amoon@gmail.com> <8c40f334-c723-b524-857c-73734b7d0827@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8c40f334-c723-b524-857c-73734b7d0827@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Thu, 29 Aug 2019 at 13:58, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 28/08/2019 22:27, Anand Moon wrote:
> > Below small changes help re-configure or fix missing inter linking
> > of regulator node.
> >
> > Changes based top on my prevoius series.
>
> For the serie:
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>

Thanks for your review.

> >
> > [0] https://patchwork.kernel.org/cover/11113091/
> >
> > TOOD: Add support for DVFS GXBB odroid board in next series.
>
> I'm curious how you will do this !

I was just studying you previous series on how you have implemented
this feature for C1, N2 and VIM3 boards.

[0] https://patchwork.kernel.org/cover/11114125/

I started gathering key inputs needed for this ie *clk / pwm*
like VDDCPU and VDDE clk changes.

But it looks like of the complex clk framework needed, so I leave this to the
expert like your team of developers to do this much quick and efficiently.

Best Regards,
-Anand
