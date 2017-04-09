From: Benjamin Herrenschmidt <benh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 19/23] drivers/fsi: Add GPIO based FSI master
Date: Mon, 10 Apr 2017 07:53:55 +1000
Message-ID: <1491774835.4166.197.camel@au1.ibm.com>
References: <20170329174340.89109-1-cbostic@linux.vnet.ibm.com>
         <20170329174340.89109-20-cbostic@linux.vnet.ibm.com>
         <CACPK8XfOSYPidHF6=psC4mP-tkRyWTu0psdcK6EwA2E6FF53Uw@mail.gmail.com>
         <0e1bcf3a-e8d7-9f50-bdf7-2a1e7466665b@linux.vnet.ibm.com>
         <1490907014.3177.207.camel@kernel.crashing.org>
         <93b21624-11fc-b71b-aa78-6cb4371c87ae@linux.vnet.ibm.com>
         <1491344360.4166.68.camel@kernel.crashing.org>
         <5344146a-f450-7959-4688-a83ee022574b@linux.vnet.ibm.com>
         <1491774092.4166.195.camel@kernel.crashing.org>
Reply-To: benh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491774092.4166.195.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, "Edward A . James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2017-04-10 at 07:41 +1000, Benjamin Herrenschmidt wrote:
> On Sun, 2017-04-09 at 16:22 -0500, Christopher Bostic wrote:
> > A 3 microsecond delay is required, however, to prevent occasional
> > issues 
> > during heavy FSI bus load stress testing.
> > A 1 nanosecond delay using ndelay(1) had been specified prior to
> > this 
> > but after looking more closely at real time performance it turned
> > out to 
> > actually be roughly 1-2 microseconds.   This appears to be the
> > minimum 
> > resolution using the delay() linux libraries on the
> > AST2400/2500.   
> > Given this, increasing delay to 3 microseconds doesn't impact 
> > performance much considering I can now remove the sample input
> > delay 
> > based on your recommendations to re-order the two clock delays.
> 
> This is huge delays. We should consider a AST2xxx specific variant of
> the backend that uses nops or similar lab-calibrated constructs
> instead. Otherwise we are stuck in the kHz range, this is a >200Mhz
> bus
> :)
> 
> I don't understand why 3us delay would thus be necessary.
> 
> Where about did you observe issues ? Could it be that you don't wait
> long enough in the transitions from write to read ?

FYI. pdbg in userspace operates without any  delays in practice, the
overhead between the various load/store instructions seems sufficient.

The only delay that's needed is when going through the FSI2PIB (to do
SCOMs) where it seems like back-2-back accesses can be problematic.

Cheers,
Ben

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
