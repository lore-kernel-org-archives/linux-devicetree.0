From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 2/5] gpio/xilinx: enable for MIPS
Date: Wed, 14 Oct 2015 10:33:50 -0700
Message-ID: <20151014173350.GV15287@xsjsorenbubuntu>
References: <1444827117-10939-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1444827117-10939-3-git-send-email-Zubair.Kakakhel@imgtec.com>
 <20151014151813.GL15287@xsjsorenbubuntu>
 <561E7B65.3090704@metafoo.de>
 <20151014165450.GS15287@xsjsorenbubuntu>
 <561E8FDF.9070500@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <561E8FDF.9070500@metafoo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, ralf@linux-mips.org, robh+dt@kernel.org, linus.walleij@linaro.org, linux-mips@linux-mips.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-10-14 at 07:24PM +0200, Lars-Peter Clausen wrote:
> On 10/14/2015 06:54 PM, S=C3=B6ren Brinkmann wrote:
> > On Wed, 2015-10-14 at 05:57PM +0200, Lars-Peter Clausen wrote:
> >> On 10/14/2015 05:18 PM, S=C3=B6ren Brinkmann wrote:
> >>> On Wed, 2015-10-14 at 01:51PM +0100, Zubair Lutfullah Kakakhel wr=
ote:
> >>>> MIPSfpga uses the axi gpio controller. Enable the driver for MIP=
S.
> >>>>
> >>>> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec=
=2Ecom>
> >>>> ---
> >>>>  drivers/gpio/Kconfig | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> >>>> index 8949b3f..58e9afd 100644
> >>>> --- a/drivers/gpio/Kconfig
> >>>> +++ b/drivers/gpio/Kconfig
> >>>> @@ -508,7 +508,7 @@ config GPIO_XGENE_SB
> >>>> =20
> >>>>  config GPIO_XILINX
> >>>>  	tristate "Xilinx GPIO support"
> >>>> -	depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ || X86)
> >>>> +	depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ || X86 |=
| MIPS)
> >>>
> >>> Hmm, in general, this driver is hopefully generic enough that it =
doesn't
> >>> have any real architecture dependencies. And I suspect, we want t=
o
> >>> enable this driver for ARM64 for ZynqMP soon too. Should we proba=
bly
> >>> drop these arch dependencies completely? It seems to become quite=
 a long list.
> >>
> >> I've been thinking about this a while ago. This is certainly not t=
he only
> >> driver affected by this problem. But the thing is people always co=
mplain if
> >> new symbols become visable in Kconfig that don't apply to their pl=
atform.
> >>
> >> Maybe we should introduce a HAS_REPROGRAMABLE_LOGIC (or similar) f=
eature
> >> Kconfig symbol and let platforms which have a FPGA select it and l=
et drivers
> >> for FPGA peripherals depend on it.
> >=20
> > Sounds like a good idea to me. But, does that work for all use-case=
s.
> > E.g. if you plug some PCIe card with an FPGA into an x86(_64) machi=
ne.
> > That would allow you to use those drivers, but I'm not sure how tha=
t
> > could pull in the new config symbol.
>=20
> Hm, right. We could also make it a user-selectable config symbol. In =
that
> case you only need to disable one symbol when you don't have FPGA sup=
port
> rather than one for each driver. Although I'm not quite sure where to=
 put
> such a symbol.

Eventually, the FPGA manager subsystem could probably provide some high
level config symbols. Though, it is probably also not given that every
=46PGA-enabled platform needs the FPGA manager.

	S=C3=B6ren
