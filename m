From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/4] Get exynos adc driver running on on exynos5250-snow
Date: Tue, 12 Mar 2013 16:13:10 -0700
Message-ID: <1363129994-10438-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This set of patches is based on Naveen Krishna Chatradhi's recent work
(some of which is still in-flight) and does the final touches to get
things working on exynos5250-snow (the ARM Chromebook).

These patches were tested on next-20130312 (which includes support for
the common clock framework on exynos) plus the current linux-iio/togreg:
  95783f2 iio: adc: add exynos adc driver under iio framwork
  298489f iio:common: Use spi_sync_transfer() in STMicroelectronics ...
  1d9a4cb IIO ADC support for AD7923
  9a282b0 iio: Add OF support
  3d277fc3 staging:iio: Remove adt7410 driver

...plus Naveen's recent ADC cleanup and NTC thermistor patch.

Doug Anderson (4):
  iio: adc: Document the regulator/clocks for exynos-adc
  iio: adc: Add dt support for turning on the phy in exynos-adc
  ARM: dts: Add adc to exynos5250 device tree file
  ARM: dts: Add adc and thermistors for exynos5250-snow

 .../devicetree/bindings/arm/samsung/exynos-adc.txt | 12 +++++++--
 arch/arm/boot/dts/cros5250-common.dtsi             |  4 +++
 arch/arm/boot/dts/exynos5250-snow.dts              | 31 ++++++++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi                  | 11 ++++++++
 drivers/iio/adc/exynos_adc.c                       | 14 +++++++++-
 5 files changed, 69 insertions(+), 3 deletions(-)

-- 
1.8.1.3
