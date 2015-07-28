From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [RFCv2 2/3] dts: zynq: Add devicetree entry for Xilinx Zynq reset controller.
Date: Tue, 28 Jul 2015 06:54:43 -0700
Message-ID: <CAAtXAHeko4tUhK-yjXxwfJkLxG3c5kjtyHML=z4mdnOXDy3E2Q@mail.gmail.com>
References: <1437783682-13632-1-git-send-email-moritz.fischer@ettus.com>
	<1437783682-13632-3-git-send-email-moritz.fischer@ettus.com>
	<55B5D62D.4010407@monstr.eu>
	<CAAtXAHepDRbiiznHnT3dLLLWS_VH2a9BhnNgZzDECx__QceEeg@mail.gmail.com>
	<55B72857.3020108@atmel.com>
	<55B732E6.7080901@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55B732E6.7080901@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Michal Simek <monstr@monstr.eu>, p.zabel@pengutronix.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

Nicolas, Michal,

if macb doesn't benefit from it, no need for the reset in there then.
I think Michal's suggestion of adding it on an as necessary basis works=
 fine.
=46or the PATCH round I'll just have the SLCR in there and drivers can
add it to their nodes later on if required.

Thanks,
Moritz

On Tue, Jul 28, 2015 at 12:44 AM, Michal Simek <michal.simek@xilinx.com=
> wrote:
> On 07/28/2015 08:59 AM, Nicolas Ferre wrote:
>> Le 28/07/2015 07:03, Moritz Fischer a =C3=A9crit :
>>> Hi Michal,
>>>
>>> I agree we need to be careful with changing the bindings.
>>>
>>> On Sun, Jul 26, 2015 at 11:56 PM, Michal Simek <monstr@monstr.eu> w=
rote:
>>>> Hi Moritz,
>>>>
>>>> On 07/25/2015 02:21 AM, Moritz Fischer wrote:
>>>>> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
>>>>> ---
>>>>>  arch/arm/boot/dts/zynq-7000.dtsi            | 43 ++++++++++++-
>>>>
>>>> This patch is nice in general but every change in binding should b=
e
>>>> discussed separately. There is also necessary to wire them up in t=
he
>>>> driver to do action. That's why I think that will be the best just=
 to
>>>> add the code to slcr and keep others untouched.
>>>
>>> Ok, just to clarify: You'd suggest to just add the rstc as child no=
de
>>> to the slcr,
>>> and leave the other nodes untouched?
>>>
>>>>
>>>> For example MACB/GEM is one example. Adding names to this node and
>>>> extending driver to work properly with reset means that all others=
 MACB
>>>> users will be affected. Definitely this patch should be ACKed by N=
icolas.
>>
>> Actually, I don't know why a reset property should be added to the m=
acb
>> driver...
>
> I expect resetting IP core can solve something. But as I said it is
> questionable if IP should be reset when driver is probed. Definitely =
on
> Zynq there is a support for it. I am not aware about any problem whic=
h
> requires IP to be reset.
>
> Thanks,
> Michal
>
