Return-Path: <devicetree-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:46766 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753117Ab3GaP2i convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 31 Jul 2013 11:28:38 -0400
Message-ID: <51F92D3B.3070103@arm.com>
Date: Wed, 31 Jul 2013 16:28:59 +0100
From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 1/2] PM / OPP: add support to specify phandle of another
 node for OPP
References: <1375207217-4433-1-git-send-email-Sudeep.KarkadaNagesha@arm.com> <1375207217-4433-2-git-send-email-Sudeep.KarkadaNagesha@arm.com> <51F80750.8030701@wwwdotorg.org> <51F826A0.2000109@ti.com> <51F8F17B.1020304@arm.com> <51F9234A.6010501@ti.com>
In-Reply-To: <51F9234A.6010501@ti.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, "Rafael J. Wysocki" <rjw@sisk.pl>
List-ID: <devicetree@vger.kernel.org>

On 31/07/13 15:46, Nishanth Menon wrote:
> On 07/31/2013 06:14 AM, Sudeep KarkadaNagesha wrote:
>> On 30/07/13 21:48, Nishanth Menon wrote:
[...]
>>> This should setup stage for many of the work we have been trying to
>>> figure out on AM/OMAP and few other processors which has to depend on
>>> few sets of OPPs which may not be supported on various platforms.
>>>
>> I still don't get the point why you would publish some OPP in the DT
>> when the hardware which it describes doesn't support it.
>>
>> This may be already discussed when DT support was added to OPP library,
>> IMO if for some reason the firmware/boot entity disables some of the
>> OPPs, then it can append OPPs in DT with the state(enabled/disabled).
>> But this needs extension of current binding.
> 
> you could also have reduced OPP set which needs to be invoked, appending 
> wont really work if cpufreq table is built as part of probe - it kind of 
> creates all kind of races which I would really like to avoid.
> 
IIUC opp_set_availability(opp_enable/opp_disable) is designed for such
use-case ? Currently there are no users of this API but I see it fits
your use case.

Even with multiple OPP sets listed in DT as you described, you need to
read those fuses and chose the right set of OPPs. Instead you can use
opp_en(/dis)able methods to do that ?

Regards,
Sudeep

