From: =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: add Starry KR122EA0SRA panel binding
Date: Fri, 10 Jun 2016 15:08:50 -0700
Message-ID: <CADMs+9ag_PVeBXsTtFN7bxA50rXmFeVPCsaAQYR2gJxSzANSGQ@mail.gmail.com>
References: <1465578127-30330-1-git-send-email-dianders@chromium.org>
 <CAF6AEGuonEgNvJhfst+3aZPEOaeGwNnozcYwJq3_Z2S0-7ogSA@mail.gmail.com>
 <CAD=FV=XunjDGJYY1+-GPC+hN=kNxLiWbrtZD0_BO1ywerSLhfQ@mail.gmail.com> <CAF6AEGsZxZuSVUCqVH=8FUOTMiWBVT52xQ+Qcaqt3yF=pRmf3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAF6AEGsZxZuSVUCqVH=8FUOTMiWBVT52xQ+Qcaqt3yF=pRmf3w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 3:03 PM, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Jun 10, 2016 at 3:52 PM, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org=
> wrote:
>> Rob,
>>
>> On Fri, Jun 10, 2016 at 11:43 AM, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
>>> On Fri, Jun 10, 2016 at 1:02 PM, Douglas Anderson <dianders@chromiu=
m.org> wrote:
>>>> The Starry KR122EA0SRA is a 12.2", 1920x1200 TFT-LCD panel connect=
ed
>>>> using eDP interfaces.
>>>
>>> so drive-by comment... but shouldn't eDP be probe-able?  Not sure w=
hy
>>> we need panel drivers or DT bindings?
>>
>> I was wondering about that too.  As far as I can tell:
>>
>> 1. We need a panel driver because that appears to be what owns a
>> reference to the backlight / panel power regulator and that part is
>> not auto-probable.
>
> oh, hmm.. sad.. I was hoping that eDP would save us from dsi per-pane=
l
> driver hell.. I guess being able to use panel-simple is at least an
> improvement.  But panel specific sequences is sounds like panel-simpl=
e
> won't save us all the time :-(

Yes, although you can probably make things mostly work with improper
sequencing and enough retries, a lot of ARM hw either requires
interesting sequencing, or has broken/unreliable DDC, which translates
into the use of panel simple on the sw side.

>
>> 2. As far as I could tell, there is no way to declare a generic
>> (unspecified) panel in the device tree.  Everyone seems to include
>> "simple-panel" in their compatible string but as far as I can tell
>> nothing in the kernel looks at it.
>>
>> 3. In theory, all the info specified here should match the EDID
>> exactly and thus (as you said) be probable.  However, it sounds like
>> (for power sequencing reasons) there might be reasons why you'd want
>> to know exactly what panel was present beforehand.  You might need t=
o
>> power the panel and backlight in very specific sequences, for
>> instance.  I'm not sure it's always 100% possible in all embedded
>> designs to read the EDID before you know how the sequencing should
>> work (but, of course, I'm a NOOB).
>>
>> 4. Reading the EDID can be slow.  If you happen to know all the info
>> on the panel beforehand you can significantly speed up boot speed,
>> notably how fast you can get something on the screen.
>
> The theory is (although I think not true currently for most of the ar=
m
> drivers) that we should be reading back from hw the current config
> from bootloader splash screen, to avoid a modeset (and conveniently
> also the need to read edid) at boot.

On some devices the firmware doesn't set any video mode, so there
isn't anything we can read back. That is our case :)

St=C3=A9phane


>
> BR,
> -R
>
>>
>> Anyway, maybe someone else who actually knows what they're talking
>> about will chime in.  ;)
>>
>> -Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
