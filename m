From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm64: dts: meson: add dwmac-3.70a to ethmac compatible list
Date: Fri, 24 May 2019 19:50:01 +0200
Message-ID: <CAFBinCCKA-15sFwyXpoxmqw5b4=6j1t-fdrHM7CoAojqN+ZGzQ@mail.gmail.com>
References: <20190524130817.18920-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524130817.18920-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jerome,

On Fri, May 24, 2019 at 3:08 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> After discussing with Amlogic, the Synopsys GMAC version used by
> the gx and axg family is the 3.70a. Set this is in DT
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>
>  Hi,
>
>  The same should be true for the meson8 families but I did not test
>  it which is why only the patch only address the 64bits SoC families
on one of my Meson8m2 boards:
User ID: 0x11, Synopsys ID: 0x37
-> that matches GXBB/GXL/GXM

Odroid-C1 on Kernel CI reports:
User ID: 0x10, Synopsys ID: 0x37
-> however, the public S805 datasheet mentions that it's a
"10/100/1000 MAC 3.70a" (page 120)

I don't know about Meson6 or Meson8 (as I don't have boards with these SoCs)

I'll put this on my to do list (adding the "snps,dwmac-3.70a"
compatible on Meson8b and Meson8m2)


Martin
