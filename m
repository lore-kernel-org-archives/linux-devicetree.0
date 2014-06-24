Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 5/6] OF: Utility helper functions for dynamic nodes
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <53A93E25.2090209@nsn.com>
Date: Tue, 24 Jun 2014 12:09:59 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <74A10692-6354-4847-AA74-4951F61EC07C@konsulko.com>
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com> <1403430039-15085-6-git-send-email-pantelis.antoniou@konsulko.com> <53A85549.7040809@nsn.com> <6E91A461-4361-4A18-BE32-CECDD789C114@konsulko.com> <20140623183343.GA10389@heimdall> <78ACBAF6-A73E-4272-8D3A-258C4B10858C@konsulko.com> <53A93304.9000604@nsn.com> <C009B451-09D6-4DE6-B859-E8113B63801E@konsulko.com> <53A93907.6070408@nsn.com> <2CAE7215-7D2D-454A-A6FD-6E93FAE8F1F7@konsulko.com> <53A93E25.2090209@nsn.com>
To: Alexander Sverdlin <alexander.sverdlin@nsn.com>
Cc: Ioan Nicu <ioan.nicu.ext@nsn.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Alexander,

On Jun 24, 2014, at 12:00 PM, Alexander Sverdlin wrote:

> Hi!
>=20
> On 24/06/14 10:54, ext Pantelis Antoniou wrote:
>> The fact of the matter is that use of of_get_property() where the =
intended use is to check
>> for the existence of a property (that might be empty) is incorrect =
IMO. of_find_property might
>> work, as well as the more correct form, where we know the property is =
a boolean, of_property_read_bool().
>>=20
>> The pointer returned from of_get_property() is not usable in any =
form. Whether it does=20
>> contains a NULL or not value is immaterial. That it works at all is a =
side-effect of how the
>> flattening code assigns value pointers.
>>=20
>> My vote is to just fix all the call sites using this questionable =
idiom.
>=20
> I fully agree with you here, this assumption that value!=3DNULL is =
simply not obvious.
> Let's wait, what Grant says, I can prepare a tree-wide patch, I =
think...
>=20

There's a simpler fix, the included patch, and here's a bootlog of it's =
trigger.
Let's just wait for Grant to show up... Grant?

> --=20
> Best regards,
> Alexander Sverdlin.

Regards

-- Pantelis

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 6dc6d63..fc965487 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -400,7 +400,17 @@ const void *__of_get_property(const struct =
device_node *np,
>  {
>         struct property *pp =3D __of_find_property(np, name, lenp);
> =20
> -       return pp ? pp->value : NULL;
> +       if (!pp)
> +               return NULL;
> +
> +       if (pp->length > 0)
> +               return pp->value;
> +
> +       pr_warn("__of_get_property() on boolean property %s/%s\n",
> +                       np->full_name, name);
> +
> +       /* return a pointer to an empty string */
> +       return "";
>  }
> =20
>  /*
>=20


> [    0.000000] __of_get_property() on boolean property /ocp/ranges
> [    0.000000] __of_get_property() on boolean property /ocp/ranges
> [    0.000000] __of_get_property() on boolean property /ocp/ranges
> [    0.000000] __of_get_property() on boolean property =
/ocp/timer@44e31000/ti,timer-alwon
> [    0.000000] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.000000] __of_get_property() on boolean property /ocp/ranges
> [    0.000000] __of_get_property() on boolean property /ocp/ranges
> [    0.000000] __of_get_property() on boolean property =
/ocp/timer@44e31000/ti,timer-alwon
> [    0.000000] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.000000] __of_get_property() on boolean property /ocp/ranges
> [    0.000000] __of_get_property() on boolean property /ocp/ranges
> [    0.079665] __of_get_property() on boolean property /ocp/ranges
> [    0.079903] __of_get_property() on boolean property /ocp/ranges
> [    0.080072] __of_get_property() on boolean property /ocp/ranges
> [    0.080222] __of_get_property() on boolean property /ocp/ranges
> [    0.080676] __of_get_property() on boolean property /ocp/ranges
> [    0.081180] __of_get_property() on boolean property /ocp/ranges
> [    0.081335] __of_get_property() on boolean property /ocp/ranges
> [    0.081491] __of_get_property() on boolean property /ocp/ranges
> [    0.081673] __of_get_property() on boolean property /ocp/ranges
> [    0.081853] __of_get_property() on boolean property /ocp/ranges
> [    0.083405] __of_get_property() on boolean property /ocp/ranges
> [    0.083620] __of_get_property() on boolean property /ocp/ranges
> [    0.083827] __of_get_property() on boolean property /ocp/ranges
> [    0.084036] __of_get_property() on boolean property /ocp/ranges
> [    0.084245] __of_get_property() on boolean property /ocp/ranges
> [    0.084526] __of_get_property() on boolean property /ocp/ranges
> [    0.084684] __of_get_property() on boolean property /ocp/ranges
> [    0.084843] __of_get_property() on boolean property /ocp/ranges
> [    0.085006] __of_get_property() on boolean property /ocp/ranges
> [    0.085169] __of_get_property() on boolean property /ocp/ranges
> [    0.085357] __of_get_property() on boolean property /ocp/ranges
> [    0.089088] __of_get_property() on boolean property /ocp/ranges
> [    0.089307] __of_get_property() on boolean property /ocp/ranges
> [    0.090186] __of_get_property() on boolean property /ocp/ranges
> [    0.090445] __of_get_property() on boolean property /ocp/ranges
> [    0.091570] __of_get_property() on boolean property /ocp/ranges
> [    0.206661] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.206696] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.208971] __of_get_property() on boolean property /ocp/ranges
> [    0.209000] __of_get_property() on boolean property /ocp/ranges
> [    0.209014] __of_get_property() on boolean property /ocp/ranges
> [    0.209475] __of_get_property() on boolean property /ocp/ranges
> [    0.209499] __of_get_property() on boolean property /ocp/ranges
> [    0.209512] __of_get_property() on boolean property /ocp/ranges
> [    0.209946] __of_get_property() on boolean property /ocp/ranges
> [    0.209969] __of_get_property() on boolean property /ocp/ranges
> [    0.209982] __of_get_property() on boolean property /ocp/ranges
> [    0.210415] __of_get_property() on boolean property /ocp/ranges
> [    0.210432] __of_get_property() on boolean property /ocp/ranges
> [    0.210475] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.210498] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.210518] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.210543] __of_get_property() on boolean property /ocp/ranges
> [    0.210557] __of_get_property() on boolean property /ocp/ranges
> [    0.210578] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.210603] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.210624] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.210639] __of_get_property() on boolean property /ocp/ranges
> [    0.211240] __of_get_property() on boolean property /ocp/ranges
> [    0.211275] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.211300] __of_get_property() on boolean property /ocp/ranges
> [    0.211321] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.211338] __of_get_property() on boolean property /ocp/ranges
> [    0.213540] __of_get_property() on boolean property /ocp/ranges
> [    0.213602] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.213629] __of_get_property() on boolean property /ocp/ranges
> [    0.213650] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.213671] __of_get_property() on boolean property /ocp/ranges
> [    0.215593] __of_get_property() on boolean property /ocp/ranges
> [    0.215643] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.215669] __of_get_property() on boolean property /ocp/ranges
> [    0.215691] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.215710] __of_get_property() on boolean property /ocp/ranges
> [    0.217330] __of_get_property() on boolean property /ocp/ranges
> [    0.217373] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.217398] __of_get_property() on boolean property /ocp/ranges
> [    0.217419] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.217437] __of_get_property() on boolean property /ocp/ranges
> [    0.219099] __of_get_property() on boolean property /ocp/ranges
> [    0.219137] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.219163] __of_get_property() on boolean property /ocp/ranges
> [    0.219183] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.219202] __of_get_property() on boolean property /ocp/ranges
> [    0.220051] __of_get_property() on boolean property /ocp/ranges
> [    0.220095] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.220122] __of_get_property() on boolean property /ocp/ranges
> [    0.220143] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.220162] __of_get_property() on boolean property /ocp/ranges
> [    0.220703] __of_get_property() on boolean property /ocp/ranges
> [    0.220733] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.220757] __of_get_property() on boolean property /ocp/ranges
> [    0.220775] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.220792] __of_get_property() on boolean property /ocp/ranges
> [    0.221276] __of_get_property() on boolean property /ocp/ranges
> [    0.221305] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.221328] __of_get_property() on boolean property /ocp/ranges
> [    0.221345] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.221362] __of_get_property() on boolean property /ocp/ranges
> [    0.221865] __of_get_property() on boolean property /ocp/ranges
> [    0.221890] __of_get_property() on boolean property /ocp/ranges
> [    0.221903] __of_get_property() on boolean property /ocp/ranges
> [    0.222366] __of_get_property() on boolean property /ocp/ranges
> [    0.222398] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.222423] __of_get_property() on boolean property /ocp/ranges
> [    0.222443] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.222460] __of_get_property() on boolean property /ocp/ranges
> [    0.223004] __of_get_property() on boolean property /ocp/ranges
> [    0.223035] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.223060] __of_get_property() on boolean property /ocp/ranges
> [    0.223079] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.223096] __of_get_property() on boolean property /ocp/ranges
> [    0.223652] __of_get_property() on boolean property /ocp/ranges
> [    0.223684] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.223710] __of_get_property() on boolean property /ocp/ranges
> [    0.223731] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.223747] __of_get_property() on boolean property /ocp/ranges
> [    0.224210] __of_get_property() on boolean property /ocp/ranges
> [    0.224238] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.224263] __of_get_property() on boolean property /ocp/ranges
> [    0.224283] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.224299] __of_get_property() on boolean property /ocp/ranges
> [    0.224757] __of_get_property() on boolean property /ocp/ranges
> [    0.224787] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.224811] __of_get_property() on boolean property /ocp/ranges
> [    0.224831] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.224847] __of_get_property() on boolean property /ocp/ranges
> [    0.225341] __of_get_property() on boolean property /ocp/ranges
> [    0.225370] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.225394] __of_get_property() on boolean property /ocp/ranges
> [    0.225414] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.225431] __of_get_property() on boolean property /ocp/ranges
> [    0.225896] __of_get_property() on boolean property /ocp/ranges
> [    0.225926] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.225945] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.225969] __of_get_property() on boolean property /ocp/ranges
> [    0.225988] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.226011] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.226026] __of_get_property() on boolean property /ocp/ranges
> [    0.226501] __of_get_property() on boolean property /ocp/ranges
> [    0.226524] __of_get_property() on boolean property /ocp/ranges
> [    0.226537] __of_get_property() on boolean property /ocp/ranges
> [    0.227069] __of_get_property() on boolean property /ocp/ranges
> [    0.227089] __of_get_property() on boolean property /ocp/ranges
> [    0.227117] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.227135] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.227153] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.227169] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.227193] __of_get_property() on boolean property /ocp/ranges
> [    0.227209] __of_get_property() on boolean property /ocp/ranges
> [    0.227227] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.227251] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.227271] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.227290] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.227306] __of_get_property() on boolean property /ocp/ranges
> [    0.227867] __of_get_property() on boolean property /ocp/ranges
> [    0.227891] __of_get_property() on boolean property /ocp/ranges
> [    0.227904] __of_get_property() on boolean property /ocp/ranges
> [    0.228373] __of_get_property() on boolean property /ocp/ranges
> [    0.228391] __of_get_property() on boolean property /ocp/ranges
> [    0.228412] __of_get_property() on boolean property /ocp/ranges
> [    0.228426] __of_get_property() on boolean property /ocp/ranges
> [    0.228439] __of_get_property() on boolean property /ocp/ranges
> [    0.228909] __of_get_property() on boolean property /ocp/ranges
> [    0.228945] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.228968] __of_get_property() on boolean property /ocp/ranges
> [    0.228985] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.229003] __of_get_property() on boolean property /ocp/ranges
> [    0.229531] __of_get_property() on boolean property /ocp/ranges
> [    0.229562] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.229588] __of_get_property() on boolean property /ocp/ranges
> [    0.229608] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.229624] __of_get_property() on boolean property /ocp/ranges
> [    0.230099] __of_get_property() on boolean property /ocp/ranges
> [    0.230129] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.230154] __of_get_property() on boolean property /ocp/ranges
> [    0.230174] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.230191] __of_get_property() on boolean property /ocp/ranges
> [    0.230686] __of_get_property() on boolean property /ocp/ranges
> [    0.230715] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.230739] __of_get_property() on boolean property /ocp/ranges
> [    0.230759] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.230776] __of_get_property() on boolean property /ocp/ranges
> [    0.233422] __of_get_property() on boolean property /ocp/ranges
> [    0.233951] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.233979] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    0.399973] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    2.711911] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.719306] __of_get_property() on boolean property /ocp/ranges
> [    2.725511] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.732881] __of_get_property() on boolean property /ocp/ranges
> [    2.739088] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.746458] __of_get_property() on boolean property /ocp/ranges
> [    2.752655] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.760024] __of_get_property() on boolean property /ocp/ranges
> [    2.766218] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.773587] __of_get_property() on boolean property /ocp/ranges
> [    2.780534] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.787938] __of_get_property() on boolean property /ocp/ranges
> [    2.794149] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.801525] __of_get_property() on boolean property /ocp/ranges
> [    2.807720] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.815090] __of_get_property() on boolean property /ocp/ranges
> [    2.840043] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.847441] __of_get_property() on boolean property /ocp/ranges
> [    2.853642] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.861013] __of_get_property() on boolean property /ocp/ranges
> [    2.867241] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    2.877447] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.884820] __of_get_property() on boolean property /ocp/ranges
> [    2.891017] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.898387] __of_get_property() on boolean property /ocp/ranges
> [    2.904592] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    2.914786] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.922157] __of_get_property() on boolean property /ocp/ranges
> [    2.930055] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    2.964001] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.971392] __of_get_property() on boolean property /ocp/ranges
> [    2.977604] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.984978] __of_get_property() on boolean property /ocp/ranges
> [    2.991177] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    2.998548] __of_get_property() on boolean property /ocp/ranges
> [    3.023524] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.030924] __of_get_property() on boolean property /ocp/ranges
> [    3.037127] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.044504] __of_get_property() on boolean property /ocp/ranges
> [    3.050732] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    3.060943] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.068320] __of_get_property() on boolean property /ocp/ranges
> [    3.074519] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.081891] __of_get_property() on boolean property /ocp/ranges
> [    3.088098] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    3.098295] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.105669] __of_get_property() on boolean property /ocp/ranges
> [    3.113250] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    3.147107] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.154497] __of_get_property() on boolean property /ocp/ranges
> [    3.160699] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.168072] __of_get_property() on boolean property /ocp/ranges
> [    3.174270] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.181641] __of_get_property() on boolean property /ocp/ranges
> [    3.187840] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.195210] __of_get_property() on boolean property /ocp/ranges
> [    3.201432] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    3.211640] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.219014] __of_get_property() on boolean property /ocp/ranges
> [    3.225214] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.232585] __of_get_property() on boolean property /ocp/ranges
> [    3.238783] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.246155] __of_get_property() on boolean property /ocp/ranges
> [    3.252354] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.259725] __of_get_property() on boolean property /ocp/ranges
> [    3.265930] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    3.276127] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.283500] __of_get_property() on boolean property /ocp/ranges
> [    3.290315] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.297707] __of_get_property() on boolean property /ocp/ranges
> [    3.303925] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.311300] __of_get_property() on boolean property /ocp/ranges
> [    3.317508] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.324881] __of_get_property() on boolean property /ocp/ranges
> [    3.331088] __of_get_property() on boolean property =
/ocp/usb@47400000/ranges
> [    3.338461] __of_get_property() on boolean property /ocp/ranges
> [    3.344933] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    3.398609] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    3.408921] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    3.473733] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    3.538616] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    3.665475] __of_get_property() on boolean property /ocp/ranges
> [    3.682774] __of_get_property() on boolean property /ocp/ranges
> [    3.689099] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    3.835081] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    3.933734] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    4.035694] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    4.273629] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    4.348412] __of_get_property() on boolean property =
/ocp/ethernet@4a100000/ranges
> [    4.356291] __of_get_property() on boolean property /ocp/ranges
> [    4.362547] __of_get_property() on boolean property =
/ocp/ethernet@4a100000/ranges
> [    4.370376] __of_get_property() on boolean property /ocp/ranges
> [    4.376574] __of_get_property() on boolean property =
/ocp/ethernet@4a100000/ranges
> [    4.384397] __of_get_property() on boolean property /ocp/ranges
> [    4.468262] __of_get_property() on boolean property =
/ocp/ethernet@4a100000/ranges
> [    4.476121] __of_get_property() on boolean property /ocp/ranges
> [    4.482366] __of_get_property() on boolean property =
/ocp/ethernet@4a100000/ranges
> [    4.490348] __of_get_property() on boolean property /ocp/ranges
> [    4.496553] __of_get_property() on boolean property =
/ocp/ethernet@4a100000/ranges
> [    4.504377] __of_get_property() on boolean property /ocp/ranges
> [    4.518562] __of_get_property() on boolean property =
/ocp/interrupt-controller@48200000/interrupt-controller
> [    4.605843] __of_get_property() on boolean property =
/testcase-data/interrupts/intc0/interrupt-controller
> [    4.615764] __of_get_property() on boolean property =
/testcase-data/interrupts/intc0/interrupt-controller
> [    4.625684] __of_get_property() on boolean property =
/testcase-data/interrupts/intc0/interrupt-controller
> [    4.635600] __of_get_property() on boolean property =
/testcase-data/interrupts/intc0/interrupt-controller
> [    4.645538] __of_get_property() on boolean property =
/testcase-data/interrupts/intc0/interrupt-controller
> [    4.655467] __of_get_property() on boolean property =
/testcase-data/interrupts/intc1/interrupt-controller
> [    4.665396] __of_get_property() on boolean property =
/testcase-data/interrupts/intc2/interrupt-controller
> [    4.675327] __of_get_property() on boolean property =
/testcase-data/interrupts/intc2/interrupt-controller
> [    4.685256] __of_get_property() on boolean property =
/testcase-data/interrupts/intc0/interrupt-controller
> [    4.695176] __of_get_property() on boolean property =
/testcase-data/interrupts/intc1/interrupt-controller
> [    4.705099] __of_get_property() on boolean property =
/testcase-data/interrupts/intc2/interrupt-controller
> [    4.715062] __of_get_property() on boolean property =
/testcase-data/interrupts/intc0/interrupt-controller
> [    4.725004] __of_get_property() on boolean property =
/testcase-data/interrupts/intc1/interrupt-controller
> [    4.734945] __of_get_property() on boolean property =
/testcase-data/interrupts/intc2/interrupt-controller
> [    4.744882] __of_get_property() on boolean property =
/testcase-data/interrupts/intc0/interrupt-controller
> [    4.755108] __of_get_property() on boolean property =
/testcase-data/interrupts/intc0/interrupt-controller
> [    4.765056] __of_get_property() on boolean property =
/testcase-data/interrupts/intc0/interrupt-controller
> [    4.783748] __of_get_property() on boolean property =
/testcase-data/interrupts/intc0/interrupt-controller
>=20
