Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Feb 2018 21:16:07 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] serial: 8250: Add Nuvoton NPCM UART
Message-ID: <20180219031607.u4bdjygddjt7tddc@rob-hp-laptop>
References: <20180215021720.14870-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180215021720.14870-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tomer Maimon <tomer.maimon@nuvoton.com>, Avi Fishman <Avi.Fishman@nuvoton.com>, Jeremy Kerr <jk@ozlabs.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 15, 2018 at 12:47:20PM +1030, Joel Stanley wrote:
> The Nuvoton UART is almost compatible with the 8250 driver when probed
> via the 8250_of driver, however it requires some extra configuration
> at startup.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>  Remove redundant whitespace
>  Use port number 40 to fill in a gap
> 
>  Documentation/devicetree/bindings/serial/8250.txt |  1 +

Reviewed-by: Rob Herring <robh@kernel.org>

>  drivers/tty/serial/8250/8250_of.c                 |  1 +
>  drivers/tty/serial/8250/8250_port.c               | 29 +++++++++++++++++++++++
>  include/uapi/linux/serial_core.h                  |  3 +++
>  include/uapi/linux/serial_reg.h                   |  5 ++++
>  5 files changed, 39 insertions(+)
