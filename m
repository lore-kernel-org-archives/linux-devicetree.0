From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v4 2/4] mfd: lubbock_cplds: add lubbock IO board
Date: Sat, 28 Feb 2015 16:29:02 +0100
Message-ID: <87h9u62gxt.fsf@free.fr>
References: <20150216130549.GF14545@x1>
	<1170550770.470129293.1424093248596.JavaMail.root@zimbra1-e1.priv.proxad.net>
	<20150216162712.GR14545@x1> <87fva5a4i2.fsf@free.fr>
	<20150217074310.GT14545@x1>
	<alpine.LFD.2.11.1502171221300.22104@knanqh.ubzr>
	<20150218080719.GB5781@x1> <87a9088tam.fsf@free.fr>
	<87mw3y2wad.fsf@free.fr> <20150228151141.GA22302@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150228151141.GA22302@kroah.com> (Greg Kroah-Hartman's message
	of "Sat, 28 Feb 2015 07:11:41 -0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee.jones@linaro.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
List-Id: devicetree@vger.kernel.org

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> On Sat, Feb 28, 2015 at 10:57:30AM +0100, Robert Jarzmik wrote:
>> Robert Jarzmik <robert.jarzmik@free.fr> writes:
>> 
>> > Hi Arnd and Greg,
>> It's been a week, backlog ping ?
>
> If only my backlog was just one week...
Ah, that's bad :)

> And I'm not the mfd maintainer...
I know. The question was for the "all drivers" maintainer ... ie. you.

The question was where should CPLD drivers end up, given that the mfd maintainer
pushed back.

Yet I understand you're overflowed, and I'll take it into arch/arm/plat-pxa. I
don't think it's the right place, but it's my only fallback.

Cheers.

-- 
Robert
