Return-Path: <fixed-term.Oleksij.Rempel@de.bosch.com>
Subject: Re: [PATCH 1/6] spi: add flow controll support
References: <56D448E1.6090006@de.bosch.com>
 <1456843400-20696-1-git-send-email-linux@rempel-privat.de>
 <56D6DC04.30803@martin.sperl.org>
From: fixed-term.Oleksij.Rempel <fixed-term.Oleksij.Rempel@de.bosch.com>
Message-ID: <56D6F808.1080009@de.bosch.com>
Date: Wed, 2 Mar 2016 15:26:16 +0100
MIME-Version: 1.0
In-Reply-To: <56D6DC04.30803@martin.sperl.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Martin Sperl <kernel@martin.sperl.org>, Oleksij Rempel <linux@rempel-privat.de>, geert@linux-m68k.org, dirk.behme@de.bosch.com, broonie@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>



On 02.03.2016 13:26, Martin Sperl wrote:
> 
> 
> On 01.03.2016 15:43, Oleksij Rempel wrote:
>> Different HW implement different variants of SPI based flow control (FC).
>> To flexible FC implementation a spited it to fallowing common parts:
>> Flow control: Request Sequence
>> Master CS   |-------2\_____________________|
>> Slave  FC   |-----1\_______________________|
>> DATA        |-----------3\_________________|
>>
>> Flow control: Ready Sequence
>> Master CS   |-----1\_______________________|
>> Slave  FC   |--------2\____________________|
>> DATA        |-----------3\_________________|
>>
>> Flow control: ACK End of Data
>> Master CS   |______________________/2------|
>> Slave  FC   |________________________/3----|
>> DATA        |__________________/1----------|
>>
>> Flow control: Pause
>> Master CS   |_______________________/------|
>> Slave  FC   |_______1/-----\3______/-------|
>> DATA        |________2/------\4___/--------|
>>
>> Flow control: Ready signal on MISO
>> Master CS   |-----1\_______________________|
>> MISO/DATA   |------2\____3/----------------|
>> CONV START  |       ^                      |
>> DATA READY  |             ^                |
> 
> One alternative idea:
> 
> I guess all of the above could also get implemented
> without a single framework change like this only in
> the spi_device driver that requires this:
> 
> * spi_bus_lock
> * spi_sync_lock (but with cs_change = 1 on the last transfer,
>    so that cs does not get de-asserted - maybe a 0 byte transfer)
> * check for your gpio to be of the "expected" level
>    (maybe via interrupt or polling)
> * spi_sync_lock (continue your transfer)
> * spi_bus_unlock
> 
> This could also get wrapped in a generic spi_* method.
> 
> Maybe another alternative to this approach could be a generic
> callback after having finished the processing a specific spi_transfer.
> (not the specific version that you propose)

Thank you, it sounds match more cleaner then my variant. I'll try it.

> E.g:
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -1001,6 +1001,9 @@ static int spi_transfer_one_message(struct
> spi_master *master,
>                 if (msg->status != -EINPROGRESS)
>                         goto out;
> 
> +               if (xfer->complete)
> +                       xfer->complete(xfer->context);
> +
>                 if (xfer->delay_usecs)
>                         udelay(xfer->delay_usecs);
> 
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index 520a23d..d2b53c4 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -753,6 +753,9 @@ struct spi_transfer {
>         u16             delay_usecs;
>         u32             speed_hz;
> 
> +       void                    (*complete)(void *context);
> +       void                    *context;
> +
>         struct list_head transfer_list;
>  };
> 
> Then all that is left is implementing that gpio logic as this
> callback.
> 
> The complete_code could be just waiting for an GPIO-interrupt to wake up
> the thread - so it could be as simple as:
> 
> void spi_transfer_complete_wait_for_completion(void *context)
> {
>     /* possibly enable interrupt */
>     /* wait for interrupt to wake us up*/
>     wait_for_completion(context);
>     /* possibly disable interrupt */
>     reinit_completion(context);
> }
> 
> The creation of the GPIO interrupt and such could also be spi_* helper
> methods which then could take some of the required info from the
> device tree.
> 
> This way the whole thing would be orthogonal to the SPI_READY,
> for which there is no spi_device driver besides spidev.
> So there would be also no impact to out of tree/userland drivers.
> 
> Such an interface actually would allow for other (ab)uses -
> e.g: read len, then read len bytes becomes easy:
> 
> void spi_transfer_complete_read_length_then_read(void *context)
> {
>    struct spi_transfer *xfer = context;
>    struct spi_transfer *next =
>         list_first_entry(list, typeof(*next), transfer_list);
> 
>    /* saturate on length given in original transfer */
>    if (xfer->rx_buf && (xfer->len>0))
>        /* this may require unmapping the dma-buffer */
>        next->len = min_t(unsigned, len, ((char*)xfer->rx_buf)[0]);
> 
>     /* note that if we wanted the ability to abort a transfer,
>       * then the complete method would need to return a status
>       */
> }
> 
> All that is required is that a spi_message is created with 2 transfers,
> where the first has:
> * len = 1
> * complete = spi_transfer_complete_read_length_then_read;
> * context = xfer[0]
> and the second contains:
> * len = 16;
> 
> Just some ideas of how it could be implemented in a more generic way
> that would also allow other uses.
> 
> Martin
