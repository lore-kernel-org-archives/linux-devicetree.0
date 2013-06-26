From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/4] Make non-linear GPIO ranges accesible from gpiolib
Date: Wed, 26 Jun 2013 11:34:57 -0600
Message-ID: <51CB2641.1010404@wwwdotorg.org>
References: <20130618092516.GC18663@ab42.lan> <1371547751-13873-1-git-send-email-christian.ruppert@abilis.com> <51C23060.50807@wwwdotorg.org> <20130626114654.GB7095@ab42.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130626114654.GB7095@ab42.lan>
Sender: linux-doc-owner@vger.kernel.org
To: Christian Ruppert <christian.ruppert@abilis.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 06/26/2013 05:46 AM, Christian Ruppert wrote:
> On Wed, Jun 19, 2013 at 04:27:44PM -0600, Stephen Warren wrote:
>> On 06/18/2013 03:29 AM, Christian Ruppert wrote:
>>> This patch adds the infrastructure required to register non-linear gpio
>>> ranges through gpiolib and the standard GPIO device tree bindings.
>>
>> I review this in case we decide to go with it anyway.
>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
>>
>>> +In addition, named groups of pins can be mapped to pin groups of a given
>>> +pin controller:
>>> +
>>> +	gpio_pio_g: gpio-controller@1480 {
>>> +		#gpio-cells = <2>;
>>> +		compatible = "fsl,qe-pario-bank-e", "fsl,qe-pario-bank";
>>> +		reg = <0x1480 0x18>;
>>> +		gpio-controller;
>>> +		gpio-ranges = <&pinctrl1 0 0 0>, <&pinctrl2 3 0 0>;
>>> +		gpio-ranges-group-names = "foo", "bar";
>>> +	};
>>> +
>>> +where,
>>> +   &pinctrl1 and &pinctrl2 is the phandle to the pinctrl DT node.
>>> +
>>> +   The following value specifies the base GPIO offset of the pin range with
>>> +   respect to the GPIO controller's base. The remaining two values must be
>>> +   0 to indicate that a named pin group should be used for the respective
>>> +   range. The number of pins in the range is the number of pins in the pin
>>> +   group.
>>
>> It'd be good to re-write this section in a similar style to the cleanup
>> patches that I sent for the existing gpio-ranges documentation. That
>> makes the format description more of a raw syntax than English text.
> 
> can you please point me to some place where I can find those patches on
> the web?

The start of the thread is at:

https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-June/thread.html#35462

Patch 1/7 has already been applied. 2/7 and on are really the conversion.
