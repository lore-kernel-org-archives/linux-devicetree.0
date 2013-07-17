From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH RFC v4] media: OF: add "sync-on-green-active" property
Date: Wed, 17 Jul 2013 14:05:18 +0530
Message-ID: <CA+V-a8tq6CtsOOo1OsajoVp8eJYnWCqc+wysVoj2nMinoP=63g@mail.gmail.com>
References: <1373995163-9412-1-git-send-email-prabhakar.csengg@gmail.com> <51E5AF35.2080301@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51E5AF35.2080301@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: LMML <linux-media@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Sylwester,

Thanks for the review.

On Wed, Jul 17, 2013 at 2:08 AM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> Hi Prabhakar,
>
>
[snip]
>> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt
>> b/Documentation/devicetree/bindings/media/video-interfaces.txt
>> index e022d2d..5186c7e 100644
>> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
>> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
>> @@ -101,6 +101,9 @@ Optional endpoint properties
>>     array contains only one entry.
>>   - clock-noncontinuous: a boolean property to allow MIPI CSI-2
>> non-continuous
>>     clock mode.
>> +- sync-on-green-active: polarity field when video synchronization is
>> +  Sync-On-Green. When set the driver determines whether it's a normal
>> operation
>> +  or inverted operation.
>
>
> Would you mind adding this entry after pclk-sample property description ?

OK.

> And how about describing it a bit more precisely and similarly to
> VSYNC/HSYNC,
> e.g.
>
> - sync-on-green-active: active state of Sync-on-green (SoG) signal,
>   0/1 for LOW/HIGH respectively.
>
OK I'll paste the above one itself :-)

--
Regards,
Prabhakar Lad
