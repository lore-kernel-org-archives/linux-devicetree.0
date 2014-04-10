From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/4] arm: add basic support for Mediatek MT6589 boards
Date: Thu, 10 Apr 2014 09:36:40 +0200
Message-ID: <4752537.la6uZladzC@wuerfel>
References: <1397072736-10793-1-git-send-email-matthias.bgg@gmail.com>
 <1397072736-10793-4-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1397072736-10793-4-git-send-email-matthias.bgg@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, andrew@lunn.ch, linux-doc@vger.kernel.org, thierry.reding@gmail.com, heiko.stuebner@bq.com, linux@arm.linux.org.uk, daniel.lezcano@linaro.org, rmk+kernel@arm.linux.org.uk, florian.vaussard@epfl.ch, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, tglx@linutronix.de, rdunlap@infradead.org, linux-kernel@vger.kernel.org, silvio.fricke@gmail.com, galak@codeaurora.org, olof@lixom.net, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 09 April 2014 21:45:35 Matthias Brugger wrote:
> This adds a generic devicetree board file and a dtsi for boards
> based on the MT6589 SoCs from Mediatek.
> 
> Apart from the generic parts (gic, clocks) the only component
> currently supported are the timers.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Hi Matthias,

First of all, I'm really glad to see this get started, thanks for looking
into these!

Do you know how similar the MT6589 is to the later chips like MT65x2
and MT6588? What are the on-chip devices like, is it mostly licensed
IP blocks from designware and others that we already have drivers for,
or all new drivers?

> +#include <asm/hardware/cache-l2x0.h>
> +
> +static void __init mediatek_dt_init(void)
> +{
> +	l2x0_of_init(0, ~0);
> +	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
> +}

I hope that with all the cleanup work that Russell has done in the
past few weeks, we can manage to kill off the call to l2x0_of_init()
here and have it done by core architecture code instead. That would
let you have an empty machine file, unless you have other things you
will need to add in the future.

	Arnd
