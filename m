From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v2] ARM: dts: zynq: Add OCM node
Date: Thu, 12 Feb 2015 16:15:43 +0100
Message-ID: <6cd07a2ca61d4083b1a3d370efcc19bc@BN1BFFO11FD016.protection.gbl>
References: <6df19b400e314ef8228be475bb8ba83765683016.1423737765.git.michal.simek@xilinx.com>
 <20150212105443.GB1522@leverpostej>
 <c64e7b4bf78649049cea3dceecea453c@BN1AFFO11FD014.protection.gbl>
 <5c1602f83c594a72aac78c245f1830fa@BL2FFO11FD052.protection.gbl>
 <20150212150709.GG1522@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150212150709.GG1522@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Rob Herring <robherring2@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 02/12/2015 04:07 PM, Mark Rutland wrote:
> On Thu, Feb 12, 2015 at 02:58:36PM +0000, S=C3=B6ren Brinkmann wrote:
>> On Thu, 2015-02-12 at 12:01PM +0100, Michal Simek wrote:
>>> On 02/12/2015 11:54 AM, Mark Rutland wrote:
>>>> On Thu, Feb 12, 2015 at 10:42:47AM +0000, Michal Simek wrote:
>>>>> Add OCM node for all zynq boards. OCM location
>>>>> can changed but for all current boards this
>>>>> is the location where OCM is.`
>>>>>
>>>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>>>> ---
>>>>>
>>>>> Changes in v2:
>>>>> - Move node to board file suggested by Mark
>>>>>
>>>>> This patch is done based on discussion here.
>>>>> https://lkml.org/lkml/2014/12/1/396
>>>>>
>>>>> Mark: I expect you won't like amba bus reference or
>>>>> am I wrong?
>>>>
>>>> I'm fine with dropping things onto a bus in this way. If we're hap=
py to
>>>> do it for other nodes I don't see why busses should be special.
>>>
>>> Wonderful. I will give people some time to comment this style.
>>
>> Given that the location is discoverable, wouldn't it make sense to l=
et
>> 'reg' point to the ctrl/cfg registers in the SLCR and let the driver
>> handle the whereabouts of the OCM location? (but I guess this is goi=
ng
>> in circles now, such a proposal was on the table at some point, IIRC=
).
>> But I'd prefer:
>> 	memory-controller@0xfffc0000 { /* the address here would of course =
not match all configurations */
>=20
> I'd really prefer that we keep the unit-address and reg consistent.
>=20
> Given that the address may change on a per-board basis, it simply has=
 to
> live in the board file.
>=20
> However, given that all boards are currently the same it could be
> dropped in the SoC file for now, with a comment saying it should be
> factored out to boards when the first board with a different address
> comes along.

Soren is talking about different solution which I have tried to push to=
 mainline
in that thread above. OCM configuration is discoverable through system =
controller
to find out which configuration is used.

=46rom this simple sram block it looks like that it is 64k of memory bu=
t
it is just one block which can live in low or high address (at 0x0 or 0=
xfffc0000)
based on controller configuration.

In total there are 4 blocks with low and high locations.

Thanks,
Michal
