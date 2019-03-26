Return-Path: <SRS0=u60/=R5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:34112 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726175AbfCZRRz (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Mar 2019 13:17:55 -0400
Subject: Re: [PATCH v4 0/3] Add ZynqMP VCU/Allegro DVT H.264 encoder driver
References: <20190301152718.23134-1-m.tretter@pengutronix.de>
 <20190326084613.405e7ed4@litschi.hi.pengutronix.de>
 <484d66c6-a2c0-6c18-6cdf-81ef647295e3@xs4all.nl>
 <20190326171403.aj7wp5yn6gugkdky@pengutronix.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2b2650f3-7ecf-0277-ecc8-e1c222281665@xs4all.nl>
Date: Tue, 26 Mar 2019 18:17:49 +0100
MIME-Version: 1.0
In-Reply-To: <20190326171403.aj7wp5yn6gugkdky@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Michael Tretter <m.tretter@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, dshah@xilinx.com, mchehab@kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, tfiga@chromium.org
List-ID: <devicetree@vger.kernel.org>

On 3/26/19 6:14 PM, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Mar 26, 2019 at 12:47:38PM +0100, Hans Verkuil wrote:
>> On 3/26/19 8:46 AM, Michael Tretter wrote:
>>> On Fri, 01 Mar 2019 16:27:15 +0100, Michael Tretter wrote:
>>>> This is v4 of the series to add support for the Allegro DVT H.264 encoder
>>>> found in the EV family of the Xilinx ZynqMP platform.
>>>
>>> Ping.
>>
>> It's delegated to me in patchwork, so I'll get to it in a few days.
>>
>> We were waiting for the 5.1-rc1 release.
> 
> There is a misunderstanding somewhere here. We have 5.1-rc2 since
> Sunday and 5.1-rc1 since Sunday the week before. What am I missing?

I was waiting for 5.1-rc1 to be merged into our media master repo, so I
can apply this series on top of that. That happened at last week, so now
I can pick up these patches this week/next week.

Regards,

	Hans
