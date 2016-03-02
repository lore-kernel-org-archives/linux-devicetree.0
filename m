Return-Path: <fixed-term.Oleksij.Rempel@de.bosch.com>
Subject: Re: [PATCH 1/6] spi: add flow controll support
References: <56D448E1.6090006@de.bosch.com>
 <1456843400-20696-1-git-send-email-linux@rempel-privat.de>
 <20160302024656.GR18327@sirena.org.uk> <56D68CD7.8000203@de.bosch.com>
 <20160302105530.GK18327@sirena.org.uk>
From: fixed-term.Oleksij.Rempel <fixed-term.Oleksij.Rempel@de.bosch.com>
Message-ID: <56D6CCCE.107@de.bosch.com>
Date: Wed, 2 Mar 2016 12:21:50 +0100
MIME-Version: 1.0
In-Reply-To: <20160302105530.GK18327@sirena.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Mark Brown <broonie@kernel.org>
Cc: Oleksij Rempel <linux@rempel-privat.de>, geert@linux-m68k.org, dirk.behme@de.bosch.com, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>



On 02.03.2016 11:55, Mark Brown wrote:
> On Wed, Mar 02, 2016 at 07:48:55AM +0100, fixed-term.Oleksij.Rempel
> wrote:
>> On 02.03.2016 03:46, Mark Brown wrote:
>>> On Tue, Mar 01, 2016 at 03:43:15PM +0100, Oleksij Rempel
>>> wrote:
> 
>>> In the case above this looks like a normal interrupt from a
>>> device, I'm not clear what is different here or why this is in
>>> the core?
> 
>> At least our HW use tree different signals for flow control. One
>> of it is Request Signal.
> 
> That's still an interrupt, just on a different line to the main 
> interrupt.
> 
>>>> Flow control: ACK End of Data Master CS
>>>> |______________________/2------| Slave  FC
>>>> |________________________/3----| DATA
>>>> |__________________/1----------|
> 
>>> Why would anything care about this case and why is it part of
>>> the SPI protocol rather than something that the device driver
>>> would do?
> 
>> This case covers real bugs and in our case we need to detect if
>> master or slave stalls under one second. If communication problem
>> is detected, some of recovery scenarios is initiated. Like i
>> said, this protocol is used for automotive industry.
> 
> That doesn't answer the second part of my question.  This doesn't
> seem to be something that's anything to do with SPI, it's just your
> device signalling things out of band.

Because there are more devices using this protocol, not only this
company. Because implementing ACK signal will cost a lot more code
then it is needed. Because timing for the driver do explode. Because
implementing it for two device on one bus it is horror just to satisfy
spi framework.
This is why we needed to reimplement almost complete spi stack insight
of our driver.
So, do you feel safe if you know that this shit is implemented in your
car? :)

>> Please see two attached screen shots of Master and Slave
>> initiated transfers.
> 
> Those tell me nothing.
> 
>>> Atomic operations are very hard to use safely, you need to
>>> really spell out what you think this is doing from a
>>> synchronization point of view and why it's safe.
> 
>> I'm trying to detect if we are on Master or Slave initiated
>> transfer, which was detected by spi_fc_rq. Normally there should
>> be no other interrupts on FC line and active_rq should not be
>> changed until this transfer was processed. The "if
>> (!spi_fc_equal_cs(spi))" check is in case my assumption is wrong
>> or there is some HW issue. Do you have other suggestions?
> 
> Among other things it really needs to be crystal clear how this
> update gets propagated to all CPUs in the system with no race
> conditions.
> 
>>>> +	if (spi->mode | SPI_FC_REQUEST && +			!spi->cs_enabled &&
>>>> fc_enabled) { +		atomic_set(&spi->active_rq, 1); +		if
>>>> (spi->request_cb) +			spi->request_cb(spi);
> 
>>> This logic is all too complicated for me to follow.  Why are we
>>> oring things with spi->mode?
> 
>> I'm trying to checking here if fallowing case is actually
>> expected by slave device. Other suggestions?
> 
> In what way are we checking what?  The code is incomprehensible.
> 
> Again, you're ignoring my specific question about the or.
> 
>>> We can't support things only for DT, we need a way for things
>>> to be used on other systemms.
> 
>> I have nothing against it, but i even do not have other HW to
>> test if my assumptions are correct. Would you accept untested
>> code? :)
> 
> In general the way we do DT code is that the DT parses into some
> data structure and then we work with that data structure.  This
> means that everyone's code path is tested.
> 
