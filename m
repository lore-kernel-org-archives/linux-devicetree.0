From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] PCI: add DT bindings for Cortina Gemini PCI Host Bridge
Date: Wed, 1 Feb 2017 21:04:44 +0100
Message-ID: <CACRpkdat3rcNL9=FHXBD7zT5LoZy3BGCV1ZT74AoeR4JytSoaQ@mail.gmail.com>
References: <20170128204839.18330-1-linus.walleij@linaro.org> <20170201160224.jg6tuls2xcuul3m4@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170201160224.jg6tuls2xcuul3m4@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, openwrt-devel-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 1, 2017 at 5:02 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sat, Jan 28, 2017 at 09:48:36PM +0100, Linus Walleij wrote:

>> +Example:
>> +
>> +pci@50000000 {
>> +     compatible = "cortina,gemini-pci";
>> +     reg = <0x50000000 0x100>;
>
> Config space is indirectly accessed?

Yes it is a really annoying construction. The first device, the Faraday
roob hub is at that address, the init code uses that to set up the bus.

As soon as the bus is up, we use bus accessors to talk to the root
hub on slot 0 (this manages interrupts etc).

I guess I could even unmap this reg range at that point ...

I guess I could also get the address directly from the IO range
and start poking around. I don't know if that is any better.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
