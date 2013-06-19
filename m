From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] Make non-linear GPIO ranges accesible from gpiolib
Date: Wed, 19 Jun 2013 12:27:56 -0600
Message-ID: <51C1F82C.4020502@wwwdotorg.org>
References: <CACRpkdY9F0cUaRfGJnHJW=2dYf_yKkr3M8Kh+_e6XQhh1WBoUA@mail.gmail.com> <1371128132-18266-2-git-send-email-christian.ruppert@abilis.com> <51BA3BC1.3090109@wwwdotorg.org> <20130614091241.GA23745@ab42.lan> <51C1F42E.5090107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51C1F42E.5090107@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Christian Ruppert <christian.ruppert@abilis.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 06/19/2013 12:10 PM, Stephen Warren wrote:
> On 06/14/2013 03:12 AM, Christian Ruppert wrote:
>> On Thu, Jun 13, 2013 at 03:38:09PM -0600, Stephen Warren wrote:
>>> On 06/13/2013 06:55 AM, Christian Ruppert wrote:
>>>> This patch adds the infrastructure required to register non-linear gpio
>>>> ranges through gpiolib and the standard GPIO device tree bindings.
>>>
>>> That's not exactly true. The existing gpio-ranges property already
>>> allows non-linear ranges to be represented quite easily; each entry in
>>> the gpio-ranges list is <gpio-base> <pinctrl-base> <count>, so you can
>>> piece together any mapping you want.
>>
>> You're right, my description is somewhat imprecise here.
>>
>>> The potential advantage of this patch is that the pinctrl-side of the
>>> mapping can be a group name rather than pin IDs, which might reduce the
>>> size of the mapping list if you have an extremely sparse or non-linear
>>> mapping /and/ parts of that mapping just happen to align with the pin
>>> groups in the pin controller HW, since each entry in the gpio-ranges
>>> property can be sparse/non-linear, rather than being a small linear
>>> chunk of the mapping.
>>
>> Pin controller authors have the freedom to define pin groups just for
>> the purpose of "predefining" the pinctrl side of GPIO ranges.
> 
> Hmm. I suppose that's true. I'm not sure how enthusiastic I am about
> doing this though... The reason I'm unsure is because it starts using
> pin groups from something other than groups of pins in HW that are all
> affected by the same mux or config bits in a register, and starts using
> pin groups for something else; GPIO<->pinmux pins mapping. Perhaps it's
> OK though, considering the other abuses of pin groups that are already
> present, such as using pin groups to represent default/common uses of
> groups of pins that don't actually exist in HW.

I've realized what I don't like about this.

Pin groups are supposed to be something that represents some property of
the pinctrl HW itself. So, if you have register "X" bits 3-0 that define
the mux function for pins 8, 9, 10, and 11, then there really is a pin
group that exists in HW, and that pin group will still exist with that
same definition no matter what SoC you put the pinctrl HW into. If this
changes, it's not the same pinctrl HW module.

However, the connectivity between GPIO HW module "pins" (i.e. the GPIOs)
and pinctrl HW module "pins" (inputs to mux functions) is something that
only exists at the top-level of the SoC; outside the GPIO HW module
itself, and outside the pinctrl HW module itself.

In other words, you could have the exact same GPIO and pinctrl HW
modules instantiated into two different SoCs, but with completely
different mapping of GPIO IDs to pinctrl pin IDs.

As such, it isn't even generally possible for the pinctrl HW module to
define pin groups that describe the mapping, because the mapping is not
a property of the pinctrl HW module, and hence should not be defined,
even partially, by the pinctrl HW module's driver. In a similar fashion,
the DT binding for the pinctrl HW module should describe only the HW
module itself, and not the mapping/interaction with the outside world.
In other words, the DT binding for the pinctrl HW module also can't
define the names of any pin groups used in the GPIO<->pinctrl mapping,
for the same reasons.

As such, I'm not sure that I conceptually agree with this patch series.

Sure, it may make the gpio-ranges property more compact in some
(unusual?) non-linear cases. However, it's representing things
semantically incorrectly.

So, I'd like to question the motivation for using names here again.
Presumably the SoC vendor will write the gpio-ranges property for each
SoC, and put that into the SoC's .dtsi file. As such, no customer is
ever going to have to care about the property or its contents. So, I
don't really see how this helps you with your issue re: wanting to hide
details of multiple different ball-out options on similar SoCs, since
even with a manually-written purely numeric gpio-ranges property, all
that information is already essentially hidden; it's something that will
be written once, and then never looked at.
