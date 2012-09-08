From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH v6] pstore/ram: Add ramoops support for the Flattened
 Device Tree.
Date: Sat, 08 Sep 2012 10:27:15 +0200
Message-ID: <504B0163.5070804@gmail.com>
References: <1347042576-17675-1-git-send-email-bfreed@chromium.org> <20120908052907.GA4724@lizard> <504AF27C.9090601@gmail.com> <20120908080607.GA22071@lizard>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120908080607.GA22071@lizard>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <cbouatmailru@gmail.com>
Cc: Bryan Freed <bfreed@chromium.org>, John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org, keescook@chromium.org, sboyd@codeaurora.org, gregkh@linuxfoundation.org, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Il 08/09/2012 10:06, Anton Vorontsov ha scritto:
> On Sat, Sep 08, 2012 at 09:23:40AM +0200, Marco Stornelli wrote: [...]
>>>> +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>>>> +   if (pdata == NULL)
>>>
>>> I wonder why people prefer to not write !pdata, which is more natural
>>> when reading the code.. :-)
>>
>> I think it's the same for sizeof, it's much more readable
>> sizeof(struct ramoops_platform_data).
>
> Well, sizeof(struct...) is against Linux coding style.  And there are
> good reasons for this rule, it's all in the CodingStyle file. Thus,
> it's not about personal preferences. But speaking of personal
> preferences, I don't find sizeof(struct...) more readable. :-)
>
> Thanks!
> Anton.
>

Yes, I know, but indeed it's only a personal preference as the check 
==NULL instead of !pdata. :)

Marco
