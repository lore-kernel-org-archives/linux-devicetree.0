From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] drm/panel: simple: Add support for Seiko 43WVF1G
Date: Tue, 11 Apr 2017 11:36:37 -0500
Message-ID: <CAL_Jsq+6QM21f1BgVeDHZ6HG0G8ywu1WbTU+W-Z5GXUM+aQGYg@mail.gmail.com>
References: <1486065840-13575-1-git-send-email-breno.lima@nxp.com>
 <20170207184935.7shhx5pqtprucmgc@rob-hp-laptop> <CAOMZO5Bv2gHa3O_6dbAgKePcZDfMeueeYptRb4r=WLTHYYS8uA@mail.gmail.com>
 <CAL_Jsq+Fu6XRbPEO2OWvpGHuRk9w+k=X3tT+P-UUqiu2r+F12Q@mail.gmail.com>
 <CAOMZO5C+7v=ppVpSYwKEiprCSVSM1z0wVVOwSmbuEPaO3618Wg@mail.gmail.com> <CAOMZO5C21w9eGbFciZn3PEdB14eqPJ0dwbtVw=F4dTafyng0aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5C21w9eGbFciZn3PEdB14eqPJ0dwbtVw=F4dTafyng0aQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Breno Lima <breno.lima-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Breno Matheus Lima <brenomatheus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 8, 2017 at 3:45 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Thierry/Rob,
>
> On Tue, Feb 7, 2017 at 10:48 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Tue, Feb 7, 2017 at 9:36 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>
>>> Except I have no way of knowing whether: a) you omitted a supply
>>> because you don't (yet) care, b) the panel has a single supply and you
>>> are using power-supply or c) the panel has multiple supplies and your
>>> binding is wrong.
>>>
>>> I can only eliminate A if you list the supplies. Just need something
>>> like "power-supply : see simple-panel.txt". I've still got to go read
>>> the panel spec if I really want to check the binding.
>>
>> Just checked the panel datasheet at
>> http://www.glyn.de/data/glyn/media/doc/43wvf1g-0.pdf and it lists two
>> supplies:
>> DVDD (Digital power supply) and AVDD (Analog power supply).
>>
>> Our dts was just providing a single 'power-supply' which referred to a
>> GPIO enabled regulator that drives DVDD.
>>
>> So it seems we missed to pass AVDD (not software controlled in our
>> case, but we need to describe it in dts anyway).
>>
>> Does this mean we cannot use simple-panel for this particular panel
>> and we should add a separate driver for it?
>
> Please confirm if we need to create a separate driver for this panel, thanks.

The binding should list both. They can be optional though. Maybe you
can parameterize the supply name in the driver for the single
(controlled) supply case. Or provide power on/off hooks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
