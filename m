From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] ARM: dts: meson8b: add ethernet fifo sizes
Date: Tue, 23 Jul 2019 21:56:43 +0200
Message-ID: <CAFBinCBefuCvTL0E_zf=EQDLyTjE5sQD-TkHNj2vQ2UOCsmtkA@mail.gmail.com>
References: <20190718093623.23598-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718093623.23598-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 11:36 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> If unspecified in DT, the fifo sizes are not automatically detected by
> the dwmac1000 dma driver and the reported fifo sizes default to 0.
> Because of this, flow control will be turned off on the device.
>
> Add the fifo sizes provided by the datasheet in the SoC in DT so
> flow control may be enabled if necessary.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

I wonder if this "fixes" some of the performance issues on Odroid-C1
testing this is now on my TODO-list for the weekend
