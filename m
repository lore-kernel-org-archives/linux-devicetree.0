From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: add vendor prefix for Honeywell
Date: Mon, 3 Feb 2014 08:46:58 -0600
Message-ID: <CAL_Jsq++pxMmJrn+=dreFJMCT2EUxbOuhrGetBecUTb2ax4YOw@mail.gmail.com>
References: <1390685924-11877-1-git-send-email-marek@goldelico.com>
	<CAOesGMhFEMNFbAC4rUdccYVHM8yX9Mz+Vx73jGxBYGrSOa4Gaw@mail.gmail.com>
	<CAAfyv37SenewbPw9BeLyS_djbxdZf+3aizbgOhhOPNdbmUJrUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAfyv37SenewbPw9BeLyS_djbxdZf+3aizbgOhhOPNdbmUJrUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 31, 2014 at 3:46 PM, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Jan 31, 2014 at 7:53 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>> On Sat, Jan 25, 2014 at 1:38 PM, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org> wrote:
>>> Signed-off-by: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> index 3f900cd..b14c617 100644
>>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> @@ -40,6 +40,7 @@ gmt   Global Mixed-mode Technology, Inc.
>>>  gumstix        Gumstix, Inc.
>>>  haoyu  Haoyu Microelectronic Co. Ltd.
>>>  hisilicon      Hisilicon Limited.
>>> +honeywell      Honeywell
>>
>> The norm has usually been to use the the stock ticker symbol of a
>> public company if it is available. In other words, I think the prefix
>> here should be 'hon', since Honeywell is a publicly traded company
>> under that ticker.
> OK I didn't know about that. I just pick name from here:
> Documentation/devicetree/bindings/iio/magnetometer/hmc5843.txt
> So we need to update also compatible property in mentioned file.

It appears this is already used in omap4-sdp dts for some time, so I'm
inclined to leave it as honeywell to avoid breaking old dtbs.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
