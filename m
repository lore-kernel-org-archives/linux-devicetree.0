From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 2/2] soc: nxp: Add a RCPM driver
Date: Mon, 1 Aug 2016 13:55:27 +0100
Message-ID: <579F46BF.4080604@arm.com>
References: <1470044943-3814-1-git-send-email-chenhui.zhao@nxp.com>
 <1470044943-3814-2-git-send-email-chenhui.zhao@nxp.com>
 <2024386.Ra8uvttlE9@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2024386.Ra8uvttlE9@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, z.chenhui@gmail.com, Chenhui Zhao <chenhui.zhao@nxp.com>, jason.jin@nxp.com, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

On 01/08/16 13:25, Arnd Bergmann wrote:
> On Monday, August 1, 2016 5:49:03 PM CEST Chenhui Zhao wrote:
>> The NXP's QorIQ Processors based on ARM Core have a RCPM module
>> (Run Control and Power Management), which performs all device-level
>> tasks associated with power management.
>>
>> This patch mainly implements the wakeup sources configuration before
>> entering LPM20, a low power state of device-level. The devices can be
>> waked up by specified sources, such as Flextimer, GPIO and so on.
>>
>> Signed-off-by: Chenhui Zhao <chenhui.zhao@nxp.com>
> 
> Adding irqchip maintainers to cc, as this wakeup handling is normally
> part of the irq controller.

Thanks for looping me in. This very much look like it should be a
stacked irqchip, just like we handle everything else. I'll go and review
the actual patch.

	M.
-- 
Jazz is not dead. It just smells funny...
