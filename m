From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/2] clk: meson-g12a: add cpu clock bindings
Date: Fri, 1 Mar 2019 18:05:12 +0100
Message-ID: <CAFBinCDt=BB_nAJ5P1TX0ahmOiqTaLGrqv5X4v2u62KCPw1UGQ@mail.gmail.com>
References: <20190301102140.7181-1-narmstrong@baylibre.com>
 <20190301102140.7181-2-narmstrong@baylibre.com> <CAFBinCCtmykL-ccWd9cporEOmxeUKC-RgrP3wfuSuYoAEjrGWA@mail.gmail.com>
 <d841b285-7994-fd7a-215b-13314bd0b298@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d841b285-7994-fd7a-215b-13314bd0b298@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: jbrunet@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Fri, Mar 1, 2019 at 5:43 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Martin,
>
> On 01/03/2019 16:26, Martin Blumenstingl wrote:
> > Hi Neil,
> >
> > On Fri, Mar 1, 2019 at 11:22 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> Add Amlogic G12A Family CPU clocks bindings, only export CPU_CLK since
> >> it should be the only ID used.
> > is this also true for the CPU post-dividers (APB, ATB, AXI, CPU CLK TRACE)?
>
> Do we need these to be exported ?
I'm not sure as I couldn't find more details about APB, ATB and AXI on G12A:
- APB and ATB may be needed by the CoreSight bindings
(Documentation/devicetree/bindings/arm/coresight.txt)
- AXI may be needed by the VPU driver (the S912 datasheet mentions in
OSD1_AFBCD_ENABLE: "id_fifo_thrd : unsigned , default = 64, axi id
fifo threshold")

if you don't know either then I'm fine with skipping them for now, we
can still export them later.


Martin
