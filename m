From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: juno: update definition for programmable
 replicator.
Date: Tue, 21 Feb 2017 12:37:31 +0000
Message-ID: <798053cd-ae5a-dc04-12c9-9df9e0d66b4d@arm.com>
References: <1487358790-2618-1-git-send-email-mike.leach@linaro.org>
 <2ba59da5-fc79-ab53-2f2a-2ddc6e5e9c3d@arm.com>
 <DB6PR0802MB219850A35C8DAD5CB2858C1C8C510@DB6PR0802MB2198.eurprd08.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DB6PR0802MB219850A35C8DAD5CB2858C1C8C510-Su+keVU6bdiU6P2sXUe/YkdOKmgb957onBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Leach <Mike.Leach-5wv7dgnIgG8@public.gmane.org>, Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 21/02/17 12:34, Mike Leach wrote:
> Hi Sudeep
> 
>> -----Original Message-----
>> From: CoreSight [mailto:coresight-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org] On Behalf Of
>> Sudeep Holla
>> Sent: 21 February 2017 11:03
>> To: Mike Leach; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org;
>> robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; Sudeep Holla
>> Subject: Re: [PATCH] arm64: dts: juno: update definition for programmable
>> replicator.
>>
>> Hi Mike,
>>
>> On 17/02/17 19:13, Mike Leach wrote:
>>> Juno platforms have a programmable replicator splitting the trace
>>> output to TPIU and ETR. Currently this is not being programmed as it
>>> is being treated as a none-programmable replicator - which is the
>>> default operational mode for these devices. The TPIU in the system is
>>> enabled by default, and this combination is causing back-pressure in
>>> the trace system resulting in overflows at the source.
>>>
>>> Replaces the existing definition with one that defines the
>>> programmable replicator, using the "qcom,coresight-replicator1x"
>>> driver that provides the correct functionality for CoreSight programmable
>> replicators.
>>>
>>
>> I assume this is just enhancement and not a fix.
> 
> I guess it depends on your point of view - with this update the trace
> overflows I was seeing disappear, as the trace path to TPIU is
> blocked. So it affects the quality of collected trace using the ETR
> rather than a binary didn't work / works now change.
> 

OK, could you add the warning overflow messages if you get, so that it's
very clear from the change log. Then I can see if it can be pushed as fix.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
