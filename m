From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [U-Boot] serial atag tag in devicetree ?
Date: Thu, 26 Mar 2015 23:30:28 -0500
Message-ID: <CAL_Jsq+konO_WYEQ=nP1wvbzPoytdJQ9jnkqppCXGmsb6sTF8Q@mail.gmail.com>
References: <550EA6D8.3090702@redhat.com> <CAL_JsqK0VtDj_FmA8tQ5MRmGm-o2w7ia9U2_nD0aFDtTSfns2A@mail.gmail.com>
 <550FF971.407@redhat.com> <CAL_JsqLev+DeWCzvhF7bwYk3URxpgaQDR+6OmwWHjJ2nx=HijQ@mail.gmail.com>
 <551119F1.2060002@redhat.com> <1427322910.26627.15.camel@collins>
 <5513C926.1010708@redhat.com> <1427361114.2342.7.camel@collins>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427361114.2342.7.camel@collins>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 26, 2015 at 4:11 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> w=
rote:
> Le jeudi 26 mars 2015 =C3=A0 09:53 +0100, Hans de Goede a =C3=A9crit =
:
>> Hi,
>>
>> On 25-03-15 23:35, Paul Kocialkowski wrote:
>> > Le mardi 24 mars 2015 =C3=A0 09:01 +0100, Hans de Goede a =C3=A9cr=
it :
>> >> Hi,
>> >>
>> >> On 24-03-15 00:12, Rob Herring wrote:
>> >>> On Mon, Mar 23, 2015 at 6:30 AM, Hans de Goede <hdegoede@redhat.=
com> wrote:
>> >>>> Hi,
>> >>>>
>> >>>>
>> >>>> On 22-03-15 22:01, Rob Herring wrote:
>> >>
>> >> <snip>
>> >>
>> >>>>> There is already "serial-number" (a string) which exists for
>> >>>>> OpenFirmware. Also, "copyright" corresponds to vendor/manufact=
urer
>> >>>>> string. Both of these are supported by lshw already.
>> >>>>
>> >>>>
>> >>>> Ok, so if I understand you correctly then you're saying that we
>> >>>> should set a "serial-number" string property at the dt root lev=
el
>> >>>> and that this may contain pretty much anything, e.g. in the
>> >>>> sunxi case the full 128 bit SID in hex.
>> >>>
>> >>> Right.
>> >>>
>> >>>> Is the use of the "serial-number" string property already docum=
ented
>> >>>> somewhere? If not I'll submit a kernel patch to document it.
>> >>>
>> >>> Not that I'm aware of. It is something that predates our documen=
tation
>> >>> requirements. It could be in OpenFirmware specs. Documenting it =
in the
>> >>> DT bindings does not hurt.
>> >>
>> >> Ok.
>> >>
>> >>>> And for older kernels we should not set any serial atag (u-boot
>> >>>> always sets it, so this leaves it at 0) and old kernel users ar=
e
>> >>>> out of luck wrt getting to the serial ?
>> >>>
>> >>> If there is sufficient reason to support this on old kernels you=
 could.
>> >>
>> >> One problem with supporting this for older kernels is that if a n=
on 0
>> >> serial gets shown in /proc/cpuinfo with older atag booted kernels=
, we
>> >> should really show the same number in /proc/cpuinfo which means a=
dding
>> >> code to the kernel to get the devicetree "serial-number" string p=
roperty
>> >> and somehow put that into the 64 bits which we have in /proc/cpui=
nfo,
>> >> but given that the "serial-number" string could be hex or decimal=
 or
>> >> what ever and > 64 bits that will likely require a platform speci=
fic
>> >> solution. All doable, but the question then becomes is this worth=
 the
>> >> effort ?
>> >
>> > After investigating a bit more, I found out that the USB serial nu=
mber
>> > is expected to be a string of 32 bytes, so a 128 bit numeric seria=
l
>> > doesn't fit (it takes 32 bytes for the hex representation of 128 b=
its,
>> > so there is no room left for the terminating null byte), hence it =
makes
>> > sense to keep a 64 bit limitation for the serial number, if users =
are
>> > going to rely on it as USB serial string. Moreover, it seems that
>> > Android devices are mostly used 64 bit numbers for serial numbers/
>> >
>> > I was initially going to suggest that we set it in stone that seri=
al
>> > must be 64 numeric bits (as it was in the ATAGs days) and that
>> > bootloaders would pass it that way to the kernel through device tr=
ee
>> > (with two 32 bits numeric integers), but Hans talked me out of it.
>> > I just want to expose the situation (especially the USB and Androi=
d
>> > thing) here to double-check that everyone still is convinced that =
a
>> > string approach in device tree is best (which is fine with me).
>>
>> There are already existing users of the serial-number property in de=
vicetree,
>> and these already use a free-format string, so AFAICT we have no cho=
ice
>> but to do the same as the existing users.
>>
>> But Rob is the expert here, so lets see what Rob has to say.
>>
>> > This way, users that still want to use the serial passed through d=
evice
>> > tree as a USB serial number will have to use a string of 32 bits,
>> > including the null terminating byte (which is what I'll suggest fo=
r
>> > sunxi by using only 64 bits for the serial number).
>> >
>> > Also, I suggest that we show that serial-number string as-is in cp=
uinfo
>> > as well
>>
>> We cannot do that because we must guarantee that the serial shown
>> in cpu info is a 64 bits / 16 hex values (0 padded) number, anything
>> else would break the kernel <-> userspace API and potentially break
>> userspace apps. So we must do the devicetree -> serialnumber low/hig=
h
>> -> /proc/cpinfo version to guarantee that this format does not chang=
e.
>>
>> And as discussed before if you want a non 0 serial in cpuinfo then
>> the devicetree -> serialnumber low/high should be done in sunxi
>> specific kernel code, as on sunxi we will know that the string in
>> devicetree will be a hex value, but we've no such guarantee for
>> other platforms, so we cannot simply have a generic function to
>> populate erialnumber low/high from the devicetree serial-number
>> string.
>>
>>  > and instead make a string out of the serial ATAG in the kernel
>> > prior to showing it in cpuinfo (as opposed to translating the stri=
ng
>> > coming from device tree to a numeric value that cpuinfo will end u=
p
>> > showing as a string at the end of the day). Thus, the serial numbe=
r
>> > coming from device tree will still be shown in cpuinfo as well and=
 no
>> > ABI gets broken.
>>
>> You're forgetting the userspace <-> kernel ABI here, the serial line
>> in /proc/cpuinfo is not a free form string it is a 64 bit int shown
>> as 0 padded hex, and we cannot change that as changing that would be
>> an ABI break.
>
> IMHO this really is all about interpretation. If you consider that th=
e
> serial is already a *string* and not a hex-representation of a number
> (which it is when using ATAGs, but has no reason to be in general), t=
hen
> my suggestion will introduce no ABI break.
>
> Generally speaking, I found no documentation that indicates that the
> serial has to be in that format. It just happens to be the case when
> using ATAGs.
>
> Also, I found an email from Rob suggesting he would be fine with wiri=
ng
> the dts serial-number string to cpuinfo:
> http://lkml.iu.edu/hypermail/linux/kernel/1412.0/02975.html
>
> I think it's the most flexible solution and we can think of it as an
> extension of the current scheme: the serial string will no longer be
> limited to a hex representation of a number but can become any string=
=2E
>
> Now I would appreciate it if Rob could weigh-in and state whether he
> changed his mind on this or not.

The only ABI is on platforms that used ATAGS as any DT only platform
has so far had a serial# in cpuinfo of 16 0's. With a variable length
string we can still have a fixed 16 char hex serial number that is
compatible with ATAGS. I can't imagine that we have userspace that
cares about the length and yet doesn't care the value is always 0's
since converting to DT. As long as we keep 16 0's as the default I
don't see an issue with allowing other lengths.

It is only an ABI if someone notices and if we find an ABI issue later
we can always fix it.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
