From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 3/3] MAINTAINERS: Refactor device tree maintainership
Date: Tue, 23 Jul 2013 10:59:54 -0700
Message-ID: <51EEC49A.4080909@wwwdotorg.org>
References: <1374290388-19308-1-git-send-email-grant.likely@linaro.org>  <1374290388-19308-3-git-send-email-grant.likely@linaro.org>  <1374511851.3609.10.camel@hornet> <51ED9018.1020003@gmail.com> <1374599667.25700.92.camel@hornet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1374599667.25700.92.camel@hornet>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: Rob Herring <robherring2@gmail.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 07/23/2013 10:14 AM, Pawel Moll wrote:
> On Mon, 2013-07-22 at 21:03 +0100, Rob Herring wrote:
>> On 07/22/2013 11:50 AM, Pawel Moll wrote:
>>> On Sat, 2013-07-20 at 04:19 +0100, Grant Likely wrote:
>>>> +F:	include/dt-bindings
>>>
>>> One thing we didn't finish talking about was the question if this
>>> directory is supposed to contain *.dtsi files as well? The obvious
>>> problem I have is a vexpress motherboard being (well, actually not bein
>>> right now) shared between arch/arm/boot/dts and arch/arm64/boot/dts.
>>
>> Please no. 
> 
> No as in: no don't put *.dtsi files into include/dt-bindings; or: no, do
> not duplicate the motherboard file?

Don't put *.dtsi into include/dt-bindings, I believe.

> It you meant the latter, this is exactly what I wanted to say: I don't
> want to do that, but there's no way of avoiding it right now.

I think the solution is to introduce some new shared/common location for
shared/common *.dtsi files, into the kernel tree, in the interim.

When *.dts move out of the kernel, this common location can simply be
consumed as part of the DT tree re-organization.

Or perhaps, we could move *.dts around in the kernel to match the
proposed DT tree structure before that point in time?

>> we will still need
>> to copy dt-bindings into the kernel. Also, I think we should move all
>> dts files out of arch subdirs and arrange by vendor or soc family. I'm
>> sure there are some cases that structure doesn't fit well, but there is
>> very little in a dts tied to a cpu architecture.
> 
> I couldn't agree more. So:
> 
> <root>/include/dt-bindings/vendor/*?

> <root>/dts/vendor/*?

I would tend to prefer that option, ...

> <root>/of/vendor/*?
> <root>/dt/vendor/*?

or perhaps that one.

> <root>/drivers/of/vendor/*?
