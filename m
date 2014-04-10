From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 3/4] arm: add basic support for Mediatek MT6589 boards
Date: Thu, 10 Apr 2014 11:15:49 +0200
Message-ID: <CABuKBeJ59uockVxoRdfbYQq4xy9kra7b92nNSmXBmeSj3CtzrA@mail.gmail.com>
References: <1397072736-10793-1-git-send-email-matthias.bgg@gmail.com>
 <1397072736-10793-4-git-send-email-matthias.bgg@gmail.com>
 <4752537.la6uZladzC@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4752537.la6uZladzC@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@bq.com>, Russell King <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, rmk+kernel@arm.linux.org.uk, Florian Vaussard <florian.vaussard@epfl.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Silvio F <silvio.>
List-Id: devicetree@vger.kernel.org

2014-04-10 9:36 GMT+02:00 Arnd Bergmann <arnd@arndb.de>:
> On Wednesday 09 April 2014 21:45:35 Matthias Brugger wrote:
>> This adds a generic devicetree board file and a dtsi for boards
>> based on the MT6589 SoCs from Mediatek.
>>
>> Apart from the generic parts (gic, clocks) the only component
>> currently supported are the timers.
>>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> Hi Matthias,
>
> First of all, I'm really glad to see this get started, thanks for looking
> into these!
>
> Do you know how similar the MT6589 is to the later chips like MT65x2
> and MT6588? What are the on-chip devices like, is it mostly licensed
> IP blocks from designware and others that we already have drivers for,
> or all new drivers?

Actually I don't have any information about the MT6589.
For MT6572 I had a deeper look on the GPT and the UART which seem to
be the same in both SoCs.
But they don't look like IP blocks from any other vendor. Most of the
other on-chip devices look quite similar.
In any case don't trust me too much, as I'm just doing my first steps
on an effort like this.

>
>> +#include <asm/hardware/cache-l2x0.h>
>> +
>> +static void __init mediatek_dt_init(void)
>> +{
>> +     l2x0_of_init(0, ~0);
>> +     of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
>> +}
>
> I hope that with all the cleanup work that Russell has done in the
> past few weeks, we can manage to kill off the call to l2x0_of_init()
> here and have it done by core architecture code instead. That would
> let you have an empty machine file, unless you have other things you
> will need to add in the future.
>
>         Arnd



-- 
motzblog.wordpress.com
