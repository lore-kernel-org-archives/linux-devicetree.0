From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 01/21] of: Add cpu node iterator for_each_of_cpu_node()
Date: Wed, 31 Oct 2018 01:20:03 +1100
Message-ID: <871s87jz3g.fsf@concordia.ellerman.id.au>
References: <20180905193738.19325-1-robh@kernel.org> <20180905193738.19325-2-robh@kernel.org> <874ld3jz6v.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <874ld3jz6v.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Michael Ellerman <mpe@ellerman.id.au> writes:
> Hi Rob,
>
> Sorry I missed this when you posted it.
>
> Rob Herring <robh@kernel.org> writes:
>> Iterating thru cpu nodes is a common pattern. Create a common iterator
>> which can find child nodes either by node name or device_type == cpu.
>> Using the former will allow for eventually dropping device_type
>> properties which are deprecated for FDT.
>
> Device trees we see on powerpc generally don't (never?) use "cpu" as the
> node name for CPU nodes. And many of those device trees come from
> firmware, so we can't update them.
>
> So dropping support for device_type is a non-starter from our POV.

ps. presumably that's what you meant by deprecated *for FDT*.

But anyway just wanted to make sure we are on the same page.

cheers
