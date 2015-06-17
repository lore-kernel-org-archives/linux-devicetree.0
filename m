From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 6/6] ARM: sun8i: dts: Add Ippo-q8h v1.2
 with A33 and 1024x600 lcd support
Date: Wed, 17 Jun 2015 09:19:48 +0200
Message-ID: <55811F94.3080608@redhat.com>
References: <1432997706-20172-1-git-send-email-hdegoede@redhat.com> <1432997706-20172-7-git-send-email-hdegoede@redhat.com> <20150602081459.GO23777@lukather> <556D6955.8030708@redhat.com> <20150603094535.GI23777@lukather> <556EE104.3090803@redhat.com> <20150613135002.GP19653@lukather> <85E62D2D-5387-433B-A944-7F2145459F08@konsulko.com> <20150616175512.GJ11732@lukather> <D4216F2D-0556-4849-B1DF-8E4D250006B4@konsulko.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDRZXY4CYYORBF57QSWAKGQEDT4RLOY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <D4216F2D-0556-4849-B1DF-8E4D250006B4-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 16-06-15 21:33, Pantelis Antoniou wrote:
> Hi Maxime,
>
>> On Jun 16, 2015, at 20:55 , Maxime Ripard <maxime.ripard@free-electrons.=
com> wrote:
>>
>> Hi Pantelis,
>>
>> On Sun, Jun 14, 2015 at 09:16:21PM +0300, Pantelis Antoniou wrote:
>>>> I think we need to discuss this with Pantelis and what is his feeling
>>>> about this.
>>>>
>>>> Pantelis, to sum things up, we have a case of a tablet that comes with
>>>> the exact same board, but coming in two flavours with two differents
>>>> screen resolutions. It looks like a great case for your DT quirks
>>>> work, but we have no way of runtime detecting the difference between
>>>> the two variants. What do you think about this? Should we go with
>>>> using the DT quirks or is this simply out of scope?
>>>>
>>>> There's not so much example of similar cases in the kernel, and none
>>>> of them use quirks so far (obviously) but they all boil down to either
>>>> the solution you were suggesting in that patch or adding the alternate
>>>> configuration as a comment.
>>>>
>>>> I don't think the latter would work for you, and I agree with that, so
>>>> I guess that depending on what Pantelis says, either we go with a
>>>> better solution using the quirks, or we end up using what you
>>>> suggested (with a nitpick though, I'd prefer if you used the display
>>>> standard instead of the resolution, which would make it xga I guess?)
>>>>
>>>
>>> First of all, the quirks interface is at an RFC stage (new name
>>> suggested is =E2=80=98variants=E2=80=99); getting that out of the way t=
his seems
>>> like what it is designed to do.
>>>
>>> The idea of the DT quirks is to drastically cut down on the number
>>> of different DTs required, each different for each board with minute
>>> differences from one another.
>>
>> We're on the same page then :)
>>
>
> Heh :)
>
>>> In your case you have boards that have no way to be probed about
>>> what they =E2=80=98are=E2=80=99, but that=E2=80=99s no big problem. You=
 can easily pass the
>>> board variant in the kernel command line and use that to select the
>>> quirk to apply.
>>
>> Hans actually pointed out that this would just move the logic
>> somewhere else, but not remove it. In our case, that would mean U-Boot
>> (Hans being the U-Boot maintainer for the SoCs that are used in this
>> particular board).
>>
>> That would still require us to have a different configuration and to
>> add some logic to pass that extra parameter to the kernel. I'd be glad
>> to have less stuff in the kernel, but I can understand that he doesn't
>> want more stuff either.
>>
>
> Well, I don=E2=80=99t know the specifics of your board, but if you have a=
 configuration
> subset that works for all the boards and makes it at least possible to lo=
ad
> a kernel (i.e. ram, serial, storage) you can keep a single bootloader tha=
t=E2=80=99s not
> full featured, but at least can boot any kind of variant.
>
> Afterwards you can just update the bootargs variable to the correct one f=
or
> a given board.

We're talking about tablets here and uboot supports the lcd, as that is the=
 only
way to show errors loading the kernel / show a boot menu, etc.

Show u-boot will know which lcd is present (by the user having flashed
the right u-boot binary for his model or so we hope). So I really think
that this is something which u-boot should pass along in our case.

Talking about how this will all work in the future would it be possible
for u-boot to pass this info via devicetree rather then the kernel commandl=
ine?

In general we try not to mangle the cmdline in u-boot, while otoh we alread=
y
patch plenty of stuff into the dtb like memory size and such :)

Regards,

Hans

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
