From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] ARM: dts: r8a7791: link DU to VSPDs
Date: Wed, 1 Feb 2017 14:40:52 +0300
Message-ID: <4bf0b27c-9641-391d-fc05-8cdc20ce4ec3@cogentembedded.com>
References: <1529351.Fac5N2tKoF@wasted.cogentembedded.com>
 <2492577.tBEnW0tCHD@wasted.cogentembedded.com>
 <4ae454ad-296c-dec9-27e9-fd050333737f@cogentembedded.com>
 <CANqRtoSQTa0fHJSwAHbN3hXSZ=m1kuR2GsUWE5ojN5AN-9i6Bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CANqRtoSQTa0fHJSwAHbN3hXSZ=m1kuR2GsUWE5ojN5AN-9i6Bw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: "Simon Horman [Horms]" <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 2/1/2017 2:13 PM, Magnus Damm wrote:

>>> Add the "vsps" property to the DU device node in order to link this node
>>> to
>>> the VSPD nodes.
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> ---
>>> Changes in version 2:
>>> - rebased the patch.
>>>
>>> This patch is against the 'renesas-devel-20170125-v4.10-rc5' of Simon
>>> Horman's
>>> 'renesas.git' repo.  It's  only meaningful if the DRM driver patches I've
>>> just
>>> posted are applied.
>>
>>
>>    Forgot to note that without this patch the DU driver fails to link to
>> VSPD and probe correctly, so there's no video signal. So it makes sense to
>> apply before the DU driver patch (once it's ACKed for merge)...
>
> Doesn't that translate to breaking the DT ABI? Is there someway we can
> avoid doing that?

    It doesn't -- if this patch is merged ahead of the DU patches.

> Thanks,
>
> / magnus

MBR, Sergei
