From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: device tree compiler with overlay support?
Date: Thu, 7 May 2015 12:24:59 +0200
Message-ID: <CAOMqctR5ZmgCQNqzoZv6hwAJ0h-r89fPabkK6hVCVeS2io7+Eg@mail.gmail.com>
References: <CAOMqctSZObmoJQocCg3JvCA=ZDvvrxzKC9Ko=aq0J=LphNW+EA@mail.gmail.com>
 <CAOMqctT3WuqMTqaqUTN44zA2TEYmP9X7SN8ufTouQFoy=GjB1Q@mail.gmail.com>
 <CAMuHMdU=WySZ8kfaVmU6Bed=ofvrDQ9s51m7zyXN0qu-G-d4cg@mail.gmail.com>
 <E8C27FD0-CF22-4D8F-AC05-55518BEF4B84@konsulko.com> <CAOMqctRPiPFtNAMBa5eZx=erL4xtohMxXAeFeMG-7KZaRxDnew@mail.gmail.com>
 <67E0CBA3-C499-4A98-9F23-E228E334546D@konsulko.com> <CAOMqctQUhV6=YyyZNT7Kzmd5pYYaYNxA2F+c9RCH98fUabzMUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMqctQUhV6=YyyZNT7Kzmd5pYYaYNxA2F+c9RCH98fUabzMUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On 7 May 2015 at 10:28, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 7 May 2015 at 10:09, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> Hi Michal,
>>
>>> On May 7, 2015, at 11:07 , Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
>>>
>>> Hello,
>>>
>>> On 7 May 2015 at 09:28, Pantelis Antoniou
>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>> Hi Geert,
>>>>

>>>> Posted the patches recently, but for your convenience here=E2=80=99=
s the git tree.
>>>>
>>>> https://github.com/pantoniou/dtc/tree/dt-overlays5
>>>>
>>>> FWIW, I=E2=80=99ll post the capemgr patch today too.
>>>>
>>>
>>> I did not find those so tried loading the overlay by hand. FWIW lik=
e
>>> the half dozen patches of this https://github.com/hramrach/linux-su=
nxi
>>> are the overlay loading atm.
>>>
>>> I can cat the overlay blob to sysfs and it creates a device so I gu=
ess
>>> it basically works.
>>>
>>> What I need to investigate is exporting some useful information abo=
ut
>>> the overlays in sysfs.
>>>
>>
>> If you were to share some details of what you=E2=80=99re trying to a=
chieve I might be able to help.
>>
>> I have no clue what you guys are trying to do :)
>>
>
> I am trying to load overlays at runtime to see if that's usable for s=
omething.

So I tried to cherry-pick some more of your patches and I have a few
observations.

I tried to use the new node formatter for debug prints and on loading
the spi nor overlay I get this:
[  181.805666]  -> unflatten_device_tree()
[  181.805686] Unflattening device tree:
[  181.805698] magic: d00dfeed
[  181.805705] size: 0000026b
[  181.805711] version: 00000011
[  181.805748]   size is 7f4, allocating...
[  181.805761]   unflattening d9ff5800...
[  181.805773] fixed up name for  ->
[  181.805850] fixed up name for fragment@0 -> fragment
[  181.805866] fixed up name for __overlay__ -> __overlay__
[  181.805884] fixed up name for m25p80@0 -> m25p80
[  181.805901] fixed up name for __symbols__ -> __symbols__
[  181.805915] fixed up name for __fixups__ -> __fixups__
[  181.805926] unflattened tree is detached
[  181.805932]  <- unflatten_device_tree()
[  181.806025] __of_adjust_tree_phandles: /|0||0| (): invalid phandle 0
[  181.806044] __of_adjust_tree_phandles:
/fragment@0|0|fragment|0|fragment (fragment): invalid phandle 0
[  181.806058] __of_adjust_tree_phandles:
/fragment@0/__overlay__|0|__overlay__|0|__overlay__ (__overlay__):
invalid phandle 0
[  181.806073] __of_adjust_tree_phandles: adjusting
/fragment@0/__overlay__/m25p80@0|1 (m25p80) +111
[  181.806093] __of_adjust_tree_phandles:
/__symbols__|0|__symbols__|0|__symbols__ (__symbols__): invalid
phandle 0
[  181.806109] __of_adjust_tree_phandles:
/__fixups__|0|__fixups__|0|__fixups__ (__fixups__): invalid phandle 0
[  181.806181] of_resolve_phandles: spi2 phandle is 0x00000045
[  181.806190] __of_adjust_phandle_ref: , spi2, 69
[  181.806960] of_fill_overlay_info: info for /fragment@0|0 (fragment)
[  181.806982]  overlay /fragment@0/__overlay__|0 (__overlay__)
[  181.807035]  target /soc@01c00000/spi@01c17000|69 (spi)
[  181.807046] of_fill_overlay_info: info for /__symbols__|0 (__symbols=
__)
[  181.807059] of_fill_overlay_info: info for /__fixups__|0 (__fixups__=
)
[  181.808569] spi spi2.0: setup mode 0, 8 bits/w, 40000000 Hz max --> =
0
[  181.811670] spi_master spi2: Using PIO mode for transfer
[  181.811994] spi_master spi2: Using PIO mode for transfer
[  181.823587] m25p80 spi2.0: unrecognized JEDEC id bytes: 00,  0,  0
[  181.828741] m25p80: probe of spi2.0 failed with error -2
[  181.832920] sun4i-spi 1c17000.spi: registered child spi2.0

I believe that I use the formatter correctly given that m25p80 node is
formatted ok. So it fails to format the fragment, fixups and overlay
nodes for some reason. Note that at a later time the fixups node
appears correctly formatted so this may be due to the formatter being
used during tree resolving.

When I cat /sys/firmware/devicetree/overlays/0/targets the kernel
detects a deadlock. /sys/firmware/devicetree/overlay-control/list
provides same information without deadlock but I am not sure I have
everything locked properly.

Thanks

Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
