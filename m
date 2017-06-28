From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: document /sys/firmware/fdt
Date: Wed, 28 Jun 2017 14:46:47 -0700
Message-ID: <595423C7.7040400@gmail.com>
References: <1497414007-8380-1-git-send-email-frowand.list@gmail.com>
 <20170622152124.hc7pgqlirr6h7t7k@rob-hp-laptop>
 <20170622152329.ear3hkossznzk3o5@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170622152329.ear3hkossznzk3o5@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, glikely@secretlab.ca
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/22/17 08:23, Rob Herring wrote:
> Meant to add Grant.
> 
> On Thu, Jun 22, 2017 at 10:21:24AM -0500, Rob Herring wrote:
>> On Tue, Jun 13, 2017 at 09:20:07PM -0700, frowand.list@gmail.com wrote:
>>> From: Frank Rowand <frank.rowand@sony.com>
>>>
>>> Add ABI documentation for /sys/firmware/fdt
>>>
>>> Update contact for /sys/firmware/devicetree/* to include mail list
>>>
>>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>>> ---
>>>  Documentation/ABI/testing/sysfs-firmware-ofw | 27 ++++++++++++++++++++++++++-
>>>  1 file changed, 26 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-firmware-ofw b/Documentation/ABI/testing/sysfs-firmware-ofw
>>> index f562b188e71d..8e700db6c295 100644
>>> --- a/Documentation/ABI/testing/sysfs-firmware-ofw
>>> +++ b/Documentation/ABI/testing/sysfs-firmware-ofw
>>> @@ -1,6 +1,6 @@
>>>  What:		/sys/firmware/devicetree/*
>>>  Date:		November 2013
>>> -Contact:	Grant Likely <grant.likely@linaro.org>
>>> +Contact:	Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
>>
>> Grant's email is not valid either. I would just drop it unless he wants 
>> his secretlab.ca email.
>>
>> Rob
> 

No response from Grant, so I'll drop his email and add the mail list.

Also, for the newly added section I'll change the contact from being both
me and the mail list to just be the mail list.

-Frank
