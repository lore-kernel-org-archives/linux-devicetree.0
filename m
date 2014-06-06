From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v7 1/7] of: Provide function to request and map memory
Date: Fri, 06 Jun 2014 09:56:06 -0700
Message-ID: <5391F2A6.4040202@infradead.org>
References: <1401989181-4712-1-git-send-email-matthias.bgg@gmail.com>	<1401989181-4712-2-git-send-email-matthias.bgg@gmail.com>
 <CAL_Jsq+KS8W6kZpCSpd68Oku7neFxPVLct1j=AYaXnyvOD3tGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_Jsq+KS8W6kZpCSpd68Oku7neFxPVLct1j=AYaXnyvOD3tGA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko.stuebner@bq.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Soren
List-Id: devicetree@vger.kernel.org

On 06/06/2014 08:19 AM, Rob Herring wrote:
> On Thu, Jun 5, 2014 at 12:26 PM, Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
>> A call to of_iomap does not request the memory region.
>> This patch adds the function of_io_request_and_map which requests
>> the memory region before mapping it.
>>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>> ---
>>  drivers/of/address.c       |   28 ++++++++++++++++++++++++++++
>>  include/linux/of_address.h |    8 ++++++++
>>  2 files changed, 36 insertions(+)
>>
>> diff --git a/drivers/of/address.c b/drivers/of/address.c
>> index cb4242a..c55b107 100644
>> --- a/drivers/of/address.c
>> +++ b/drivers/of/address.c
>> @@ -721,3 +721,31 @@ void __iomem *of_iomap(struct device_node *np, int index)
>>         return ioremap(res.start, resource_size(&res));
>>  }
>>  EXPORT_SYMBOL(of_iomap);
>> +
>> +/**
>> + * of_io_request_and_map - Requests a resource and maps the memory mapped IO
>> + *                        for a given device_node
> 
> I believe docbook requires this to be 1 line.

No longer so.  That was fixed a couple of years ago.


-- 
~Randy
