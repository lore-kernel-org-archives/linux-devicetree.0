From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v7 1/7] of: Provide function to request and map memory
Date: Mon, 9 Jun 2014 09:36:10 -0500
Message-ID: <CAL_Jsq+yi+fdN1vHK6Wwx7Jzmvz3qd6z=8sO8+q==YRmBCGdww@mail.gmail.com>
References: <1401989181-4712-1-git-send-email-matthias.bgg@gmail.com>
 <1401989181-4712-2-git-send-email-matthias.bgg@gmail.com>
 <CAL_Jsq+KS8W6kZpCSpd68Oku7neFxPVLct1j=AYaXnyvOD3tGA@mail.gmail.com>
 <20140607055953.569D6C4099E@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140607055953.569D6C4099E@trevor.secretlab.ca>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@bq.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Thomas
List-Id: devicetree@vger.kernel.org

On Sat, Jun 7, 2014 at 12:59 AM, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Fri, 6 Jun 2014 10:19:28 -0500, Rob Herring <robherring2@gmail.com> wrote:
>> On Thu, Jun 5, 2014 at 12:26 PM, Matthias Brugger
>> <matthias.bgg@gmail.com> wrote:
>> > A call to of_iomap does not request the memory region.
>> > This patch adds the function of_io_request_and_map which requests
>> > the memory region before mapping it.
>> >
>> > Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>> > ---
>> >  drivers/of/address.c       |   28 ++++++++++++++++++++++++++++
>> >  include/linux/of_address.h |    8 ++++++++
>> >  2 files changed, 36 insertions(+)
>> >
>> > diff --git a/drivers/of/address.c b/drivers/of/address.c
>> > index cb4242a..c55b107 100644
>> > --- a/drivers/of/address.c
>> > +++ b/drivers/of/address.c
>> > @@ -721,3 +721,31 @@ void __iomem *of_iomap(struct device_node *np, int index)
>> >         return ioremap(res.start, resource_size(&res));
>> >  }
>> >  EXPORT_SYMBOL(of_iomap);
>> > +
>> > +/**
>> > + * of_io_request_and_map - Requests a resource and maps the memory mapped IO
>> > + *                        for a given device_node
>>
>> I believe docbook requires this to be 1 line.
>>
>> > + * @device:    the device whose io range will be mapped
>> > + * @index:     index of the io range
>> > + * @name:      name of the resource
>> > + *
>> > + * Returns a pointer to the requested and mapped memory
>> > + */
>> > +void __iomem *of_io_request_and_map(struct device_node *np, int index, char *name)
>> > +{
>> > +       struct resource res;
>> > +       void __iomem *mem;
>> > +
>> > +       if (of_address_to_resource(np, index, &res))
>> > +               return NULL;
>> > +
>> > +       if (!request_mem_region(res.start, resource_size(&res), name))
>>
>> Use the np->name here and drop the name parameter.
>
> Name here would be the name of the owner (the driver), not the name of
> the node. Passing the name separately is fine by me.

This function is for when there is no driver. If there is a driver,
the devm_* functions should be used. I would like to see some standard
naming and consistency here rather than allowing random strings or
NULL to be passed by the caller.

Rob
