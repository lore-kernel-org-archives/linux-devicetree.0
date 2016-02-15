From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 1/3] clk: unconditionally recurse into clk/mvebu/
Date: Mon, 15 Feb 2016 12:06:34 +0100
Message-ID: <87si0uutad.fsf@free-electrons.com>
References: <1455521698-7905-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1455521698-7905-2-git-send-email-thomas.petazzoni@free-electrons.com>
	<CAPv3WKdnFg6AYNGexyEvMEjKmHadj4+CH5avnd=5d_HEKCTc2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAPv3WKdnFg6AYNGexyEvMEjKmHadj4+CH5avnd=5d_HEKCTc2A@mail.gmail.com>
	(Marcin Wojtas's message of "Mon, 15 Feb 2016 09:33:26 +0100")
Sender: linux-clk-owner@vger.kernel.org
To: Marcin Wojtas <mw@semihalf.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Nadav Haklai <nadavh@marvell.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Marcin,
=20
 On lun., f=C3=A9vr. 15 2016, Marcin Wojtas <mw@semihalf.com> wrote:

> Hi Thomas,
>
>
>
> 2016-02-15 8:34 GMT+01:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
>> The drivers/clk/mvebu directory is only being built when
>> CONFIG_PLAT_ORION=3Dy. As we are going to support additional mvebu
>> platforms in drivers/clk/mvebu, which don't have CONFIG_PLAT_ORION=3D=
y,
>> we need to recurse into this directory regardless of the value of
>> CONFIG_PLAT_ORION.
>>
>> Since all files in drivers/clk/mvebu/ are already conditionally
>> compiled depending on various Kconfig options, we can recurse
>> unconditionally into drivers/clk/mvebu without any other change.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com=
>
>> ---
>>  drivers/clk/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>> index b038e36..e08bb0e 100644
>> --- a/drivers/clk/Makefile
>> +++ b/drivers/clk/Makefile
>> @@ -61,7 +61,7 @@ obj-$(CONFIG_ARCH_MEDIATEK)           +=3D mediate=
k/
>>  ifeq ($(CONFIG_COMMON_CLK), y)
>>  obj-$(CONFIG_ARCH_MMP)                 +=3D mmp/
>>  endif
>> -obj-$(CONFIG_PLAT_ORION)               +=3D mvebu/
>> +obj-y                                  +=3D mvebu/
>
> I know it works with obj-y, but how about using
> obj-$(CONFIG_ARCH_MVEBU)? A person editing this Kconfig in future
> wouldn't have to run git blame in order to ensure with your commit
> log, that he doesn't compile anything more than planned.

I think it is still possible to have CONFIG_PLAT_ORION selected without
having CONFIG_ARCH_MVEBU. So for your concern, adding a comment would b=
e
enough.

Gregory


>
> Best regards,
> Marcin

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
