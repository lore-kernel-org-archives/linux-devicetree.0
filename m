From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 0/2] rtc: add new Amlogic Virtual Wake RTC
Date: Thu, 22 Aug 2019 13:52:20 -0700
Message-ID: <7hmug03ou3.fsf@baylibre.com>
References: <20190812232850.8016-1-khilman@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190812232850.8016-1-khilman@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Kevin Hilman <khilman@kernel.org> writes:

> From: Kevin Hilman <khilman@baylibre.com>
>
> Add a new driver for the virtual wake RTC on Amlogic SoCs.
>
> The RTC is virtual from the Linux side because it's a hardware timer
> managed by firmware on the secure co-processor (SCP.)  The interface
> is 1 register where a wakeup time (in seconds) is written.  The SCP then
> uses this value to program an always-on timer.

Just FYI... this was originally tested on G12A and G12B SoCs, but has
now also been tested to work unmodified on the new SM1 SoC as well.

Kevin
