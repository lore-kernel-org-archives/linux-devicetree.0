From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv5 07/16] atmel-isi: remove dependency of the soc-camera
 framework
Date: Mon, 13 Mar 2017 14:34:23 +0100
Message-ID: <1b77d36c-856c-0bee-a832-3d4e74c0e9dd@atmel.com>
References: <20170311112328.11802-1-hverkuil@xs4all.nl>
 <20170311112328.11802-8-hverkuil@xs4all.nl>
 <Pine.LNX.4.64.1703121334370.22698@axis700.grange>
 <4010987b-52a3-d3b9-0e3f-c5ea35455fa2@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4010987b-52a3-d3b9-0e3f-c5ea35455fa2-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Cc: Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, "Wu, Songjun" <Songjun.Wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 13/03/2017 à 12:43, Hans Verkuil a écrit :
> On 03/12/2017 05:44 PM, Guennadi Liakhovetski wrote:
>> Hi Hans,
>>
>> Thanks for the patch. Why hasn't this patch been CCed to Josh Wu? Is he 
>> still at Atmel? Adding to CC to check.
> 
> To the best of my knowledge Josh no longer works for Atmel/Microchip, and Songjun
> took over.

Yes absolutely, Josh Wu is no longer with us and Songjun and Ludovic
took over the maintenance.
But we have full confidence in experts like you guys and we thank you so
much Hans for having handled this move for atmel-isi.

>> A general comment: this patch doesn't only remove soc-camera dependencies, 
>> it also changes the code and the behaviour. I would prefer to break that 
>> down in multiple patches, or remove this driver completely and add a new 
>> one. I'll provide some comments, but of course I cannot make an extensive 
>> review of a 1200-line of change patch without knowing the hardware and the 
>> set ups well enough.
>>
>> On Sat, 11 Mar 2017, Hans Verkuil wrote:
>>
>>> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>>>
>>> This patch converts the atmel-isi driver from a soc-camera driver to a driver
>>> that is stand-alone.
>>>
>>> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  drivers/media/platform/soc_camera/Kconfig     |    3 +-
>>>  drivers/media/platform/soc_camera/atmel-isi.c | 1209 +++++++++++++++----------
>>>  2 files changed, 714 insertions(+), 498 deletions(-)

[..]

>>> +static struct isi_format isi_formats[] = {
>>
>> This isn't a const array, you're modifying it during initialisation. Are 
>> we sure there aren't going to be any SoCs with more than one ISI?
> 
> When that happens, this should be changed at that time. I think it is unlikely
> since as I understand it ISI has been replaced by ISC (atmel-isc).

Yes, ISC has replaced ISI for all Atmel/Microchip MPUs onwards. We may
have several of them, but very likely never more than one ISI.

Regards,
-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
