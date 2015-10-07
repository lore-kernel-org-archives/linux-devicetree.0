From: dwalker@fifo99.com
Subject: Re: [PATCH-RFC 6/7] drivers: of: ifdef out cmdline section
Date: Wed, 7 Oct 2015 09:27:55 -0700
Message-ID: <20151007162755.GA23283@fifo99.com>
References: <1444146434-12776-6-git-send-email-danielwa@cisco.com>
 <CAL_JsqLmVRdWZqxFRAZ-pgd225PGW8MNv4A47bcfD+cD_+K7rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLmVRdWZqxFRAZ-pgd225PGW8MNv4A47bcfD+cD_+K7rg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Daniel Walker <danielwa@cisco.com>, xe-kernel@external.cisco.com, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 06, 2015 at 12:14:43PM -0500, Rob Herring wrote:
> On Tue, Oct 6, 2015 at 10:47 AM, Daniel Walker <danielwa@cisco.com> wrote:
> > It looks like there's some seepage of cmdline stuff into
> > the generic device tree code. This conflicts with the
> > generic cmdline implementation so I remove it in the case
> > when that's enabled.
> 
> Nice series in general. I've had passing desire to do this every time
> I run into the command line code.
> 
> The DT handling of the command line is generic across architectures.
> The current design is working around that the kernel command line code
> is not that way. I think we can take this a bit further by making the
> generic DT code add the command line string directly rather than
> relying on the arch to do that. Then we can remove all command line
> handling from the arch code. I would also look at whether we can make
> boot_command_line static rather than directly accessed. We might have
> to leave it public for now, but could treat it as static for generic
> cmdline case.
> 

Sorry I didn't respond sooner. I was waiting to see if there were more replies.

One of my colleague suggested something similar, I was reluctant to change anything
prior to sending it out so I could get more feedback on the direction.

So your suggesting this patch be something like,

#ifdef CONFIG_GENERIC_CMDLINE
// call generic cmdline functions
#else
// keep what's there currently
#endif

Then remove the arch specific generic cmdline changes in the architecture code for the DT path.. 
Most of them have two places where they add in the command line. One from the device tree, and
another place that's from the bootloader. For example , ARM has the device tree call, then another
for atags. I don't think these device tree changes would allow us to remove the atags version, also
the boot_command_line wouldn't be able to be static.

Daniel
