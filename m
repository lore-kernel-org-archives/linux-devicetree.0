From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 09/14] MIPS: Malta: Probe RTC via DT
Date: Tue, 20 Sep 2016 13:55:31 +0300
Message-ID: <fa83f27d-f7c0-60ee-a8f8-62f4af9af05a@cogentembedded.com>
References: <20160919212132.28893-1-paul.burton@imgtec.com>
 <20160919212132.28893-10-paul.burton@imgtec.com>
 <55c977d1-21dd-4cf8-d0f9-10d96b452573@cogentembedded.com>
 <762c9f70-911c-0e48-ef8e-8f8b9e006592@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <762c9f70-911c-0e48-ef8e-8f8b9e006592-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 9/20/2016 1:34 PM, Paul Burton wrote:

>>> Add the DT node required to probe the RTC, and remove the platform code
>>> that was previously doing it.
>>>
>>> Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>>>
>>> ---
>>>
>>> Changes in v2:
>>> - Remove rtc DT node label
>>
>>    Haven't you also renamed the node?
>
> Hi Sergei,
>
> Yes, strictly speaking I could have been more verbose & elaborated in
> the changelog on every aspect of the simple change from "rtc:
> mc146818@70" to "rtc@70". I didn't, but as it's obviously clear to you
> what changed and it has no effect on either the code or the commit that
> would end up in git I don't really see the point of your bringing it up.

    It may be obvious to me (since it was my comment that you addressed here) 
but not to others... Perhaps I'm too captious indeed, sorry about that. :-)

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
