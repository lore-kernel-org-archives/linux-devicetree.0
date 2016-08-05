From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v4 2/3] ARM: davinci_all_defconfig: enable RTC driver as
 module
Date: Fri, 05 Aug 2016 16:45:34 -0700
Message-ID: <m2eg62kcf5.fsf@baylibre.com>
References: <20160804144332.4841-1-kbeldan@baylibre.com>
 <20160805202951.2848-1-kbeldan@baylibre.com>
 <20160805202951.2848-3-kbeldan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160805202951.2848-3-kbeldan@baylibre.com> (Karl Beldan's
 message of "Fri, 5 Aug 2016 20:29:50 +0000")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Karl Beldan <kbeldan@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, karl.beldan+oss@gmail.com, Sekhar Nori <nsekhar@ti.com>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Karl Beldan <kbeldan@baylibre.com> writes:

> This driver handles the RTC of most davinci SoCs.
>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Karl Beldan <kbeldan@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Tested on da850-lcdk using tools/testing/selftests/timers/rtctest.c:

/ # ./rtctest

                        RTC Driver Test Example.

Counting 5 update (1/sec) interrupts from reading /dev/rtc0: 1 2 3 4 5
Again, from using select(2) on /dev/rtc: 1 2 3 4 5

Current RTC date/time is 1-1-2000, 00:00:25.
Alarm time now set to 00:00:30.
Waiting 5 seconds for alarm... okay. Alarm rang.

Periodic IRQ rate is 1Hz.
Counting 20 interrupts at:
2Hz:     1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
4Hz:     1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
8Hz:     1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
16Hz:    1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
32Hz:    1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
64Hz:    1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20

                         *** Test complete ***
