Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 5/5] of: Transactional DT support.
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <CACxGe6v7hTTtdjY3zAmAUR29zn+3iOFpuac2=CqiLAd5wXfn-A@mail.gmail.com>
Date: Tue, 15 Jul 2014 09:41:35 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <E700D92A-7777-46E7-A99C-D8321D4F1EE6@konsulko.com>
References: <1404493129-8914-1-git-send-email-pantelis.antoniou@konsulko.com> <1404493129-8914-6-git-send-email-pantelis.antoniou@konsulko.com> <20140711052437.2232BC40B84@trevor.secretlab.ca> <0E971359-9791-43D0-86C3-2CE81457934E@konsulko.com> <CACxGe6v7hTTtdjY3zAmAUR29zn+3iOFpuac2=CqiLAd5wXfn-A@mail.gmail.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Linux I2C <linux-i2c@vger.kernel.org>, Mark Brown <broonie@kernel.org>, linux-spi <linux-spi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Grant,

On Jul 14, 2014, at 9:09 PM, Grant Likely wrote:

> On Fri, Jul 11, 2014 at 2:28 PM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
>> Hi Grant,
>>=20
>> On Jul 11, 2014, at 8:24 AM, Grant Likely wrote:
>>=20
>>> On Fri,  4 Jul 2014 19:58:49 +0300, Pantelis Antoniou =
<pantelis.antoniou@konsulko.com> wrote:
>>>> Introducing DT transactional support.
>>>>=20
>>>> A DT transaction is a method which allows one to apply changes
>>>> in the live tree, in such a way that either the full set of changes
>>>> take effect, or the state of the tree can be rolled-back to the
>>>> state it was before it was attempted. An applied transaction
>>>> can be rolled-back at any time.
>>>>=20
>>>> If any transaction results in the change of a state of a device
>>>> node, a notifier for that node will be fired which allows a bus
>>>> to create/destroy devices as directed.
>>>>=20
>>>> Documentation is in
>>>>     Documentation/devicetree/transactions.txt
>>>=20
>>> Hi Pantelis,
>>>=20
>>> I've got a lot of comments below, but you don't need to respin the
>>> series immediately. I've got a tree that I'm working with to sort =
out
>>> what I can queue up for the next kernel. Give me a few days and I'll
>>> send you what I've gotten to.
>>>=20
>>=20
>> OK, that would be good.
>=20
> It is rather rough, and I haven't squashed the patches together yet,
> but you can see what I have here. I'm busy writing some basic
> testcases to prove out the functionality before I squash things down.
>=20

Thanks for that. I'll pick this branch up and perform some testing from =
my
own side.

> g.
>=20

Regards

-- Pantelis

> The following changes since commit =
cd3de83f147601356395b57a8673e9c5ff1e59d1:
>=20
>  Linux 3.16-rc4 (2014-07-06 12:37:51 -0700)
>=20
> are available in the git repository at:
>=20
>  git://git.secretlab.ca/git/linux devicetree/next-overlay
>=20
> for you to fetch changes up to =
35129420765f8312f2f08bcec68e5daf0f0f7bff:
>=20
>  fixup: Fix error when applying node changes (2014-07-14 11:54:20 =
-0600)
>=20
> ----------------------------------------------------------------
> Grant Likely (18):
>      of/platform: Fix of_platform_device_destroy iteration of devices
>      of: Move CONFIG_OF_DYNAMIC code into a separate file
>      fixup: Make of_kset non-static
>      fixup: Remove the device state notifiers
>      fixup: roll of_transaction_entry_create into =
of_transaction_action()
>      fixup: remove of_transaction_device_is_available()
>      fixup: remove of_transaction_find_property() and
> of_transaction_get_child_by_name()
>      fixup: eliminate the 'force' arguement to =
of_transaction_{apply,revert}
>      fixup: emit all notifiers at once instead of one at a time while
> changes are being applied
>      fixup: get rid of destroying transaction on revert
>      fixup: remove of_transaction_{start,abort}
>      fixup: Add helper to invert a transaction entry
>      fixup: implement of_transaction_entry_revert() using
> of_transaction_entry_apply()
>      fixup: move the dump operation into of_transaction_entry_apply()
>      fixup: s/transaction/changeset/g
>      fixup: Move changeset code into dynamic.c
>      fixup: Add changeset testcase
>      fixup: Fix error when applying node changes
>=20
> Pantelis Antoniou (5):
>      of: rename of_aliases_mutex to just of_mutex
>      OF: Utility helper functions for dynamic nodes
>      of: Create unlocked versions of node and property add/remove =
functions
>      of: Make devicetree sysfs update functions consistent.
>      of: Transactional DT support.
>=20
> Documentation/devicetree/changesets.txt |  41 ++
> drivers/of/Kconfig                      |   2 +-
> drivers/of/Makefile                     |   1 +
> drivers/of/base.c                       | 410 +++++---------------
> drivers/of/device.c                     |   4 +-
> drivers/of/dynamic.c                    | 666 =
++++++++++++++++++++++++++++++++
> drivers/of/of_private.h                 |  58 ++-
> drivers/of/platform.c                   |  32 +-
> drivers/of/selftest.c                   |  73 ++++
> drivers/of/testcase-data/testcases.dtsi |  10 +
> include/linux/of.h                      |  79 +++-
> include/linux/of_platform.h             |   7 +-
> 12 files changed, 1040 insertions(+), 343 deletions(-)
> create mode 100644 Documentation/devicetree/changesets.txt
> create mode 100644 drivers/of/dynamic.c
