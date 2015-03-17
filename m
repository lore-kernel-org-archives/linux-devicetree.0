From: Rob Herring <robh@kernel.org>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with
 'stdout-path'" breaks console on tty0
Date: Tue, 17 Mar 2015 08:30:41 -0500
Message-ID: <CAL_Jsq+dA3RDbakrkeMY07czs13bFFKCyETEXTzWxf+h1umBPQ@mail.gmail.com>
References: <55070544.9010908@redhat.com> <550717A0.3060603@hurleysoftware.com>
 <55071D0C.2050700@redhat.com> <55071F87.1050706@hurleysoftware.com>
 <5507227D.8020408@redhat.com> <55075AFD.7000001@hurleysoftware.com> <5507E3E3.5000001@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <5507E3E3.5000001@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Peter Hurley <peter@hurleysoftware.com>, Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 3:20 AM, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi,
>
>
> On 16-03-15 23:36, Peter Hurley wrote:
>>
>> On 03/16/2015 02:35 PM, Hans de Goede wrote:
>>>
>>> Hi,
>>>
>>> On 16-03-15 19:23, Peter Hurley wrote:
>>>>
>>>> On 03/16/2015 02:12 PM, Hans de Goede wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 16-03-15 18:49, Peter Hurley wrote:
>>>>>>
>>>>>> Hi Hans,
>>>>>>
>>>>>> On 03/16/2015 12:31 PM, Hans de Goede wrote:
>>>>>>>
>>>>>>> Hi All,
>>>>>>>
>>>>>>> While updating my local working tree to 4.0-rc4 this morning I
>>>>>>> noticed that I no longer
>>>>>>> get console / kernel messages output on the hdmi output of my ARM
>>>>>>> board / on tty0
>>>>>>>
>>>>>>> This is caused by:
>>>>>>>
>>>>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/of?id=2fa645cb2703d9b3786d850db815414dfeefa51d
>>>>>>>
>>>>>>> Reverting this commit fixes this for me.
>>>>>>>
>>>>>>> What is happening here is that the
>>>>>>> "add_preferred_console("stdout-path", 0, NULL);"
>>>>>>> happens before the tty0 registers stopping tty0 from becoming part of
>>>>>>> the console list
>>>>>>> since there already is a preferred console at that time.
>>>>>>>
>>>>>>> This is an undesirable behavior change caused by the commit in
>>>>>>> question, on boards
>>>>>>> where there is both video output, and a serial console configured
>>>>>>> through stdout-path
>>>>>>> we want to have console output on both as we do not know which of the
>>>>>>> 2 will actually
>>>>>>> be hooked up by the user.
>>>>>>
>>>>>>
>>>>>> I don't see this as a regression, but rather a misconfiguration.
>>>>>
>>>>>
>>>>> As said it is an undesirable behavior change, whether you want to call
>>>>> that a regression
>>>>> or not is not all that interesting. Fixing it however is important, as
>>>>> e.g. Fedora
>>>>> ARM images rely on this behavior, both "regular" arm as well as
>>>>> aarch64.
>>>>
>>>>
>>>> What dts file is causing this problem?
>>>> Is it in mainline or distributed only in Fedora?
>>>
>>>
>>> This is on allwinner (sunxi) devices such as Allwinner A10 or A20 based
>>> boards, currently
>>> the setting of stdout-path on these boards is done by (an unmodified)
>>> upstream u-boot.
>>
>>
>> You forgot to mention my patch is not very likely to break anything
>> in the wild since _you_ upstreamed the dependency only 3 weeks ago [1].
>
>
> I contacted Grant Likely a while ago about how to get the same behavior we
> have on aarch64 (console on both video output/tty0 and a serial tty by
> default)
> on devicetree based platforms and he pointed to stdout-path, and then I
> wrote
> the patch.
>
> I did this after talking to several Fedora ARM people about the problems
> we've with boards
> where we have both a video output and a serial console, such as on eg also
> Rasberry Pi-s,
> and the conclusion was that there is no single way for users to use these
> boards, so we
> must show boot messages on both, so that if things fail the user gets a
> chance to see
> how / why things fail. And passing a console= argument does not work here,
> we (the
> distro) need something which will just work everywhere, and we had that
> until your
> patch broke things.
>
>> And what "Fedora ARM images rely on this behavior"?
>
>
> All of them, Fedora ARM images are generic and use a multi-platform kernel,
> so any
> supported board which has a serial console connector + video output needs
> this to work.
>
> More specifically the Fedora nightly composes of F-22 which contain u-boot
> v2015.04-rc3 which contains the sunxi commit I gave *as an example*.
>
>> I don't appreciate the deception.
>
>
> There is no deception sunxi happens to be the ARM SOC I do a lot of work on,
> but it
> is hardly the only user of stdout-path while also having video-output /
> tty0.
>
> Note that my initial mail did not mention sunxi at all. You asked for an
> example, and
> now providing the example is deception ???
>
> I can understand that your unhappy to hear that your patch breaks things,
> but please
> stop blaming the messenger.
>
> I've been in your shoes were a kernel patch of mine caused a behavioral
> changed and
> people saw that as a regression. In my case it had to escalate to Linus, and
> Linus
> ordered the subsys maintainer to revert my patch, before I saw that I was
> wrong.
> I had to cool off a bit after that before I realized that Linus was actually
> right,
> the no regressions policy we have in the kernel is a very sensible one, and
> you
> cannot just go and change behavior people rely on, because that indeed is a
> REGRESSION.
>
> TBH I do not understand why we're even arguing here, AFAICT the behavior
> change
> is an unwanted side-effect of your patch, so the solution is to rewrite the
> patch
> so that we get the same end result (not turning off bootconsole-s too early)
> without
> the unwanted side-effect, and you agreed to work on that ?

I intend to revert this if we don't have a fix soon.

I think we just need a flag saying we've enabled the earlycon from
stdout-path or not and then add the preferred console based on that. I
assume with "earlycon" only on the command-line, getting console only
on stdout-path is okay.

Rob
