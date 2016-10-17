From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] leds: leds-pca963x: workaround group blink scaling issue
Date: Mon, 17 Oct 2016 09:58:26 +0200
Message-ID: <5d9476b8-b552-f745-e06d-9894fa2e542a@samsung.com>
References: <CGME20161013131622eucas1p2e419c58b25f2c61da22d390f2adfacfd@eucas1p2.samsung.com>
 <1476364572-26849-1-git-send-email-matt@ranostay.consulting>
 <ac8bb319-8ad2-65fe-e8bb-6fd9af61f046@samsung.com>
 <CAKzfze_d5rQ-MaNL1BbGXrdHG+UDNa=us68eoH_AJ-EKLnzCvw@mail.gmail.com>
 <924a896d-b3f2-5fed-62ba-a731e79e1567@samsung.com>
 <20161014142047.imm4idfetphlp5od@atomide.com>
 <CAKzfze8s4E4x70bAoXd8_cctUeih4dwareM7=dpc7GsQq3agWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAKzfze8s4E4x70bAoXd8_cctUeih4dwareM7=dpc7GsQq3agWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Ranostay <matt-sk+viVC6FLCDq+mSdOJa79kegs52MxvZ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/15/2016 02:00 PM, Matt Ranostay wrote:
> On Fri, Oct 14, 2016 at 7:20 AM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
>> * Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> [161013 23:37]:
>>> On 10/13/2016 04:20 PM, Matt Ranostay wrote:
>>>> On Thu, Oct 13, 2016 at 4:05 PM, Jacek Anaszewski
>>>> <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>>> Why DT property? Is it somehow dependent on the board configuration?
>>>>> How this period-scale value is calculated? Is it inferred empirically?
>>>>>
>>>>
>>>> We empirically discovered and verified this with an logic analyzer on
>>>> multiple batches of this part.
>>>> Reason for the DT entry is we aren't 100% sure that it is always going
>>>> to be the same with different board revs.
>>>>
>>>> Could be that parts clock acts differently with supply voltage.   This
>>>> has been calculated by setting it an expected value, and measuring the
>>>> actual result with the logic analyzer.
>>>
>>> I'd like to have DT maintainer's ack for this.
>>>
>>> Cc Rob and Mark.
>>
>> How about do this based on the compatible property instead? If there
>> are multiple manufacturers for this part and only a certain
>> parts have this issue we should have multiple compatible properties.
>>
>
> I could only find that NXP as the manufacturer of that part. It is
> possible since the clock is internal to the chipset that the vdd of
> 2.5V is doing something undefined.
>
>> Then if it turns out all of them need this scaling there's no need
>> to update the binding.
>
> Understandable.

Since at present we can't guarantee that all produced devices
are affected, then we should strive to avoid breaking any existing
users of the possible non-affected devices.

In view of that the addition of a new "compatible" proposed by Tony
seems most reasonable.

Still, DT maintainer's opinion is required.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
