From: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [RFC PATCH v2 05/10] ARM: at91: make use of the new AIC driver
 for dt enabled boards
Date: Sat, 29 Mar 2014 11:11:03 +0100
Message-ID: <53369C37.4030104@gmail.com>
References: <1396029548-10928-1-git-send-email-b.brezillon.dev@gmail.com>	<1396029548-10928-6-git-send-email-b.brezillon.dev@gmail.com>
 <20140329100756.272c978d@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140329100756.272c978d@skate>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>, Thomas Gleixner <tglx@linutronix.de>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Thomas,

Le 29/03/2014 10:07, Thomas Petazzoni a =E9crit :
> Dear Boris BREZILLON,
>
> On Fri, 28 Mar 2014 18:59:03 +0100, Boris BREZILLON wrote:
>
>> +config ATMEL_AIC_IRQ
>> +	bool
>> +	default USE_OF
>> +	select GENERIC_IRQ_CHIP
>> +	select IRQ_DOMAIN
>> +	select MULTI_IRQ_HANDLER
> This option should probably go in drivers/irqchip/Kconfig, no?

Absolutely, I'll move this section into drivers/irqchip/Kconfig.

Best Regards,

Boris
>
> Thomas
