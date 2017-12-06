From: =?iso-8859-1?Q?Patrick_Br=FCnn?= <P.Bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH v2 5/5] rtc: add mxc driver for i.MX53 SRTC
Date: Wed, 6 Dec 2017 09:28:09 +0000
Message-ID: <3BB206AB2B1BD448954845CE6FF69A8E01CB531D7C@NT-Mail07.beckhoff.com>
References: <20171205140646.30367-1-linux-kernel-dev@beckhoff.com>
 <20171205140646.30367-6-linux-kernel-dev@beckhoff.com>
 <20171206083618.eea63zqmpgaaazwl@pengutronix.de>
 <20171206085825.GM21780@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171206085825.GM21780-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-kernel-dev <linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Juergen Borleis <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Noel Vellemans <Noel.Vellemans-8UENEgx6w+makBO8gow8eQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =?iso-8859-1
List-Id: devicetree@vger.kernel.org

>From: Alexandre Belloni [mailto:alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org]
>Sent: Mittwoch, 6. Dezember 2017 09:58
>On 06/12/2017 at 09:36:18 +0100, Sascha Hauer wrote:
>> > +/*
>> > + * This function updates the RTC alarm registers and then clears all the
>> > + * interrupt status bits.
>> > + * The caller should hold the pdata->lock
>> > + *
>> > + * @param  alrm         the new alarm value to be updated in the RTC
>> > + *
>> > + * @return  0 if successful; non-zero otherwise.
>> > + */
>> > +static int mxc_rtc_write_alarm_locked(struct mxc_rtc_data *const pdata,
>> > +                                struct rtc_time *alarm_tm)
>> > +{
>> > +  void __iomem *const ioaddr = pdata->ioaddr;
>> > +  unsigned long time;
>> > +
>> > +  rtc_tm_to_time(alarm_tm, &time);
>> > +
>> > +  if (time > U32_MAX) {
>> > +          pr_err("Hopefully I am out of service by then :-(\n");
>> > +          return -EINVAL;
>> > +  }
>>
>> This will never happen as on your target hardware unsigned long is a
>> 32bit type. Not sure what is best to do here. Maybe you should test
>> the return value of rtc_tm_to_time. ATM it returns 0 unconditionally,
>> but rtc_tm_to_time could detect when the input time doesn't fit into
>> its return type and return an error in this case.
>> Also I just realized that it's unsigned and only overflows in the year
>> 2106. I'm most likely dead then so I don't care that much ;)
>>
>
>One solution is to use the 64bit version instead so it doesn't overflow.
>This makes the time > U32_MAX work.
>Also, I'll send (hopefully soon) a series adding proper range checking
>for the whole RTC subsystem. And yes, it not urgent as I don't think I
>will care so much in 2106 too ;)
>
I just noticed that in mxc_rtc_set_time() I am using the 64bit version.
After thinking a while about this issue, I think the 64bit version is better
suited for my use case. It makes explicitly clear that I need to push the
time into a 32bit hw register and "unsigned long" is just by accident the
correct size for me.

>> > +/*
>> > + * This function reads the current RTC time into tm in Gregorian date.
>> > + *
>> > + * @param  tm           contains the RTC time value upon return
>> > + *
>> > + * @return  0 if successful; non-zero otherwise.
>> > + */
>> > +static int mxc_rtc_read_time(struct device *dev, struct rtc_time *tm)
>> > +{
>> > +  struct mxc_rtc_data *pdata = dev_get_drvdata(dev);
>> > +  time_t now;
>> > +  int ret = mxc_rtc_lock(pdata);
>> > +
>> > +  if (ret)
>> > +          return ret;
>> > +
>> > +  now = readl(pdata->ioaddr + SRTC_LPSCMR);
>> > +  rtc_time_to_tm(now, tm);
>> > +  ret = rtc_valid_tm(tm);
>
>This check is useless for two reasons: you know that rtc_time_to_tm will
>generate a valid tm and the core always checks the tm anyway.
I will remove this with the next version

Thanks for your time and help,
Patrick

Beckhoff Automation GmbH & Co. KG | Managing Director: Dipl. Phys. Hans Beckhoff
Registered office: Verl, Germany | Register court: Guetersloh HRA 7075



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
