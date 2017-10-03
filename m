From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] of: do not leak console options
Date: Tue, 3 Oct 2017 09:20:07 +0200
Message-ID: <20171003072007.GB9706@pathway.suse.cz>
References: <20170926062510.4948-1-sergey.senozhatsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170926062510.4948-1-sergey.senozhatsky@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue 2017-09-26 15:25:10, Sergey Senozhatsky wrote:
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

Of course, it would be better to change add_preferred_console().
But it would trigger many other changes. This alternative
"temporary" change looks safe to me. Feel free to use

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
