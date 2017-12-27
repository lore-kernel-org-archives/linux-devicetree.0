Return-Path: <SRS0=hVpw=DX=rock-chips.com=jeffy.chen@kernel.org>
Message-ID: <5A42F154.1080002@rock-chips.com>
Date: Wed, 27 Dec 2017 09:03:16 +0800
From: JeffyChen <jeffy.chen@rock-chips.com>
MIME-Version: 1.0
Subject: Re: [RFC PATCH v12 2/5] of/irq: Adjust of_pci_irq parsing for multiple
 interrupts
References: <20171226023646.17722-1-jeffy.chen@rock-chips.com> <20171226023646.17722-3-jeffy.chen@rock-chips.com> <CAL_JsqL8nztgA0RWw5f_H75T4iVEDt23poUXb_RsL+jWmQ-X6w@mail.gmail.com>
In-Reply-To: <CAL_JsqL8nztgA0RWw5f_H75T4iVEDt23poUXb_RsL+jWmQ-X6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pm@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Shawn Lin <shawn.lin@rock-chips.com>, Brian Norris <briannorris@chromium.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Doug Anderson <dianders@chromium.org>, Frank Rowand <frowand.list@gmail.com>, open@263.net, list@263.net, OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

Thanks for your reply :)

On 12/26/2017 11:48 PM, Rob Herring wrote:
>> >+               /*
>> >+                * Only parse from DT if we have no "interrupt-names",
>> >+                * or if we found an interrupt named "pci".
>> >+                */
>> >+               if (index == 0 || name) {
>> >+                       rc = of_irq_parse_one(dn, index, out_irq);
>> >+                       if (!rc)
>> >+                               return rc;
>> >+               }
> As mentioned before, use of_property_match_string. The following should work:
>
> index = of_property_match_string(dn, "interrupt-names", "pci");
> if (index == -EINVAL)  /* Property doesn't exist */
>    index = 0;
>
> if (index >= 0) {
>    rc = of_irq_parse_one(dn, index, out_irq);
>    if (!rc)
>      return rc;
> }

hmmm, right, that should work. didn't notice of_property_match_string() 
would return different error numbers for string not found and property 
doesn't exist...

will do this in the next version, thanks :)

>
>
