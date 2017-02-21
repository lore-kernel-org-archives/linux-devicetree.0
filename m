From: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: juno: update definition for programmable replicator.
Date: Tue, 21 Feb 2017 12:46:20 +0000
Message-ID: <CAJ9a7VhKtS-nrSBWQzMWkO1E1BajZY2aGBurdRAB05tGy2xs9A@mail.gmail.com>
References: <1487358790-2618-1-git-send-email-mike.leach@linaro.org>
 <2ba59da5-fc79-ab53-2f2a-2ddc6e5e9c3d@arm.com> <DB6PR0802MB219850A35C8DAD5CB2858C1C8C510@DB6PR0802MB2198.eurprd08.prod.outlook.com>
 <798053cd-ae5a-dc04-12c9-9df9e0d66b4d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <798053cd-ae5a-dc04-12c9-9df9e0d66b4d-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Mike Leach <Mike.Leach-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The messages are not a normal linux / kernel warning message, but a
result of the offline trace decode process:-

  110739: I_OVERFLOW : Overflow.
  110741: I_ASYNC : Alignment Synchronisation.
  110754: I_TRACE_INFO : Trace Info.; PCTL=0x0
  110757: I_TRACE_ON : Trace On.

If this is sufficient with an explanation I'm happy to add it to the patch.

Mike


On 21 February 2017 at 12:37, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>
>
> On 21/02/17 12:34, Mike Leach wrote:
>> Hi Sudeep
>>
>>> -----Original Message-----
>>> From: CoreSight [mailto:coresight-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org] On Behalf Of
>>> Sudeep Holla
>>> Sent: 21 February 2017 11:03
>>> To: Mike Leach; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org;
>>> robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; Sudeep Holla
>>> Subject: Re: [PATCH] arm64: dts: juno: update definition for programmable
>>> replicator.
>>>
>>> Hi Mike,
>>>
>>> On 17/02/17 19:13, Mike Leach wrote:
>>>> Juno platforms have a programmable replicator splitting the trace
>>>> output to TPIU and ETR. Currently this is not being programmed as it
>>>> is being treated as a none-programmable replicator - which is the
>>>> default operational mode for these devices. The TPIU in the system is
>>>> enabled by default, and this combination is causing back-pressure in
>>>> the trace system resulting in overflows at the source.
>>>>
>>>> Replaces the existing definition with one that defines the
>>>> programmable replicator, using the "qcom,coresight-replicator1x"
>>>> driver that provides the correct functionality for CoreSight programmable
>>> replicators.
>>>>
>>>
>>> I assume this is just enhancement and not a fix.
>>
>> I guess it depends on your point of view - with this update the trace
>> overflows I was seeing disappear, as the trace path to TPIU is
>> blocked. So it affects the quality of collected trace using the ETR
>> rather than a binary didn't work / works now change.
>>
>
> OK, could you add the warning overflow messages if you get, so that it's
> very clear from the change log. Then I can see if it can be pushed as fix.
>
> --
> Regards,
> Sudeep



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Blackburn Design Centre. UK
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
