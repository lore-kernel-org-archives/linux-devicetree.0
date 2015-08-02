From: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] iio: proximity: add support for PulsedLight LIDAR
Date: Sun, 02 Aug 2015 10:36:15 +0300
Message-ID: <55BDC86F.8050609@cogentembedded.com>
References: <1438401484-22101-1-git-send-email-mranostay@gmail.com>	<1438401484-22101-3-git-send-email-mranostay@gmail.com>	<55BC85AF.1030608@cogentembedded.com>	<791628AC-C26A-4D88-8A5B-54B2E4EED75B@jic23.retrosnub.co.uk> <CAKzfze9D6NYgJoT-271GUj1ei-PwUfHwJ38w8uMcgPoQz6yyUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKzfze9D6NYgJoT-271GUj1ei-PwUfHwJ38w8uMcgPoQz6yyUQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex-ynQEQJNshbs@public.gmane.org>, Matt Porter <matt-agtwNxEcTQJWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02.08.2015 01:22, Matt Ranostay wrote:
> On Sat, Aug 1, 2015 at 2:17 PM, Jonathan Cameron
> <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org> wrote:
>>
>>
>> On 1 August 2015 09:39:11 BST, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
>>> Hi Matt,
>>>
>>> Find minor comments.
>>>
>>> On 01.08.2015 06:58, Matt Ranostay wrote:
>>>> Add support for the PulsedLight LIDAR rangefinder sensor which allows
>>>> high speed (over 300Hz) distance measurements using Barker Coding
>>> within
>>>> 40 meter range.
>>>>
>>>> Support only tested on the "blue label" rev 2, but may work using
>>> polling
>>>> at low sample frequencies on the original version.
>>>>
>>>> Signed-off-by: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>>    drivers/iio/proximity/Kconfig  |  13 ++
>>>>    drivers/iio/proximity/Makefile |   1 +
>>>>    drivers/iio/proximity/lidar.c  | 309
>>> +++++++++++++++++++++++++++++++++++++++++
>>> Add ABI documentation
>>> Documentation/ABI/testing/sysfs-bus-iio-proximity-lidar
>> Why?  Reading on phone so may have missed something but all ABI is standard.
>> Covered by top level docs.
> Only thing that would be documented that IIO_DISTANCE is in meters.
> But seems standard.
I understand.
I was thinking that reading in_distance_raw units needs to be docimented 
(looking on the sample sysfs-bus-iio-proximity-as3935)

Regards,
Vladimir
