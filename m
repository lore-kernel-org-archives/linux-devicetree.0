From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v4 6/7] dt-bindings: anybuss-host: document
 devicetree binding
Date: Thu, 29 Nov 2018 15:59:34 -0500
Message-ID: <CAGngYiXFag-C9-0XvGxVVWs5AxL2qn0UhU2W1Ds9LE+BJYgvDQ@mail.gmail.com>
References: <20181121150709.6030-1-TheSven73@googlemail.com>
 <20181121150709.6030-7-TheSven73@googlemail.com> <20181126220804.GA23069@bogus>
 <CAGngYiWBBe7P80ASQJnS8woe6SKLgNUmqKxOHMeyV1fGSCpY_w@mail.gmail.com> <CAL_JsqK--6UE9N2je3mkoxf_0+i5fTYqYpmTF2bpzFf-KRjhaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqK--6UE9N2je3mkoxf_0+i5fTYqYpmTF2bpzFf-KRjhaQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sven Van Asbroeck <svendev@arcx.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Rob,

Eliminating the 'compatible' property for the anybus gives me an interesting
devicetree problem.

The imx-weim code naively loops through all subnodes, applying timing settings
to the CS in the first reg entry.
In the example below, WEIM CS0 is programmed with the settings in
fsl,weim-cs-timing, because the CS part of reg is 0:


weim: weim@21b8000 {
        compatible = "fsl,imx6q-weim";
        reg = <0x021b8000 0x4000>;
        clocks = <&clks 196>;
        #address-cells = <2>;
        #size-cells = <1>;
        ranges = <0 0 0x08000000 0x08000000>;
        fsl,weim-cs-gpr = <&gpr>;

        nor@0,0 {
                compatible = "cfi-flash";
                reg = <0 0 0x02000000>;
                #address-cells = <1>;
                #size-cells = <1>;
                bank-width = <2>;
                fsl,weim-cs-timing = <0x00620081 0x00000001 0x1c022000
                                0x0000c000 0x1404a38e 0x00000000>;
        };
};

The problem is that my 'anybus controller' hardware spans chip selects.
It requires access to various memory areas. In the example below, CS1
will not be programmed with timing settings:

weim {
        controller@0 {
                compatible = "arcx,anybus-controller";
                reg = <0 0 0x100>, <0 0x400000 0x800>, <1 0x400000 0x800>;
                fsl,weim-cs-timing = ...;
        };
};

I've coped with this in the past by creating a 'dummy' subnode, without a
compatible property. But it's ugly:

weim {
        controller@0 {
                compatible = "arcx,anybus-controller";
                reg = <0 0 0x100>, <0 0x400000 0x800>, <1 0x400000 0x800>;
                fsl,weim-cs-timing = ...;
        };
        dummy@1 { /* this works ! */
                reg = <1 0 0>;
                fsl,weim-cs-timing = ...;
        };
};

Is there a better way? I've looked and looked, but can't find anything that's
similar.

Or should I extend the imx-weim driver to cope?
