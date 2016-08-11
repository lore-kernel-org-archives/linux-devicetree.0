From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Subject: Re: [Query] of_{update/remove/add}_property exported?
Date: Thu, 11 Aug 2016 11:52:58 -0500
Message-ID: <ed2e0333-9528-c462-41ea-31e0ec56fe26@ti.com>
References: <e3ec4289-94ee-2305-2ac3-3913d8ac2728@ti.com>
 <CAL_JsqKavbxUj68D=hL-Qsi9Q=RC+fg=Wr++=n4gQmmrjEnG8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKavbxUj68D=hL-Qsi9Q=RC+fg=Wr++=n4gQmmrjEnG8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/11/2016 11:37 AM, Rob Herring wrote:
> On Thu, Aug 11, 2016 at 11:20 AM, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org> wrote:
>> Hi Rob,
>>
>> Is there any specific reason as to why the of_update_property(),
>> of_remove_property() or of_add_property() are not exported? I have seen
>> one or two RFC patches submitted for some of these, but can't seem to
>> find a concrete reason.
> 
> Probably because there is no in tree user.

Thanks, I have a need for these in a module, so will go ahead and submit
a patch.

regards
Suman
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
