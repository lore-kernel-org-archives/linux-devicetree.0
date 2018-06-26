From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/5] RFC: Mezzanine handling for 96boards
Date: Tue, 26 Jun 2018 10:08:00 +0200
Message-ID: <CAK8P3a1V3BGY_RbPbOaj_sw==52s3AC6iBD8js599hzZqWNr0g@mail.gmail.com>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
 <CAK8P3a2KqoX-squhGc8TBuJ==8xxELsuy-H+c1+C7Fu7Z4OjDA@mail.gmail.com>
 <CACRpkdZY0+q=VKrNhk8w-NSn0zbjCqdgdyApBTs+tVRBWm8ReA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZY0+q=VKrNhk8w-NSn0zbjCqdgdyApBTs+tVRBWm8ReA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@xilinx.com>, dev <dev@lists.96boards.org>, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Andy Shevchenko <andy@infradead.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 26, 2018 at 10:02 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Mon, Jun 18, 2018 at 2:21 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
>> - I really like the idea of having C code deal with the mezzanine
>>   connector itself, acting as an intermediate to tie a number of
>>   boards to a number of add-on cards, this seems much simpler than
>>   trying to do everything with overlays or one of the other more
>>   generic mechanisms.
>
> This is my point of view as well.
>
>> - I don't like the idea of having the bus driver contain a list of possible
>>   add-ons, this seems to go against our usual driver model. What
>>   I think we want instead is to make the connector itself a proper
>>   bus_type, to allow drivers to register against it as loadable modules,
>>   and devices (maybe limited to one device) being created as probed
>>   from DT or some other method as you describe.
>
> OK I think I can do that. It will take some thinking and I would
> guess I should also move it to drivers/platform/*

I'd probably leave it in drivers/bus/, though this might be one of the
rare cases that drivers/platform makes sense for as well.

> My idea here would be to have a connector bus that some random
> add-on (such as a 96board mezzanine) would probe to, so we
> make it generic for any connector plug.

The question here is whether we want one 'struct bus_type' instance
shared by all connector types, or one for each type. I was actually
leaning towards the latter here.

>> - You export symbols in the mezzanine_* namespace, which I think
>>    is a bit too generic and should perhaps contain something related
>>    to  96boards in its name to make it less ambiguous. I suspect we
>>    would add a number of further connectors for hats, capes, lures etc,
>>    which could all be described as mezzanines.
>
> Michal also brings up the (discoverable!) FMC connectors Xilinx are
> using. So the idea would be to create something generic to help
> probe and populate them all whether partly discoverable or not.

If a bus is fully discoverable, I think it's better to use a separate
bus_type that does not use DT based probing for its children.
However, many buses (even USB and PCI) turn out to be only
mostly discoverable, so we end up having to come up with a way
to represent child devices in DT as well.

     Arnd
