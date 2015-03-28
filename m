From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND] iio: st-sensors: add support for lis3lv02d accelerometer
Date: Sat, 28 Mar 2015 12:18:41 +0000
Message-ID: <55169C21.1000509@kernel.org>
References: <1426672326-6292-1-git-send-email-linus.walleij@linaro.org>	<20150318153948.GQ3318@x1>	<550D5B65.10906@kernel.org> <CACRpkdYuWL_rs9nzg8ivRehG6-yFOheo+ZugZ-1iqmAyhwVaLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYuWL_rs9nzg8ivRehG6-yFOheo+ZugZ-1iqmAyhwVaLQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denis CIOCCA <denis.ciocca-qxv4g6HH51o@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23/03/15 09:21, Linus Walleij wrote:
> On Sat, Mar 21, 2015 at 12:52 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> 
>> We aren't going to move forward without doing something.
>> Hence applied to the togreg branch of iio.git.
> 
> Thanks!
> 
>>  Lets see
>> whether anyone cares enough to add the stuff the other driver supports
>> and this one doesn't.
> 
> The one really interesting feature I saw was the free-fall detection.
> I think it'd be nice if we had the ability to register for listening
> to such events from the IIO accelerometer subsystem, but I'm
> scared to even try to test it, god knows how many boards I'd
> break before I had this properly supported...
I used to have a couple of accelerometers on the end of really long cables
for this sort of thing ;)

Mind you we regularly put whole boards through accelerations well past
the limits of most of these devices.  Never broke one yet - though did
break a lot of battery cables..

You raise a good point though.  We really need a generic framework for handling
freefall events.  Various sources exist not all in IIO (and not all should be)
but a slim lined interface /dev/freefall was discussed to allow a really fast
response would probably make sense - afterall the point is usual to park mechanical
parts before the device hits the ground.

On second thoughts how many of the devices we care about actually have spinning disks
anymore?  Maybe we are 10 years too late on this one ;) 
> 
> Yours,
> Linus Walleij
> 
