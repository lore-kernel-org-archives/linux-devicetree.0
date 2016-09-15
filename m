From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 1/3] misc: Add Aspeed BT IPMI host driver
Date: Thu, 15 Sep 2016 08:51:41 +0200
Message-ID: <3e2658cc-7089-abd2-23b3-ffd468edbd11@kaod.org>
References: <1472664259-23933-1-git-send-email-clg@kaod.org>
 <c06a8afb-9143-6aef-3425-ad1e50cae35d@kaod.org>
 <1ce6c4b4-5938-22fc-7467-d1efc220b772@gmail.com> <4727554.yt7pF8chOH@wuerfel>
 <7db5ada0-49ea-55eb-089e-d979941ceff5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7db5ada0-49ea-55eb-089e-d979941ceff5@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: minyard@acm.org, Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Alistair Popple <alistair@popple.id.au>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>
List-Id: devicetree@vger.kernel.org

On 09/12/2016 10:33 PM, Corey Minyard wrote:
> On 09/12/2016 02:15 PM, Arnd Bergmann wrote:
>> On Monday, September 12, 2016 1:55:40 PM CEST Corey Minyard wrote:
>>> On 09/02/2016 08:22 AM, C=E9dric Le Goater wrote:
>>>> Hello,
>>>>
>>>> Adding Corey in cc: . I guess I should have done that in the first pla=
ce.
>>> Yes, probably so.  I've been travelling and didn't see it on the mailing
>>> lists until now.
>>>
>>> There is already a BT driver in the kernel, in drivers/char/ipmi, why
>>> won't that work?
>> The new driver is the host side (running on the BMC), the existing one
>> is the client (running on the PC).
>>
>>     Arnd
> =

> Ok, that's not really clear from the documentation or the Kconfig.
> In the IPMI spec the "host" side is the computer side, not the BMC
> side.  Like:
> =

>    11.6.1 BT Host Interface Registers
>    The Host BT interface provides an independent set of registers and
>    interrupts to allow the Host driver to
>    communicate with the baseboard management controller without
>    conflicting with the O/S ACPI driver.
> =

> In light of that, this should probably be named the bt-bmc driver.
> =

> I haven't reviewed this in detail, but I'm ok with putting it in
> drivers/char/ipmi.  The state machine part looks reasonably
> generic.  The configuration part isn't, but that could be split
> out later if necessary.

what do you mean by configuration ? I am ready to send a v2. May be
I can add a few other things.

Thanks,

C. =
