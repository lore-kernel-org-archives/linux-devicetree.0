From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of: do not leak console options
Date: Thu, 12 Oct 2017 12:24:53 -0500
Message-ID: <CAL_JsqJxPKjJPO_ykzac_L7rj2mR69OpmbLtdZiATg1iGQxwvg@mail.gmail.com>
References: <20170926062510.4948-1-sergey.senozhatsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170926062510.4948-1-sergey.senozhatsky@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 26, 2017 at 1:25 AM, Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
> Do not strdup() console options. It seems that the only reason for
> it to be strdup()-ed was a compilation warning: printk, UART and
> console drivers, for some reason, expect char pointer instead of
> const char pointer. So we can just pass `of_stdout_options', but
> need to cast it to char pointer. A better fix would be to change
> printk, console drivers and UART to accept const char `options';
> but that will take time - there are lots of drivers to update.
>
> The patch also fixes a possible memory leak: add_preferred_console()
> can fail, but we don't kfree() options.
>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> ---
>  drivers/of/base.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Applied.

Rob
