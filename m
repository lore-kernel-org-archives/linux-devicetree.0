From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 4/4] ARM: DTS: Add NTC thermistor nodes as child nodes to ADC
Date: Tue, 24 Jun 2014 14:54:03 -0700
Message-ID: <CAD=FV=Wmi73S4c5TPUqnNyycQ5xX5SbYy_ES-cbbJF2Hr0tqvQ@mail.gmail.com>
References: <1403612356-23685-1-git-send-email-ch.naveen@samsung.com>
	<1403612356-23685-5-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1403612356-23685-5-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "cpgs ." <cpgs@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Tushar Behera <tushar.b@samsung.com>
List-Id: devicetree@vger.kernel.org

Naveen,

On Tue, Jun 24, 2014 at 5:19 AM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> Exynos5420 based Peach PIT and Exynos5800 based PI boards have
> 4 NTC thermistors to measure temperatures at various points on the
> board.
>
> IIO based ADC becomes the parent and NTC thermistors are the childs,
> via the HWMON interface.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Cc: Doug Anderson <dianders@chromium.org>
> ---
> This patch needs
> 1. MAX77802 PMIC device tree nodes (for ldo9)
>    https://www.mail-archive.com/devicetree@vger.kernel.org/msg31430.html
> 2. Uses the DT documentation for NTC thermistors updated with vendor-prefix
>
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |   32 ++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

* You forgot: status="okay" for the ADC.  One might question how this
patch was tested.

* Please also include this change for pi.

* We just got through the painful process of sorting this .dts file.
Please sort "&adc" alphabetically.  Kukjin: please confirm that you
will keep an eye on patches and make sure that they are sorted OK.


Other than those problems this seems to work fine to me.

-Doug
