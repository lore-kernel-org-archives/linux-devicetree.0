From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 02/11] ARM: nomadik: initial devicetree support
Date: Mon, 14 Jan 2013 08:02:06 +0100
Message-ID: <CACRpkdbeeQC0bE7CEkBeHU=M03VBXNLd_20eyzjT39YJB9H-wg@mail.gmail.com>
References: <1357599359-7385-1-git-send-email-linus.walleij@linaro.org>
 <20130108095729.GA2718@e106331-lin.cambridge.arm.com>
 <20130111170411.320D73E20EC@localhost>
 <20130111175749.GJ19765@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130111175749.GJ19765-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alessandro Rubini <rubini-9wsNiZum9E8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2013 at 6:57 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Fri, Jan 11, 2013 at 05:04:11PM +0000, Grant Likely wrote:
>> On Tue, 8 Jan 2013 09:57:29 +0000, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>> >
>> > Maybe I've misunderstood how this is laid out, but I can't see where we get a
>> > cpus node from in the board's dts. Has this just been forgotten?
>>
>> A cpus node isn't required if it doesn't provide any non-discoverable
>> information.
>
> Seeing the discussion around the Tegra #CPUs detection code, I'd think we
> should have one:
>
> http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/140209.html

Sorry I cannot figure out how to handle this request.

The Nomadik has one (1) ARM926EJ-S CPU.

Currently there is no other uniprocessor machine in arch/arm/* doing this,
so have I understood it correctly that you are asking me to do something
that has never been done before, and that all the existing device tree
implementations should also do this in the end?

The references discussion introduce ARM_CPU_PART_CORTEX_A15
and ARM_CPU_PART_CORTEX_A9 and these are vastly newer
systems than the Nomadik, there is no handling of the older CPU types.

Are you asking for some new infrastructure to support, mainly for
the sake of itself (like the nice completeness of the device tre), cpu
nodes in these device trees?

Does this reasoning also extend to the MIPS, PPC and Sun use of
device trees as well then, as they don't do that, or do you mean this
should be done only for the ARM family?

As you see I don't quite get it, could you elaborate?

Yours,
Linus Walleij
