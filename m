From: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Subject: Re: [PATCH 1/4] mailbox: add support for System Control and Power
 Interface(SCPI) protocol
Date: Thu, 30 Apr 2015 09:49:41 +0100
Message-ID: <1430383781.2868.9.camel@linaro.org>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>
	 <1430134846-24320-2-git-send-email-sudeep.holla@arm.com>
	 <1430229283.3321.40.camel@linaro.org> <5540B840.1030900@arm.com>
	 <1430307828.27241.32.camel@linaro.org>
	 <1430310338.27241.45.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430310338.27241.45.camel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-04-29 at 13:25 +0100, Jon Medhurst (Tixy) wrote:
> diff --git a/drivers/mailbox/scpi_protocol.c
> b/drivers/mailbox/scpi_protocol.c
> index c74575b..5818d9b 100644
> --- a/drivers/mailbox/scpi_protocol.c
> +++ b/drivers/mailbox/scpi_protocol.c
> @@ -286,14 +286,23 @@ static void scpi_tx_prepare(struct mbox_client
> *c, void *msg)
>         struct scpi_chan *ch = container_of(c, struct scpi_chan, cl);
>         struct scpi_shared_mem *mem = (struct scpi_shared_mem
> *)ch->tx_payload;
>  
> -       mem->command = cpu_to_le32(t->cmd);
>         if (t->tx_buf)
>                 memcpy_toio(mem->payload, t->tx_buf, t->tx_len);
>         if (t->rx_buf) {
> +               int token;
>                 spin_lock_irqsave(&ch->rx_lock, flags);
> +               /*
> +                * Presumably we can do this token setting outside
> +                * spinlock and still be safe from concurrency?
> +                */

To answer my own question, yes, the four lines below can be moved up
above the spin_lock_irqsave. Because we had better be safe from
concurrency here as we are also writing to the channel's shared memory
area.

> +               do
> +                       token = (++ch->token) & CMD_TOKEN_ID_MASK;
> +               while(!token);
> +               t->cmd |= token << CMD_TOKEN_ID_SHIFT;
>                 list_add_tail(&t->node, &ch->rx_pending);
>                 spin_unlock_irqrestore(&ch->rx_lock, flags);
>         }
> +       mem->command = cpu_to_le32(t->cmd);
>  }
>  
>  static struct scpi_xfer *get_scpi_xfer(struct scpi_chan *ch)

-- 
Tixy
