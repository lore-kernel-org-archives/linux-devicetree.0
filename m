Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 1/5] of: Do not free memory at of_node_release option
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <20140709181800.6012AC4180B@trevor.secretlab.ca>
Date: Fri, 11 Jul 2014 23:29:51 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <A139A476-1868-4E58-9232-CE9184017861@konsulko.com>
References: <1404493129-8914-1-git-send-email-pantelis.antoniou@konsulko.com> <1404493129-8914-2-git-send-email-pantelis.antoniou@konsulko.com> <20140707131018.7E33EC409D5@trevor.secretlab.ca> <21848B64-6661-4D22-A3D4-4E85E38EB758@konsulko.com> <20140709181800.6012AC4180B@trevor.secretlab.ca>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Grant,

On Jul 9, 2014, at 9:18 PM, Grant Likely wrote:

> On Mon, 7 Jul 2014 16:13:42 +0300, Pantelis Antoniou =
<pantelis.antoniou@konsulko.com> wrote:
>> Hi Grant,
>>=20
>> On Jul 7, 2014, at 4:10 PM, Grant Likely wrote:
>>=20
>>> On Fri,  4 Jul 2014 19:58:45 +0300, Pantelis Antoniou =
<pantelis.antoniou@konsulko.com> wrote:
>>>> Introduce an option whether to free or not the memory of a node
>>>> and it's properties when of_node_release is called.
>>>>=20
>>>> The option is located in the chosen node, and its name is
>>>> of-node-keep. When this boolean property is missing the default
>>>> behaviour of freeing is preserved.
>>>=20
>>> No way. The problem is buggy kernel code. We've got a plan to fix =
that.
>>> In the mean time I'm okay with a CONFIG_ option that inhibits =
freeing,
>>> or *maybe* a runtime global option that causes free() to not be =
called.
>>>=20
>>> What this patch does is not helpful.
>>>=20
>>=20
>> Well, it was a long shot. FWIW I don't need it for overlays, this is =
just to
>> make sure we don't crash in case we have a buggy driver calling =
of_node_put()
>> twice or something.
>>=20
>> I'm open to suggestions on how to track and fix those.
>=20
> Switching to RCU is the first step. That lets us convert users into
> using rcu barriers instead of manually tracking of_node_get/put
> ordering. I would also like to talk to Julie about getting coccinelle
> report on node and property pointer references being held outside the
> rcu barriers without an of_node_get()
>=20

Sounds good to me. Let's see what monsters lie under the bed over there.

>>=20
>>> g.
>>>=20
>>=20

Regards

-- Pantelis
