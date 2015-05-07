From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: device tree compiler with overlay support?
Date: Thu, 7 May 2015 10:28:37 +0200
Message-ID: <CAOMqctQUhV6=YyyZNT7Kzmd5pYYaYNxA2F+c9RCH98fUabzMUg@mail.gmail.com>
References: <CAOMqctSZObmoJQocCg3JvCA=ZDvvrxzKC9Ko=aq0J=LphNW+EA@mail.gmail.com>
 <CAOMqctT3WuqMTqaqUTN44zA2TEYmP9X7SN8ufTouQFoy=GjB1Q@mail.gmail.com>
 <CAMuHMdU=WySZ8kfaVmU6Bed=ofvrDQ9s51m7zyXN0qu-G-d4cg@mail.gmail.com>
 <E8C27FD0-CF22-4D8F-AC05-55518BEF4B84@konsulko.com> <CAOMqctRPiPFtNAMBa5eZx=erL4xtohMxXAeFeMG-7KZaRxDnew@mail.gmail.com>
 <67E0CBA3-C499-4A98-9F23-E228E334546D@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <67E0CBA3-C499-4A98-9F23-E228E334546D-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 7 May 2015 at 10:09, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hi Michal,
>
>> On May 7, 2015, at 11:07 , Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>>
>> Hello,
>>
>> On 7 May 2015 at 09:28, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> Hi Geert,
>>>
>>>> On May 7, 2015, at 10:17 , Geert Uytterhoeven <geert-Td1EMuHUCqygBwfqmJ+zsg@public.gmane.org=
g> wrote:
>>>>
>>>> On Tue, May 5, 2015 at 6:51 PM, Michal Suchanek <hramrach-Re5JQEeQqe8@public.gmane.org=
m> wrote:
>>>>> On 5 May 2015 at 17:18, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>>>>>> where is a device tree compiler that can compile an overlay?
>>>>>>
>>>>>> The compiler at git://git.kernel.org/pub/scm/utils/dtc/dtc.git s=
hrieks
>>>>>> there is a syntax error as soon as the /plugin/ tag is present.
>>>>>
>>>>> ok, so I found a dtc patch here https://lkml.org/lkml/2013/1/4/29=
5
>>>>>
>>>>> This does not apply cleanly to current DTC but the parts that fai=
l are
>>>>> due to cosmetic changes in the code so I went ahead and applied i=
t.
>>>>
>>>> Thanks for the link! That patch indeed requires some manual rework=
=2E
>>>>
>>>>> However, the created blob is not what the kernel can accept into
>>>>> of_overlay_create so what do I do with the blob to load it?
>>>>
>>>> Use "OF: DT-Overlay configfs interface" from Pantelis?
>>>>
>>>> That depends on "configfs: Implement binary attributes", also from=
 Pantelis,
>>>> which requires reverting commit 28444a2bde8d1695i ("configfs_add_f=
ile:
>>>> fold into its sole caller").
>>>>
>>>> All of the above require manual fixups to apply.
>>>>
>>>> Still have to try the actual loading, new to the overlay game on m=
ainline
>>>> kernels (I did use it on boneblack with its original kernel and it=
s overlay
>>>> manager).
>>>>
>>>
>>> Posted the patches recently, but for your convenience here=E2=80=99=
s the git tree.
>>>
>>> https://github.com/pantoniou/dtc/tree/dt-overlays5
>>>
>>> FWIW, I=E2=80=99ll post the capemgr patch today too.
>>>
>>
>> I did not find those so tried loading the overlay by hand. FWIW like
>> the half dozen patches of this https://github.com/hramrach/linux-sun=
xi
>> are the overlay loading atm.
>>
>> I can cat the overlay blob to sysfs and it creates a device so I gue=
ss
>> it basically works.
>>
>> What I need to investigate is exporting some useful information abou=
t
>> the overlays in sysfs.
>>
>
> If you were to share some details of what you=E2=80=99re trying to ac=
hieve I might be able to help.
>
> I have no clue what you guys are trying to do :)
>

I am trying to load overlays at runtime to see if that's usable for som=
ething.

=46or example, with the above tree I can load simple overlay like this
(the compatible and part number is not used for anything atm):

/dts-v1/;
/plugin/;

/ {
    compatible =3D "olimex,a10s-olinuxino-micro";

    /* identification */
    part-number =3D "A10S-SPI2";

    fragment@0 {
        target =3D <&spi2>;
        __overlay__ {
            #address-cells =3D <1>;
            #size-cells =3D <0>;
            flash: m25p80@0 {
                #address-cells =3D <1>;
                #size-cells =3D <1>;
                compatible =3D "nor-jedec";
                reg =3D <0>;
                spi-max-frequency =3D <40000000>;
                m25p,fast-read;
                   };
        };
    };
};

and it probes the flash and does not find any because I have none
attached. I can also destroy and reload the overlay so that works
nice. Loading the overlay twice without destroying it in between
causes kernel oops.

So presumably if I wired my display backlight to PWM I could write an
overlay for the PWM backlight and patch it in at runtime and possibly
test different settings by destroying the overlay and reloading an
updated one.

This is already good enough for testing even complex devices without
reboot provided the driver for them is compiled into the kernel.

With your node kprintf providing enough information about the overlays
so they can be identified should not be that difficult.

Thanks

Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
