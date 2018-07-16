From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 2/2] misc: npcm7xx: add NPCM7xx LPC BPC driver
Date: Mon, 16 Jul 2018 13:33:57 +0200
Message-ID: <20180716113357.GA30937@kroah.com>
References: <20180704091427.409971-1-tmaimon77@gmail.com>
 <20180704091427.409971-3-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180704091427.409971-3-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arnd.de, avifishman70@gmail.com, yuenn@google.com, brendanhiggins@google.com, venture@google.com, joel@jms.id.au, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 04, 2018 at 12:14:27PM +0300, Tomer Maimon wrote:
> Add Nuvoton BMC NPCM7xx BIOS post code (BPC) driver.
> 
> The NPCM7xx BPC monitoring two I/O address written by
> the host on the Low Pin Count (LPC) bus, the capure
> data stored in 128-word FIFO.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

It would be great to get someone else who knows that this hardware is
supposed to be doing to ack or sign-off on this patch, as I don't know
if this really is providing the correct api for it or not.

Right now it's just reading data from the hardware, what good is that?
Who uses this?  What userspace tools connect up to it?

thanks,

greg k-h
