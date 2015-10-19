From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] gpio/xilinx: enable for MIPS
Date: Mon, 19 Oct 2015 08:55:09 +0200
Message-ID: <CACRpkdb0joX35HdcSJ=afchMCNVo7i=an3HE4BnK0xA_Gb5YpA@mail.gmail.com>
References: <1444827117-10939-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<1444827117-10939-3-git-send-email-Zubair.Kakakhel@imgtec.com>
	<20151014151813.GL15287@xsjsorenbubuntu>
	<561E7B65.3090704@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <561E7B65.3090704@metafoo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 14, 2015 at 5:57 PM, Lars-Peter Clausen <lars@metafoo.de> w=
rote:
> On 10/14/2015 05:18 PM, S=C3=B6ren Brinkmann wrote:
>> On Wed, 2015-10-14 at 01:51PM +0100, Zubair Lutfullah Kakakhel wrote=
:

>> Hmm, in general, this driver is hopefully generic enough that it doe=
sn't
>> have any real architecture dependencies. And I suspect, we want to
>> enable this driver for ARM64 for ZynqMP soon too. Should we probably
>> drop these arch dependencies completely? It seems to become quite a =
long list.
>
> I've been thinking about this a while ago. This is certainly not the =
only
> driver affected by this problem. But the thing is people always compl=
ain if
> new symbols become visable in Kconfig that don't apply to their platf=
orm.

I don't think it's that important. If people go do down in the GPIO sub=
menu
they are looking at real weird stuff anyways. Please send a patch enabl=
ing
this for all rather than coming up with strange config symbols IMO.

Yours,
Linus Walleij
