From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/3] mailbox: Add support for ST's Mailbox IP
Date: Tue, 03 Mar 2015 12:34:37 +0100
Message-ID: <3926609.Ff6LCkuuMX@wuerfel>
References: <1425379283-1567-1-git-send-email-lee.jones@linaro.org> <1425379283-1567-4-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425379283-1567-4-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, jassisinghbrar@gmail.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 03 March 2015 10:41:23 Lee Jones wrote:
> +
> +/*
> + * struct sti_mbox_msg - sti mailbox message description
> + * @dsize:             data payload size
> + * @pdata:             message data payload
> + */
> +struct sti_mbox_msg {
> +       u32             dsize;
> +       u8              *pdata;
> +};

As mentioned in another thread, we may just want to add a 'size'
argument to the message send function, and a default helper for
messages with size of 32 bits.

I don't think it's good to fragment this further by adding
an indirect message interface in a particular driver.

	Arnd
