From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC PATCH 4/4] ARM: Xilinx: Adding Xilinx board support
Date: Mon, 2 May 2011 17:36:04 -0600
Message-ID: <BANLkTim4PFNbnD2LwZRwNKTQLiuNpGjrBw@mail.gmail.com>
References: <90477150.2231869.1304372815517.JavaMail.root@sz0140a.emeryville.ca.mail.comcast.net>
 <1319927287.2232106.1304373011082.JavaMail.root@sz0140a.emeryville.ca.mail.comcast.net>
 <20110502230118.GE28001@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110502230118.GE28001@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: johnlinn@comcast.net, Arnd Bergmann <arnd@arndb.de>, nicolas pitre <nicolas.pitre@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, john linn <john.linn@xilinx.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, May 2, 2011 at 5:01 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Mon, May 02, 2011 at 09:50:11PM +0000, johnlinn@comcast.net wrote:
>> Seems easy enough assuming we don't need the SCU early for the core =
count
>> and can get that from the device tree.
>
> Beware. =A0Things may not be that trivial when you start considering =
some
> of the weirdnesses that some vendors start coming out with.
>
>> Since the SCU and part of the GIC end up in the same 4K page they ne=
ed to be
>> together (unless I'm thinking about that wrong).
>>
>> SCU 0xF8000000
>> GIC_CPU 0xF8000100
>> GIC_DIS 0xF8001000
>
> It is preferable to use the same mapping, as it ensures that you're n=
ot
> going to create incompatible aliases.
>
> But, before we get too bogged down with this, please realise that it =
is
> possible to setup early mappings from the device tree for things like=
 the
> SCU. =A0Maybe not using ioremap(), but I'm sure we can find some way =
to use
> the iotable_init() stuff to setup some early mappings from DT for thi=
s
> stuff.

absolutely.

g.
