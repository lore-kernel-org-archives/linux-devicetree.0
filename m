From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of_mdio: use of_property_read_u32_array()
Date: Mon, 7 Aug 2017 13:44:59 -0500
Message-ID: <CAL_JsqLwZogY7n3+uEyGzDbKLv3DmOBAFKgML4XeJiF8Qvzq7A@mail.gmail.com>
References: <20170804214354.351406407@cogentembedded.com> <CAL_JsqKDXAbAVpgMSU39+9mF7MZWQotLUNkjePy9eUsnBs99Vw@mail.gmail.com>
 <080ebcb6-b5aa-63db-176b-83477c2540e5@cogentembedded.com> <f9af35a3-bb53-c554-eb6e-93cf6c24cb29@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <f9af35a3-bb53-c554-eb6e-93cf6c24cb29@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Andrew Lunn <andrew@lunn.ch>, Frank Rowand <frowand.list@gmail.com>, netdev <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 7, 2017 at 1:01 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 08/07/2017 09:18 AM, Sergei Shtylyov wrote:
>> Hello!
>>
>> On 08/07/2017 05:18 PM, Rob Herring wrote:
>>
>>>> The "fixed-link" prop support predated of_property_read_u32_array(), so
>>>> basically had to open-code it. Using the modern API saves 24 bytes of
>>>> the
>>>> object code (ARM gcc 4.8.5); the only behavior change would be that the
>>>> prop length check is now less strict (however the strict pre-check done
>>>> in of_phy_is_fixed_link() is left intact anyway)...
>>>>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>>
>>>> ---
>>>> The patch is against the 'dt/next' branch of Rob Herring's
>>>> 'linux-git' repo
>>>> plus the previously posted patch killing the useless local variable in
>>>> of_phy_register_fixed_link().
>>>
>>> It shouldn't depend on anything in my tree and David normally takes
>>> of_mdio.c changes.
>>
>>    MAINTAINERS still only point at the DT repo, perhaps it should be
>> updated?
>
> More or less done with this (minus the repo part):
>
> http://patchwork.ozlabs.org/patch/795887/

Really I'd like to see this fixed by moving of_mdio.c and of_net.c to
drivers/net/ as we've done for all other subsystems.

Rob
