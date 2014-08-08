MIME-Version: 1.0
In-Reply-To: <1406843944-7780-2-git-send-email-atull@opensource.altera.com>
References: <1406843944-7780-1-git-send-email-atull@opensource.altera.com>
	<1406843944-7780-2-git-send-email-atull@opensource.altera.com>
Date: Fri, 8 Aug 2014 16:16:34 -0500
Message-ID: <CAL_JsqLBfjNrphkLF95v==4+4VRNn-bht+kruMpPMyEKCyQcBA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] fpga manager framework core
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Alan Tull <atull@opensource.altera.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pavel Machek <pavel@denx.de>, Mark Brown <broonie@kernel.org>, Philip Balister <philip@balister.org>, Alessandro Rubini <rubini@gnudd.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kyle Teske <kyle.teske@ni.com>, Nicolas Pitre <nico@linaro.org>, Felipe Balbi <balbi@ti.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, David Brown <davidb@codeaurora.org>, Rob Landley <rob@landley.net>, "David S. Miller" <davem@davemloft.net>, Joe Perches <joe@perches.com>, Cesar Eduardo Barros <cesarb@cesarb.net>, Samuel Ortiz <sameo@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Alan Tull <delicious.quinoa@gmail.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Yves Vandervennet <yvanderv@opensource.altera.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jul 31, 2014 at 4:59 PM, Alan Tull <atull@opensource.altera.com> wrote:
> This core exports methods of doing operations on FPGAs.

I'm sticking to some high-level comments for the moment...

> EXPORT_SYMBOL_GPL(fpga_mgr_write);
>   Write FPGA given a buffer and count.
>
> EXPORT_SYMBOL_GPL(fpga_mgr_firmware_write);
>   Request firmware and write that to a fpga
>
> EXPORT_SYMBOL_GPL(fpga_mgr_status_get);
>   Get a status string, including failure information
>
> EXPORT_SYMBOL_GPL(fpga_mgr_name);
>   Get name of FPGA manager
>
> EXPORT_SYMBOL_GPL(register_fpga_manager);
> EXPORT_SYMBOL_GPL(remove_fpga_manager);
>   Register/unregister low level fpga driver

I understand these 2 being for low-level drivers, but ...

>
> All userspace interfaces are in separate files so that
> they can be compiled out on production builds where
> appropriate.

How do you envision the other functions to be used besides by
userspace? Automatically loading bit files embedded in your DT?

>
> Signed-off-by: Alan Tull <atull@opensource.altera.com>

[...]

> +const char *state_str[] = {
> +       "default",
> +       "firmware_request",
> +       "write_init",
> +       "write",
> +       "write_complete",
> +       "write_success",
> +       "read_init",
> +       "read",
> +       "read_complete",
> +       "read_done",
> +};
> +
> +/*
> + * Provide status as: [state] [fail] [busy] such as
> + *  'firmware_request fail' = failed to load firmware image from filesystem
> + *  'write fail'            = failed while writing to FPGA
> + *  'write_success'         = after writing, low level driver returns success

I would combine the sysfs patch with this as they are clearly related.

You seem to mix state and status here. For example, "write_success
fail" makes no sense. I think you are exposing to many low level
details both to userspace and perhaps specific to Altera.

How is read used?

Rob
