From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] ARM: dts: r8a7792: add IMR-L[S]X3 clocks
Date: Wed, 28 Jun 2017 23:49:01 +0300
Message-ID: <fbd0e4c2-746c-8f74-a8e5-ab971a087aed@cogentembedded.com>
References: <20170321200443.078095898@cogentembedded.com>
 <34050114-752a-08b6-700e-697e78102af7@cogentembedded.com>
 <a802018c-9943-22e5-0f78-28b8ab9689d9@cogentembedded.com>
 <20170329080417.GD6512@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170329080417.GD6512@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello!

On 03/29/2017 11:04 AM, Simon Horman wrote:

>>> Still not cover letter but I think it's better now, so I won't retry...
>>> The patches are against Simon Horman's 'renesas.git' repo,
>>> 'renesas-devel-20170321-v4.11-rc3' tag.
>>
>>    The patches depend on the IMR driver patches adding the IMR-L[S]X3
>> support for the "compatible" values.
>
> I have marked these patches as deferred accordingly.

    Actually, the 1st patch in htis series doesn't depend on anything and 
should still apply (with offsets).

WBR, Sergei
