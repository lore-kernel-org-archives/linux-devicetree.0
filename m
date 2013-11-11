From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] pin control bulk changes for v3.13
Date: Mon, 11 Nov 2013 11:23:06 +0100
Message-ID: <CACRpkdYPgNK=bODvTo8+KHG7Yz448rw10Mqov8AjRB5RGMcqhg@mail.gmail.com>
References: <CACRpkdYpuZec_JRAPYZHmB5qTYebKR6iBy5=RvBUUEXsuOu97Q@mail.gmail.com>
	<52808D34.70309@synopsys.com>
	<CACRpkdaRGKBWr+rtOD3tWBUA452yApF838ufZ6nPOhzMZGDzfg@mail.gmail.com>
	<C2D7FE5348E1B147BCA15975FBA23075155D9F@IN01WEMBXA.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075155D9F@IN01WEMBXA.internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "christian.ruppert@abilis.com" <christian.ruppert@abilis.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 11, 2013 at 11:00 AM, Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
> On 11/11/2013 03:03 PM, Linus Walleij wrote:

>> Actually I think device tree changes - if you mean changes to this platform's
>> DTS/DTSI files, should go through the ARC arch tree.
>
> But current workflow is prone to broken bisectability - arch maintainers need to
> make sure that the core/driver changes hit mainline before the actual dts/dtsi
> files in arch/*

No. This is *not* a bisectability problem, as it has been established
that device trees and kernel code shall *not* be built and deployed
together.

Consider:

- Just subsystem changes are merged: OK you can still take your
  DTS from somewhere and boot this kernel with it.

- Just the arch/*/*.dts[i] changes are merged: OK these new DT
  nodes remain unused, presumably the system survives anyway?

It only becomes a problem if you also start to apply patches deleting
functionality that has been moved over to the device tree in the same
merge window - don't do that. Take a sweep with the broomstick
next time instead.

>> As the idea is to eventually move the DTS stuff out of the kernel we should
>> not try to couple these into the subsystem trees.
>
> IMHO putting the 2 parts in a patch series and routing via the same subsys tree
> will not really couple them. I fail to see how u would use the commits in driver/*
> (or not use the commits in arch/*) to do the proposed seperation of future.

I don't understand this. First you say it is prone to broken bisectability,
then you say it is not coupled? Isn't this the same thing?

Yours,
Linus Walleij
