From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH] ARM: dts: keystone: use one to one address translations
 under netcp
Date: Thu, 03 Sep 2015 07:48:56 -0700
Message-ID: <55E85DD8.4070102@oracle.com>
References: <1441139324-29296-1-git-send-email-w-kwok2@ti.com> <55E61658.9010207@oracle.com> <230CBA6E4B6B6B418E8730AC28E6FC7E04221776@DFLE11.ent.ti.com> <55E71AB3.7070406@oracle.com> <20150903142645.GS4215@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150903142645.GS4215@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: "Kwok, WingMan" <w-kwok2@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ssantosh@kernel.org" <ssantosh@kernel.org>, "Karicheri, Muralidharan" <m-karicheri2@ti.com>
List-Id: devicetree@vger.kernel.org

On 9/3/15 7:26 AM, Tony Lindgren wrote:
> * santosh shilimkar <santosh.shilimkar@oracle.com> [150902 08:55]:
>>
>> I suspected the same. I know back then we started with SERDES code
>> with NETCP but as you already know, its a separate block which
>> is needed for NIC card to work. Its more of phy and hence its
>> having different address space is not surprising.
>
> The point Santosh is making here though is that any drivers
> tinkering with registers belonging to a separate hardware block
> is a recipe for a long term maintenance nightmare with mysterious
> bugs popping up as things are not clocked or powered properly
> or become racy with other drivers.
>
> Each hardware block needs to have it's own driver and then the
> drivers can communicate using some Linux generic APIs like clock,
> regulator, phy, or mailbox frameworks.
>
Right !!

Regards,
Santosh
