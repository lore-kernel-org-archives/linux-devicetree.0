From: delicious quinoa <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/7] Introducing (yet again) Device Tree Overlays
Date: Wed, 16 Apr 2014 16:23:15 -0500
Message-ID: <CANk1AXT7bPeus3WFPJ3mVHZ+HSuJ5DabxKQ7df1TV2A8-82-OQ@mail.gmail.com>
References: <1395179766-31575-1-git-send-email-pantelis.antoniou@konsulko.com>
	<CANk1AXTb=ob52AfK2z--HvFkxJnjnfYWuTCch_Gw99OCoS1ABg@mail.gmail.com>
	<CANk1AXRAsktOcfpMO7DzvenmUmZ_hUERkqa3nkKsqrGXn6eM=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANk1AXRAsktOcfpMO7DzvenmUmZ_hUERkqa3nkKsqrGXn6eM=A@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pete Popov <pete.popov-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Dan Malek <dan.malek-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Georgi Vlaev <georgi.vlaev-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 3, 2014 at 3:40 PM, delicious quinoa
<delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Mar 28, 2014 at 1:27 PM, delicious quinoa
> <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Tue, Mar 18, 2014 at 4:55 PM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> The following patchset introduces Device Tree overlays, a method
>>> of dynamically altering the kernel's live Device Tree, along with
>>> a generic interface to use it in a board agnostic manner.
>>>
>>> It is dependent on Grant Likely's DT kobjectification patches located
>>> in his tree as queued for -next.
>>>
>>> It relies on the following previously submitted patches/patchsets:
>>>
>>> * OF: Add [__]of_find_node_by_full_name
>>> * OF: Utility helper functions for dynamic nodes
>>> * of: Make of_find_node_by_path() handle /aliases
>>>
>>> To compile overlays you need the DTC compiler patch
>>>
>>> * "dtc: Dynamic symbols & fixup support (v2)"
>>>
>>> Changes since V2:
>>> * Use of a configfs board agnostic overlay method
>>> * Use of per bus handlers instead of hardcoded behaviour
>>> * Optional target-path overlay target, which allows one to use standard
>>> DTBs without resolution options.
>>>
>>> Changes since V1:
>>>
>>> * Removal of any bits related to a specific board (beaglebone).
>>> * Introduced a platform agnostic interface using /proc/device-tree-overlay
>>> * Various bug fixes related to i2c device handling have been squashed in.
>>>
>>>
>>> Pantelis Antoniou (7):
>>>   OF: Introduce Device Tree resolve support.
>>>   OF: Introduce DT overlay support.
>>>   OF: DT-Overlay configfs interface
>>>   OF: platform: Add overlay bus handler
>>>   OF: i2c: Add overlay bus handler
>>>   OF: spi: Add overlay bus handler
>>>   of: i2c: Export single device registration method
>>>
>>>  .../devicetree/dynamic-resolution-notes.txt        |  25 +
>>>  Documentation/devicetree/overlay-notes.txt         | 187 +++++
>>>  drivers/base/platform.c                            |  99 ++-
>>>  drivers/i2c/i2c-core.c                             | 186 +++--
>>>  drivers/of/Kconfig                                 |  24 +
>>>  drivers/of/Makefile                                |   3 +
>>>  drivers/of/configfs.c                              | 272 +++++++
>>>  drivers/of/overlay.c                               | 895 +++++++++++++++++++++
>>>  drivers/of/resolver.c                              | 376 +++++++++
>>>  drivers/spi/spi.c                                  | 345 +++++---
>>>  include/linux/i2c.h                                |  10 +
>>>  include/linux/of.h                                 | 170 ++++
>>>  12 files changed, 2440 insertions(+), 152 deletions(-)
>>>  create mode 100644 Documentation/devicetree/dynamic-resolution-notes.txt
>>>  create mode 100644 Documentation/devicetree/overlay-notes.txt
>>>  create mode 100644 drivers/of/configfs.c
>>>  create mode 100644 drivers/of/overlay.c
>>>  create mode 100644 drivers/of/resolver.c
>>
>> I can get a NULL pointer when I apply and remove an overlay and the
>> conditions are right.  The overlay applies correctly.  The crash is
>> when I do the rmdir.  My overlay is:
>>
>> /dts-v1/;
>> /plugin/;
>> / {
>>     fragment@0 {
>>         target-path="/soc";
>>         __overlay__ {
>>             #address-cells = <1>;
>>                     #size-cells = <1>;
>>             agpio0: agpio0 {
>>                 compatible = "altr,pio-1.0";
>>                 reg = <0xff210040 0x10>;
>
> Added some printks and got a bit further with debug.  If I leave this
> as-is, the platform device has 2 resources. We get the NULL pointer in
> __release_resource() when releasing the first one (reg). If I remove
> this one line ('reg =') the crash goes away.  So in this case, we are
> ok when releasing an irq resource but get a NULL pointer when removing
> a reg resource.  Don't know why at this point.

The crash is confirmed on v4 patches as well.  The immediate cause of the crash:

static int __release_resource(struct resource *old)
{
        struct resource *tmp, **p;

        p = &old->parent->child;
        for (;;) {
                tmp = *p; <===kablooey
...

when __release_resource() is called for the reg resource, it does 'p =
&olde->parent->child' and then crashes when it does 'tmp = *p'.

Root cause: It appears that there isn't any code in drivers/of/ that
eventually calls __request_resource() or __insert_resource() so the
resource's parents/sibling pointers are never initialized.  Maybe I'm
missing some patches or something.

Alan Tull
aka
delicious quinoa
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
