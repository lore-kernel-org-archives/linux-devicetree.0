From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 4/4] arm64: dts: juno: add missing CoreSight STM
 component
Date: Tue, 17 Jan 2017 14:55:32 +0000
Message-ID: <85365bbd-7512-2a39-3698-f9a583334ee7@arm.com>
References: <1484655313-9025-1-git-send-email-sudeep.holla@arm.com>
 <1484655313-9025-5-git-send-email-sudeep.holla@arm.com>
 <5c742b98-0707-67fd-d8a1-467f34d99cdb@arm.com>
 <6473418b-95d5-5be3-47fd-4c554f353923@arm.com>
 <DB6PR0802MB2198D30880E268077202AAD88C7C0@DB6PR0802MB2198.eurprd08.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DB6PR0802MB2198D30880E268077202AAD88C7C0-Su+keVU6bdiU6P2sXUe/YkdOKmgb957onBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Leach <Mike.Leach-5wv7dgnIgG8@public.gmane.org>, Suzuki Poulose <Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, "coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 17/01/17 14:52, Mike Leach wrote:

[...]

>> 
>> Mike,
>> 
>> Can you confirm ? I know TRM had some issues with size of other 
>> coresight components.
>> 
> Checked both Juno and STM arch manuals - these are in agreement that
> the STM memory stimulus area is 16MB in size. Thus for Juno
> specifically with all masters seeing the same area @ base 0x28000000,
> <0 0x28000000 0 0x1000000 >  would be the correct description.
> 

Thanks for the confirmation, I have already made the changes in [1]

-- 
Regards,
Sudeep

[1] git.kernel.org/sudeep.holla/linux/h/for-next/updates/juno

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
