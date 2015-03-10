From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v4 3/4] arm64:thunder: Add initial dts for Cavium's
 Thunder SoC in 2 Node topology.
Date: Tue, 10 Mar 2015 14:12:14 +0530
Message-ID: <CAFpQJXVc5c=YRLw3uS5RiSR13veo_SUiM-aV6hf+diQuWxdfYQ@mail.gmail.com>
References: <1421924755-26029-1-git-send-email-gkulkarni@caviumnetworks.com>
	<1421924755-26029-4-git-send-email-gkulkarni@caviumnetworks.com>
	<2882934.brFyhkGPyE@wuerfel>
	<1885509.Z0Gm3e3FlX@wuerfel>
	<CAFpQJXUvux+b9hYx_ZY-1hor0HRFFgh=e4vCYyJiDHrDC9Y=tQ@mail.gmail.com>
	<CAFpQJXXkXatxRcfpA1DjuuiUf3vup3DV+dACyGxT=TDkrO8rNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFpQJXXkXatxRcfpA1DjuuiUf3vup3DV+dACyGxT=TDkrO8rNQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Roy Franz <roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, ddutile-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Ping?

On Tue, Feb 24, 2015 at 2:22 PM, Ganapatrao Kulkarni
<gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Arnd,
>
> On Fri, Jan 23, 2015 at 6:07 PM, Ganapatrao Kulkarni
> <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Arnd,
>>
>> On Thu, Jan 22, 2015 at 11:56 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>>> On Thursday 22 January 2015 17:47:13 Arnd Bergmann wrote:
>>>>
>>>> This seems wrong still: The clusters and cores do not have unique
>>>> numbers. I believe the code will not work correctly, and it won't
>>>> be compliant with the binding from patch 2.
>>>>
>>>> I think the right way here would be to use
>>>>
>>>>         arm,associativity = <0 2 47>;
>>>>
>>>> for cpu@20f, and
>>>>
>>>>         arm,associativity = <1 3 48>;
>>>>
>>>> for cpu@10000. Your previous version used the numbers from
>>>> the reg property, which should be fine as well if that helps:
>>>>
>>>>
>>>>         arm,associativity = <0x0 0x200 0x20f>;
>>>>
>>>>         arm,associativity = <0x10000 0x10000 0x10000>;
>>>>
>>>> which should have the same effect as above, as long as the code
>>>> can handle the numbers not being consecutive.
>>>>
>>>>
>>>
>>> Upon further consideration, I think your patch is correct after
>>> all, but let me check again on PowerPC machines.
>> i have removed, board id which was in previous patch, to keep the
>> associativity aligned to mpidr, ie. socket,cluster id and core id.
>> both previous and current mappings holds good for our design.
>> our topology is 2 sockets(aff2=0and 1) , each having 3
>> clusters(aff1=0to2)and each cluster having 16 cores(aff0:0to15)
>> in associativity property, for our case, only first id(socket id) is
>> mapped to numa, others are mentioned only to describe the topology.
>>>
>>>         Arnd
> any further comments, how we go about these patches?
> please suggest.
>
>> thanks
>> Ganapat
>
> thanks
> Ganapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
