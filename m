From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: fix '%zx' warning
Date: Thu, 31 Aug 2017 10:58:12 -0500
Message-ID: <CAL_JsqKiM_T-ftd8NvHmzcRsirRWTe34jZRjZ=3NGSgb4HGncQ@mail.gmail.com>
References: <E1da2Z7-0008GG-AV@rmk-PC.armlinux.org.uk> <20170726013004.GJ8978@umbus.fritz.box>
 <20170808112818.GC20805@n2100.armlinux.org.uk> <20170809040642.GG13670@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170809040642.GG13670-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 8, 2017 at 11:06 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Aug 08, 2017 at 12:28:19PM +0100, Russell King - ARM Linux wrote:
>> On Wed, Jul 26, 2017 at 11:30:04AM +1000, David Gibson wrote:
>> > On Tue, Jul 25, 2017 at 05:20:09PM +0100, Russell King wrote:
>> > > dtc uses an incorrect format specifier for printing a uint64_t value.
>> > > uint64_t may be either 'unsigned long' or 'unsigned long long' depending
>> > > on the host architecture.
>> > >
>> > > Fix this by using %llx and casting to unsigned long long, which ensures
>> > > that we always have a wide enough variable to print 64 bits of hex.
>> > >
>> > >   HOSTCC  scripts/dtc/checks.o
>> > > scripts/dtc/checks.c: In function 'check_simple_bus_reg':
>> > > scripts/dtc/checks.c:876:2: warning: format '%zx' expects argument of type 'size_t', but argument 4 has type 'uint64_t' [-Wformat=]
>> > >   snprintf(unit_addr, sizeof(unit_addr), "%zx", reg);
>> > >   ^
>> > > scripts/dtc/checks.c:876:2: warning: format '%zx' expects argument of type 'size_t', but argument 4 has type 'uint64_t' [-Wformat=]
>> > >
>> > > Fixes: 828d4cdd012c ("dtc: check.c fix compile error")
>> > > Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
>> >
>> > This (embarrassing) error is already fixed in upstream dtc.
>>
>> It remains unfixed in 4.13-rc4.  How do we get this fixed in the
>> kernel's dtc?  From what I can see, sending a patch to fix stuff
>> doesn't work.

Sorry, didn't see this until Andrew M picked it up.

> Um.. I don't know.  I haven't been the person doing updates of the
> kernel dtc to match upstream dtc for ages.

The flow is submit a patch to upstream dtc on
devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org and then bug me to cherry-pick or
sync dtc.

I will cherry-pick the upstream version.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
