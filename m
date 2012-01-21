From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Pinmux bindings proposal
Date: Sat, 21 Jan 2012 07:08:56 +0530
Message-ID: <CAJuYYwS28r0xinG8xa93D5bAtZUhCFXm4-F1Q69Te4dWWTm0Yg@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF17801D202F@HQMAIL01.nvidia.com>
 <CAJuYYwQoh4_SnA9wmy4x+cG0w0hGukxTkODWtcSw_2QHYuDsrg@mail.gmail.com>
 <20120119165607.GG22818@atomide.com>
 <CAJuYYwQB1pDu-JS5o3XPA1D8WbVcwbdtD43M4y7PeJNWeNXxQQ@mail.gmail.com>
 <20120119182019.GI22818@atomide.com>
 <CAJuYYwQouBDP6dL0B8QOaF0_JsbR7fysySZ5ebcF4op9aTQqbQ@mail.gmail.com>
 <20120120100528.GJ22818@atomide.com>
 <CAJuYYwQ79o5JuOQfs8rSdasVg+ei4KX7tGLuDA-yysseZya9TA@mail.gmail.com>
 <20120120175351.GL7807@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120120175351.GL7807-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 20 January 2012 23:23, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
> * Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [120120 16:45]:
>> On 20 January 2012 15:35, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
>> > * Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [120119 10:05]:
>> >> On 19 January 2012 23:50, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
>> >>
>> >> I would like to understand the need for populating the
>> >> pinmux/pingroups tables from dt. The question here is when we have
>> >> something like
>> >>
>> >> pins = <&pinctrl0 0x0030 0x15 0x15 0x7>;
>> >>
>> >> which specifies the values that need to be written to the hardware
>> >> registers, would populating pinmux/pingroup tables from dt required.
>> >> The SoC specific pinctrl driver can provide a way (with the help of
>> >> pinctrl core) to translate these values and write to corresponding
>> >> hardware registers. Is there any particular reason for populating the
>> >> pinmux/pingroups tables from dt?
>> >
>> > Hmm I see. Yes it's still needed as we only want to parse the DT once
>> > because it's slower unless it was one time only configuration during
>> > init.
>>
>> Ok. The time spent on searching for the pin-config property can be
>> reduced by having the device driver (say, i2c) keep a pointer to all
>> the pinconfig properties in its node. The next time a driver needs to
>> reconfigure the pins, the search time can be reduced. The time to
>> parse the property values though would still be applicable. But I
>> would still not opt to build pinmux/pinconfig/pindesc tables from dt.
>
> Hmm that's something to consider to save memory as the node will stay
> there. This would allow making all the pinctrl framework data __initdata
> in some cases. You'd probably want to copy the data into the driver in
> some pinctrl framework struct so you could still use pinctrl framework
> functions with this data and not have to parse the node again.

Is it required to use pinctrl functions when we already have the
hardware register values for pinmux/pinconfig in the device nodes? I
was of the opinion that we need not use pinctrl API in case of dt
based boot.

>
> For building the tables from dt, what I have currently is building
> the tables without any specific knowledge about the pinmux functions.
> I'm thinking that any further knowledge for debugging etc can be done
> later on using user space tools to avoid storing the data in kernel.
>

Ok. I will go through your patches when you post them.

Thanks,
Thomas.
