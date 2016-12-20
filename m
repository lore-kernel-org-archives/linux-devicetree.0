Return-Path: <SRS0=qtih=YD=google.com=jaghu@kernel.org>
MIME-Version: 1.0
In-Reply-To: <d054a18a-10d1-7aa5-31d5-44af1e5a6c76@gmail.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <20161214125641.GA5379@kroah.com> <ac324946-41da-c090-a0ca-78155611bb7e@baylibre.com>
 <2512681.Wh85HyB8FH@wuerfel> <d054a18a-10d1-7aa5-31d5-44af1e5a6c76@gmail.com>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Mon, 19 Dec 2016 20:06:54 -0800
Message-ID: <CANsWYUVuH0z04r301vWR6pOnA94cct5GnMboP9YgkwPgPUGPGg@mail.gmail.com>
Subject: Re: [PATCH linux v1 0/4] Seven segment display support
Content-Type: multipart/alternative; boundary=047d7bb040c6e81a4a05440f2b1f
To: David Daney <ddaney.cavm@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--047d7bb040c6e81a4a05440f2b1f
Content-Type: text/plain; charset=UTF-8

Hi,
Thanks all for the feedback; Further reimplementation of this driver will
be handled by
another member of my team. Please contact Nancy Yuen(yuenn@google.com) for
any details.
Summary of main points mentioned in the feedback were :
  - Address Russell's errno comments
  - Rebase per Joel's comment
  - Research fingerprint reader support (mentioned by Greg KH)
  - Research drivers/leds (mentioned by Arnd)
  - Reimplement either by making an API that all devices of this type could
use or in drivers/leds             model or the fingerprint reader model.



On Wed, Dec 14, 2016 at 12:05 PM, David Daney <ddaney.cavm@gmail.com> wrote:

> On 12/14/2016 06:15 AM, Arnd Bergmann wrote:
>
>> On Wednesday, December 14, 2016 2:12:41 PM CET Neil Armstrong wrote:
>>
>>> On 12/14/2016 01:56 PM, Greg KH wrote:
>>>
>>>> On Wed, Dec 14, 2016 at 01:45:30PM +0100, Thomas Petazzoni wrote:
>>>>
>>>>> Hello,
>>>>>
>>>>> On Tue, 13 Dec 2016 23:55:00 -0800, Jaghathiswari Rankappagounder
>>>>> Natarajan wrote:
>>>>>
>>>>> Documentation for the binding which provides an interface for adding
>>>>>> clock,
>>>>>> data and clear signal GPIO lines to control seven segment display.
>>>>>>
>>>>>> The platform device driver provides an API for displaying on two
>>>>>> 7-segment
>>>>>> displays, and implements the required bit-banging. The hardware
>>>>>> assumed is
>>>>>> 74HC164 wired to two 7-segment displays.
>>>>>>
>>>>>> The character device driver implements the user-space API for letting
>>>>>> a user
>>>>>> write to two 7-segment displays including any conversion methods
>>>>>> necessary
>>>>>> to map the user input to two 7-segment displays.
>>>>>>
>>>>>> Adding clock, data and clear signal GPIO lines in the devicetree to
>>>>>> control
>>>>>> seven segment display on zaius platform.
>>>>>>
>>>>>> The platform driver matches on the device tree node; the platform
>>>>>> driver also
>>>>>> initializes the character device.
>>>>>>
>>>>>> Tested that the seven segment display works properly by writing to the
>>>>>> character device file on a EVB AST2500 board which also has 74HC164
>>>>>> wired
>>>>>> to two 7-segment displays.
>>>>>>
>>>>>
>>>>> FWIW, I proposed a driver for seven segment displays back in 2013:
>>>>>
>>>>>    http://lists.infradead.org/pipermail/linux-arm-kernel/2013-
>>>>> January/139986.html
>>>>>
>>>>> And the feedback from Greg KH was: we don't need a driver for that, do
>>>>> it from userspace. See:
>>>>>
>>>>>    http://lists.infradead.org/pipermail/linux-arm-kernel/2013-
>>>>> January/139992.html
>>>>>
>>>>> So: good luck
>>>>>
>>>>
>>>> Did anyone ever write a library for this type of thing?
>>>>
>>>> Again, I don't want to see one-off drivers for random devices like this
>>>> that should be able to all be controlled from userspace in a common
>>>> manner.  Much like we did for fingerprint readers a long long time
>>>> ago...
>>>>
>>>>
>> Actually, it's more than a random interface, a lot of SoCs and boards
>>> actually have such displays
>>> and it's a pity to use UIO, sysfs gpio bitbanging and all sort of ugly
>>> stuff to only print a few
>>> characters a simple and clean driver could achieve.
>>> Some very well known SoCs even have integrated registers to lower the
>>> BOM and bypass the need for
>>> a 74HC164 like component and avoid gpio bit banging.
>>>
>>> My personal concern is that you could also need to drive more segments,
>>> thus 7-segments
>>> is too restrictive.
>>>
>>> But this driver is well structured, the gpio-bitbanging sub-driver is
>>> welcome.
>>>
>>
>> Maybe we can find a way to fit this into the existing drivers/leds/
>> subsystem?
>>
>> That already supports blinking, brightness and colour attributes of LEDs,
>> so could this be extended to support (one of) digit, number, character
>> or string with a common sysfs attribute and a way to hook up a led driver
>> to that?
>>
>
> We have a lot of boards with an 8-cell dot matrix LED. Each cell is
> programmed with an 8-bit value.  The mapping of these values to the dots
> defaults to ASCII character rendering, but there is the facility to install
> other bitmaps as well.
>
> Really I view these things not as part of the LED subsystem, but more as a
> very small frame buffer.
>
> We like to display entire words, and the most useful interface from a user
> point of view is something that consumes entire strings rather than having
> to manage each cell independently.
>
> You could imagine that if the text to be displayed were longer than the
> display, that the driver would make it continuously scroll.  I would like
> to see a framework where a simple character device were exposed, and from
> userspace you could do: "echo message > /dev/small-display" and get
> something sensible.
>
>
>>         Arnd
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
>>
>

--047d7bb040c6e81a4a05440f2b1f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>Thanks all for the feedback; Further reimplementat=
ion of this driver will be handled by</div><div>another member of my team. =
Please contact Nancy Yuen(<a href=3D"mailto:yuenn@google.com">yuenn@google.=
com</a>) for any details.</div><div>Summary of main points mentioned in the=
 feedback were :</div><div><span style=3D"font-size:12.8px">=C2=A0 - Addres=
s=C2=A0</span><span style=3D"font-size:12.8px">Russell&#39;s=C2=A0</span><s=
pan style=3D"font-size:12.8px">errno comments</span></div><div><span style=
=3D"font-size:12.8px">=C2=A0 - Rebase per Joel&#39;s comment</span></div><d=
iv><span style=3D"font-size:12.8px">=C2=A0 - Research fingerprint reader su=
pport (mentioned by Greg KH)</span><br style=3D"font-size:12.8px"><span sty=
le=3D"font-size:12.8px">=C2=A0 - Research drivers/leds (mentioned by Arnd)<=
/span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">=C2=
=A0 - Reimplement either by</span><span style=3D"font-size:12.8px">=C2=A0ma=
king an API that all devices of this type could use or in=C2=A0</span><span=
 style=3D"font-size:12.8px">drivers/leds =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 model or the fingerprint reader model.</span></div><div><br></div><=
div><span style=3D"font-size:12.8px"><br></span></div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Wed, Dec 14, 2016 at 12:05 PM=
, David Daney <span dir=3D"ltr">&lt;<a href=3D"mailto:ddaney.cavm@gmail.com=
" target=3D"_blank">ddaney.cavm@gmail.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 12/14/201=
6 06:15 AM, Arnd Bergmann wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wednesday, December 14, 2016 2:12:41 PM CET Neil Armstrong wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 12/14/2016 01:56 PM, Greg KH wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wed, Dec 14, 2016 at 01:45:30PM +0100, Thomas Petazzoni wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hello,<br>
<br>
On Tue, 13 Dec 2016 23:55:00 -0800, Jaghathiswari Rankappagounder<br>
Natarajan wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Documentation for the binding which provides an interface for adding clock,=
<br>
data and clear signal GPIO lines to control seven segment display.<br>
<br>
The platform device driver provides an API for displaying on two 7-segment<=
br>
displays, and implements the required bit-banging. The hardware assumed is<=
br>
74HC164 wired to two 7-segment displays.<br>
<br>
The character device driver implements the user-space API for letting a use=
r<br>
write to two 7-segment displays including any conversion methods necessary<=
br>
to map the user input to two 7-segment displays.<br>
<br>
Adding clock, data and clear signal GPIO lines in the devicetree to control=
<br>
seven segment display on zaius platform.<br>
<br>
The platform driver matches on the device tree node; the platform driver al=
so<br>
initializes the character device.<br>
<br>
Tested that the seven segment display works properly by writing to the<br>
character device file on a EVB AST2500 board which also has 74HC164 wired<b=
r>
to two 7-segment displays.<br>
</blockquote>
<br>
FWIW, I proposed a driver for seven segment displays back in 2013:<br>
<br>
=C2=A0 =C2=A0<a href=3D"http://lists.infradead.org/pipermail/linux-arm-kern=
el/2013-January/139986.html" rel=3D"noreferrer" target=3D"_blank">http://li=
sts.infradead.org/pi<wbr>permail/linux-arm-kernel/2013-<wbr>January/139986.=
html</a><br>
<br>
And the feedback from Greg KH was: we don&#39;t need a driver for that, do<=
br>
it from userspace. See:<br>
<br>
=C2=A0 =C2=A0<a href=3D"http://lists.infradead.org/pipermail/linux-arm-kern=
el/2013-January/139992.html" rel=3D"noreferrer" target=3D"_blank">http://li=
sts.infradead.org/pi<wbr>permail/linux-arm-kernel/2013-<wbr>January/139992.=
html</a><br>
<br>
So: good luck<br>
</blockquote>
<br>
Did anyone ever write a library for this type of thing?<br>
<br>
Again, I don&#39;t want to see one-off drivers for random devices like this=
<br>
that should be able to all be controlled from userspace in a common<br>
manner.=C2=A0 Much like we did for fingerprint readers a long long time<br>
ago...<br>
<br>
</blockquote></blockquote>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Actually, it&#39;s more than a random interface, a lot of SoCs and boards a=
ctually have such displays<br>
and it&#39;s a pity to use UIO, sysfs gpio bitbanging and all sort of ugly =
stuff to only print a few<br>
characters a simple and clean driver could achieve.<br>
Some very well known SoCs even have integrated registers to lower the BOM a=
nd bypass the need for<br>
a 74HC164 like component and avoid gpio bit banging.<br>
<br>
My personal concern is that you could also need to drive more segments, thu=
s 7-segments<br>
is too restrictive.<br>
<br>
But this driver is well structured, the gpio-bitbanging sub-driver is welco=
me.<br>
</blockquote>
<br>
Maybe we can find a way to fit this into the existing drivers/leds/ subsyst=
em?<br>
<br>
That already supports blinking, brightness and colour attributes of LEDs,<b=
r>
so could this be extended to support (one of) digit, number, character<br>
or string with a common sysfs attribute and a way to hook up a led driver<b=
r>
to that?<br>
</blockquote>
<br></div></div>
We have a lot of boards with an 8-cell dot matrix LED. Each cell is program=
med with an 8-bit value.=C2=A0 The mapping of these values to the dots defa=
ults to ASCII character rendering, but there is the facility to install oth=
er bitmaps as well.<br>
<br>
Really I view these things not as part of the LED subsystem, but more as a =
very small frame buffer.<br>
<br>
We like to display entire words, and the most useful interface from a user =
point of view is something that consumes entire strings rather than having =
to manage each cell independently.<br>
<br>
You could imagine that if the text to be displayed were longer than the dis=
play, that the driver would make it continuously scroll.=C2=A0 I would like=
 to see a framework where a simple character device were exposed, and from =
userspace you could do: &quot;echo message &gt; /dev/small-display&quot; an=
d get something sensible.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnd<br>
<br>
______________________________<wbr>_________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org" target=3D"_blank">l=
inux-arm-kernel@lists.infrade<wbr>ad.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" re=
l=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/mai<wbr>lman/=
listinfo/linux-arm-kernel</a><br>
<br>
</blockquote>
<br>
</blockquote></div><br></div>

--047d7bb040c6e81a4a05440f2b1f--
