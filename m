From: Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH V2 2/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Mon, 12 Jan 2015 13:09:33 -0600
Message-ID: <54B41BED.5090809@opensource.altera.com>
References: <1420564094-1086-1-git-send-email-grmoore@opensource.altera.com> <1420564094-1086-2-git-send-email-grmoore@opensource.altera.com> <54AD31F8.4050100@vanguardiasur.com.ar> <CAL_Jsq+nbZMnJZ=Wm--DODWRXm5aqEJ_7BVDuET9oSXJaJtWug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+nbZMnJZ=Wm--DODWRXm5aqEJ_7BVDuET9oSXJaJtWug@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Tull <atull@opensource.altera.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Yves Vandervennet <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


On 01/08/2015 04:30 PM, Rob Herring wrote:
>
> This controller only works with flash devices and is different than this one:?
>
> Documentation/devicetree/bindings/spi/spi-cadence.txt
>

Yes, it is a different controller and is for flash only.  The docs call 
it the "QSPI Flash Controller".
...

>
> The above binding already uses "is-decoded-cs". Let's not invent something new.
>

OK.
...

>
>>> +- cdns,tshsl-ns : Delay in master reference clocks for the length that the master mode chip select outputs are de-asserted between transactions.
>>> +- cdns,tsd2d-ns : Delay in master reference clocks between one chip select being de-activated and the activation of another.
>>> +- cdns,tchsh-ns : Delay in master reference clocks between last bit of current transaction and deasserting the device chip select (qspi_n_ss_out).
>>> +- cdns,tslch-ns : Delay in master reference clocks between setting qspi_n_ss_out low and first bit transfer.
>
> Aren't these properties probeable at all? We really should have
> standard bindings for this. It seems spi NOR flash devices have gone
> somewhat undocumented, but it is not hard to find examples already in
> use.
>

They are not probeable, afaik.  I don't see these values in any 
probeable info block in the datasheet, only in the AC params table.

I can't find an example of these timing parameters, do you have one in mind?

> Is it master reference clocks or nanoseconds for the units?

Yeah, they are actually nanoseconds in the dts, converted to clocks in 
the driver.  I'll change the docs.

...

Thanks,
Graham
