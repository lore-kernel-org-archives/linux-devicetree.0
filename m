From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/8] mfd: Add support for DA9150 combined charger & fuel-gauge
 device
Date: Sat, 21 Jun 2014 12:38:37 +0100
Message-ID: <53A56EBD.5040407@kernel.org>
References: <cover.1402484954.git.Adam.Thomson.Opensource@diasemi.com> <bf472aa7fddd1e67a3d5b9024b5b621744146a27.1402484954.git.Adam.Thomson.Opensource@diasemi.com> <539DF8C6.8030009@kernel.org> <2E89032DDAA8B9408CB92943514A0337AB4FD95E@SW-EX-MBX01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2E89032DDAA8B9408CB92943514A0337AB4FD95E-68WUHU125fLLPO1uwJ3ImwLouzNaz+3S@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Opensource [Adam Thomson]" <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Support Opensource <Support.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 16/06/14 14:12, Opensource [Adam Thomson] wrote:
> On Sun, Jun 15, 2014 at 20:49, Jonathan Cameron wrote:
>
>> Hi Adam,
>>
>> Some general comments inline.
>>
>> It's been a while since I've looked at any particularly similar parts,
>> but it seems to me that a lot of indirection gets added here that
>> if anything makes the codes slightly harder to follow...
>>
>> Feel free to disagree with me though!
>
> Will do :)
>
>> To my mind all these wrappers add nothing significant so you might as well
>> just call da9150->read_dev etc directly.
>>
>> Also, what are the read_qif and write_qif for?  They don't seem to be used
>> anywhere.
>
> read_qif and write_qif are for the Fuel-Gauge functionality of the chip. The
> associated driver will be submitted after acceptance of initial driver code,
> and will make use of these functions.
Ideally drop these for now and bring them in as a precursor patch in the series
that introduces them being used.
>
> The wrappers automatically choose the correct client to use (QIF uses a
> different slave address to the main chip one). Means the child drivers only need
> to pass through the da9150 struct and the rest is dealt with underneath.
>
>> The only real reason I can see for these wrappers is because you want
>> to hide the struct da9150 contents from the children of the mfd. As you
>> aren't doing that, you might as well drop these in favour of direct
>> calls to regmap_read and friends.
>
> As I have a need to pass through the main da9150 struct point for the
> aforementioned wrappers, it seemed cleaner and more consistent to have wrappers
> for these as well, which did the job of regmap access. Means all HW access
> uses the same kind of approach, and all sub-devices just need a point to the
> main da9150 struct to be able to use the functions.
>
>> I'll continue my tirade against obvious comments. Wrong format and
>> adds nothing to what is here as init and exit functions are clearly
>> doing what their name suggests (it's one of my pet hates ;)
>
> I agree the comment doesn't add much in terms of description but for me it
> breaks up the code to make it easier to follow.
They really don't make it significantly easier to follow and after a few
cycles of the driver being patched with new stuff etc, they tend to become
actively misleading.
>However if I get an overwhelming
> hatred for this I can change it. Also, I know the rule regarding single/multiple
> line comments but here again I feel it helps separate the code and makes it
> easier to read.
I'll leave it up to the other maintainers to say they don't mind.  But for IIO
please keep strictly to the style (including all the unwritten bits ;)

>
>> As a general good practice point, I'd rather that the driver supported
>> more than one instance of the chip.. Hence you'd take a copy of da9150_devs
>> to use here.  I guess it is relatively unlikely with one of these, but
>> you never know ;)
>
> Have followed the general methods for MFD here, and a number of drivers take the
> same approach. Also, I think it would be undesirable to have multiple charger
> chips of the same type in one platform. I agree generally it's best to support
> multiple instances, but here I don't think we should.
You are a brave man to tell your customers what to do.  If some crazy person
does use multiple of these chips on a device you get to deal with the inevitable
question of why doesn't it work ;)
>
>> Why does this need it's own file?  Does the DA9150 support any other
>> interfaces?
>
> Yes, the DA9150 also has a SPI interface. At present the plan is to just add I2C
> support for now, but in the future we may add SPI support, so have written the
> code with this in mind.
Ah, I didn't find that from the details I could find via google.  In that
case fair enough.
>
>> Why the indirection?  The da9150 only supports i2c as far as I can see.
>
> As per my last comment.
>
>> I'd roll this into one line and not bother with the local variable...
>
> Fair enough but I think this keeps the code cleaner, and to me it makes sense
> for the actual logic to be in core file as that's interface agnostic.
>
>> Drop comments on things that are self-evident.  Also these are one
>> line comments so should be using the single line comment syntax.
>
> As per my previous comment I think it just helps to break up the code and makes
> it more readable. Will change it though if the general consensus is to remove
> it.
