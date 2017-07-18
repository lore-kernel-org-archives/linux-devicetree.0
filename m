From: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH 2/3] mfd: syscon: atmel-smc: add helper to retrieve
 register layout
Date: Tue, 18 Jul 2017 11:23:43 +0200
Message-ID: <02a0c390-610c-d38b-e6a3-f04120c6fbb3@microchip.com>
References: <20170711074015.30440-1-ludovic.desroches@microchip.com>
 <20170711074015.30440-3-ludovic.desroches@microchip.com>
 <20170718081508.yo6uld5ip5hr6ipk@dell> <20170718091238.wweaobzccdlgv5dh@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170718091238.wweaobzccdlgv5dh@dell>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>, Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: devicetree@vger.kernel.org, boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, linux-mtd@lists.infradead.org, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 18/07/2017 at 11:12, Lee Jones wrote:
> On Tue, 18 Jul 2017, Lee Jones wrote:
> 
>> On Tue, 11 Jul 2017, Ludovic Desroches wrote:
>>
>>> For HSMC controller, the register layout depends on the device i.e. the
>>> offset of setup, pulse, cycle, mode and timings registers is not the
>>> same. An helper is added to provide the correct register layout.
>>>
>>> Fixes: fe9d7cb22ef3 ("mfd: syscon: atmel-smc: Add new helpers to ease
>>> SMC regs manipulation")
>>> Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>>> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
>>> ---
>>>  drivers/memory/atmel-ebi.c               | 13 +++++--
>>>  drivers/mfd/atmel-smc.c                  | 67 +++++++++++++++++++++++++-------
>>>  drivers/mtd/nand/atmel/nand-controller.c | 10 +++--
>>>  include/linux/mfd/syscon/atmel-smc.h     | 32 ++++++++++-----
>>>  4 files changed, 92 insertions(+), 30 deletions(-)
>>
>> Applied, thanks.
> 
> Apologies, it looks like this needs 2 more Acks before I can even
> consider taking it.
> 
> Unapplied.

If mine is missing, here it is:

For the whole series:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

And I think that Alexandre seemed okay by discussing the path those
patches should take...


Thanks, bye,
-- 
Nicolas Ferre
