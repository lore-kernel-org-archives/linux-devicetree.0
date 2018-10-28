From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3 3/5] nfc: pn533: add UART phy driver
Date: Sun, 28 Oct 2018 15:35:05 +0100
Message-ID: <20181028143505.GM27852@localhost>
References: <20181025132937.24405-1-poeschel@lemonage.de>
 <20181025132937.24405-3-poeschel@lemonage.de>
 <20181028102725.GL27852@localhost>
 <9494A12C-C53A-4F6E-B6F3-BABB09867677@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9494A12C-C53A-4F6E-B6F3-BABB09867677@holtmann.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Johan Hovold <johan@kernel.org>, Lars Poeschel <poeschel@lemonage.de>, devicetree <devicetree@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, "open list:NFC SUBSYSTEM" <linux-wireless@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 28, 2018 at 02:46:24PM +0100, Marcel Holtmann wrote:

> >> +#define VERSION "0.1"
> > 
> > We don't version kernel drivers individually, so please drop this here
> > and below.
> 
> if we don’t then maybe send patches to remove MODULE_VERSION first.
> Otherwise this is totally fine to do.
> 
> There are currently 670 usages of MODULE_VERSION and I have not heard
> anybody looking at removing this.

Should have phrased that differently; versioning modules individually
does not make much sense when we already have a kernel version which is
tied to the driver code in question and which *does* get updated as new
kernels are released (unlike these module version defines, which tend to
stay unchanged).

For USB, we've dropped module versioning entirely and push back whenever
someone proposes to add it back. Other subsystems and particularly old
drivers may still have these macros of course.

In this case, the pn533 driver (and its interface drivers) is one of only
three NFC drivers which have MODULE_VERSION, but maybe it makes sense to
keep it in, if only for consistency with the other pn533 components.

Thanks,
Johan
