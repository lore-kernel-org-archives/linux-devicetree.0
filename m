From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 5/6] Documentation: dt-bindings: Add binding info for X-Gene QMTM UIO driver
Date: Tue, 21 Oct 2014 12:05:42 +0200
Message-ID: <3725049.9xPbukhCva@wuerfel>
References: <1413871011-4101-1-git-send-email-ankit.jindal@linaro.org> <1413871011-4101-6-git-send-email-ankit.jindal@linaro.org> <20141021091412.GB15293@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141021091412.GB15293@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Ankit Jindal <ankit.jindal@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Varka Bhadram <varkabhadram@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, "Hans J. Koch" <hjk@hansjkoch.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "patches@apm.com" <patches@apm.com>, Rob Herring <robh+dt@kernel.org>, Tushar Jagad <tushar.jagad@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 21 October 2014 10:14:12 Mark Rutland wrote:
> 
> > +The Applied Micro X-Gene SOC has on-chip QMTM (Queue manager
> > +and Traffic manager). It is a device for managing hardware queues.
> > +It also implements QoS among hardware queues hence term "traffic"
> > +manager is present in its name. QMTM UIO nodes are defined for user
> > +space access to this device using UIO framework.
> 
> The binding should describe the hardware, not the software. Please drop
> mention of UIO, userspace, etc.

I have a bad feeling about the entire idea of doing the UIO driver first,
there are too many unknowns here and we should not break the binding
when the proper driver gets added.

The X-Gene is meant for server workloads, so the UIO approach is not
a good longterm solution anyway. My impression is that it would be
better to first get the kernel driver for this hardware merged and
the binding fixed, and then a UIO stub could get added to that driver,
taking over the hardware by user space. This would also solve the
arbitration between the two driver implementations. It's also possible
that by that time, we will have a functional VFIO framework for
platform devices.

	Arnd
