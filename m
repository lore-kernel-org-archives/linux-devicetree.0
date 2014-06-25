Return-Path: <dan.malek@konsulko.com>
Return-Path: <dan.malek@konsulko.com>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
Subject: Re: [PATCH] of: Transactional DT support.
From: Dan Malek <dan.malek@konsulko.com>
In-Reply-To: <C0AB3C41-C0BE-4F50-A4DB-843EAC8C8F6F@konsulko.com>
Date: Wed, 25 Jun 2014 12:20:16 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B23E906-3099-4775-B471-58BEB1542A36@konsulko.com>
References: <1403430093-15132-1-git-send-email-pantelis.antoniou@konsulko.com> <20140625140641.F10F0C40B59@trevor.secretlab.ca> <C0AB3C41-C0BE-4F50-A4DB-843EAC8C8F6F@konsulko.com>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>


On Jun 25, 2014, at 7:48 AM, Pantelis Antoniou =
<pantelis.antoniou@konsulko.com> wrote:

>>> +int of_transaction_commit(struct of_transaction *oft);
>>=20
>> How about of_transaction_apply()?
>>=20
>=20
> Sure.

LOL!  Panto, you give in too easily :)

Any transaction state diagrams I've seen always have a "commit" =
phase/state, never anything called "apply."  So, of_transaction_commit() =
is exactly the proper name.

Except for "init" and "start", all of the other names chosen are proper =
transaction states or functions.  If you really want to nit-pick, I'd =
argue that "init" should be "idle," and "start" should be "activate."  =
Aside from that,  the proper vocabulary was chosen.

Of course, the functions working properly is what is really important :)

Thanks.

	-- Dan
