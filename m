From: Constantine Shulyupin <const-XSqIthwXjGBDPfheJLI6IQ@public.gmane.org>
Subject: Re: [PATCH v3] Documentation: add Device tree bindings for hwmon/nct7802
Date: Tue, 8 Sep 2015 15:07:30 +0300
Message-ID: <CAE7jHC8tdQCj-qcToBd+y017WZwMMeODGmm4uinMX=nL4yrSKw@mail.gmail.com>
References: <1441664902-32360-1-git-send-email-const@MakeLinux.com>
	<20150908093812.GA19039@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150908093812.GA19039@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>> Add add Device tree bindings for registers
>> which are not covered by hwmon ABI and are required to
>> configure specific HW.
>
> This doesn't really answer my question [1] of why you need these.
>
> We generally don't encode register values unless there's no other way to
> describe the device. Why can we not describe the physical properties of
> the device that make these values necessary?
>
....
> That said, as above I don't believe that these properties make sense
> as they are. I think this needs properties that describe the HW, rather
> than exposing the intricacies of the programming interface.
....
> Thanks,
> Mark.
>
> [1] http://lkml.kernel.org/r/20150907123531.GA11540@leverpostej
>

Sources of the driver:

Let's see to register MODE.
Excerpt from datasheet:

7.2.32 Mode Selection Register
Location : Index 22h
Type : Read/Write
Power on default value : 7Fh
BIT; NAME; FUNC.:
0,1 RTD1_MD : 00=Closed , 01=Current mode , 10=Thermistor mode ,
11=Voltage sense
2,3 RTD2_MD : 00=Closed , 01=Current mode , 10=Thermistor mode ,
11=Voltage sense
4,5 RTD3_MD : 00=Closed , 01=Reserved , 10=Thermistor mode , 11=Voltage sense
6 EnLTD : 1 indicates the LTD function enabled

The register defines sensors types (Closed, Current mode, Thermistor
mode, Voltage sense).
Essential sensors will not work properly with wrong configuration.
It is board or platform depended configuration. It should be
configured on boot only.
Usually hwmon drivers are managed with utility lm-sensors via
Documentation/hwmon/sysfs-interface. By design sensor type should be
defined by platform data and lm-sensors only displays it.

Also MODE registers defines visibility temperature and input attributes:

https://git.kernel.org/cgit/linux/kernel/git/mpe/linux-next.git/tree/drivers/hwmon/nct7802.c#n532

https://git.kernel.org/cgit/linux/kernel/git/mpe/linux-next.git/tree/drivers/hwmon/nct7802.c#n641

Mark, does above answers your question?
What do you propose?

-- 
Thanks
Constantine
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
