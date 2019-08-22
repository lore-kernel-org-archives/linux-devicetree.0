From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 2/2] rtc: Add Amlogic Virtual Wake RTC
Date: Thu, 22 Aug 2019 23:11:47 +0200
Message-ID: <20190822211147.GB27031@piout.net>
References: <20190812232850.8016-1-khilman@kernel.org>
 <20190812232850.8016-3-khilman@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190812232850.8016-3-khilman@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@kernel.org>
Cc: linux-rtc@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 12/08/2019 16:28:50-0700, Kevin Hilman wrote:
> From: Neil Armstrong <narmstrong@baylibre.com>
> 
> The Amlogic Meson GX SoCs uses a special register to store the
> time in seconds to wakeup after a system suspend.
> 
> In order to be able to reuse the RTC wakealarm feature, this
> driver implements a fake RTC device which uses the system time
> to deduce a suspend delay.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> [khilman: rebase to v5.3-rc, rework and modernization]
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  MAINTAINERS                  |   1 +
>  drivers/rtc/Kconfig          |  11 +++
>  drivers/rtc/Makefile         |   1 +
>  drivers/rtc/rtc-meson-vrtc.c | 156 +++++++++++++++++++++++++++++++++++
>  4 files changed, 169 insertions(+)
>  create mode 100644 drivers/rtc/rtc-meson-vrtc.c
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
