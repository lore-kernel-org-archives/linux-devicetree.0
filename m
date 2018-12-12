From: Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Wed, 12 Dec 2018 09:53:13 -0600
Message-ID: <20181212155313.GA6502@uda0271908>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com>
 <1544445555-17325-3-git-send-email-pawell@cadence.com>
 <87h8fkmfar.fsf@linux.intel.com>
 <BYAPR07MB47095110AF28CC11B4C9E144DDA60@BYAPR07MB4709.namprd07.prod.outlook.com>
 <CAL411-ryK2LLZVg5_sLkCYOuhwdHLVm5XavSyC9nbEXZah_43w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL411-ryK2LLZVg5_sLkCYOuhwdHLVm5XavSyC9nbEXZah_43w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: pawell@cadence.com, balbi@kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, rogerq@ti.com, lkml <linux-kernel@vger.kernel.org>, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

Peter,

On Wed, Dec 12, 2018 at 10:04:25AM +0800, Peter Chen wrote:

[snip]

> > >I strongly advise against using dev_dbg() for debugging. Even more so
> > >inside your IRQ handler.
> 
> Felipe, I use Dynamic Debug for debugging, and show debug messages with
> "dmesg" after testing/debugging. I see dwc3 using trace,  any benefits
> for switching
> to trace?

The benefits I see are

- *by default*, the debug log doesn't have to go through uart console,
  which is slow.

  I typically 'cat trace_pipe' from a telnet which is much faster then
  uart. But Dynamic Debug log by default got printed on uart, I have to
  set printk level to not print them, which is an extra step.

- tracepoint uses one place to decode the message vs DD has to repeat
  the similar print statement in the code; and tracepoint decodes it
  offline which reduce the kernel runtime overhead too.

- with tracepoint, it is easier to turn on debug for a specific group of
  messages.

- you can adjust the ftrace buffer size at runtime. can we do that for
  printk? I don't remember.

Regards,
-Bin.
