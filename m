From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 4/5] of: Add old prop argument on OF_RECONFIG_UPDATE_PROPERTY
Date: Thu, 6 Nov 2014 15:14:13 +0200
Message-ID: <EAE4A1B8-2019-4073-A26F-90E73C2ED394@konsulko.com>
References: <1414528433-9650-1-git-send-email-pantelis.antoniou@konsulko.com> <1414528433-9650-5-git-send-email-pantelis.antoniou@konsulko.com> <20141105200129.B4438C41C40@trevor.secretlab.ca> <E0B33C12-EBD6-465C-813C-7FD8553A3CB8@konsulko.com> <CACxGe6tvRJP3J=7ccmH-CtjwSaZVx23KnkcMb6zgzG-pOkanXA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6tvRJP3J=7ccmH-CtjwSaZVx23KnkcMb6zgzG-pOkanXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pete Popov <pete.popov-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Dan Malek <dan.malek-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Geor
List-Id: devicetree@vger.kernel.org

Hi Grant,

> On Nov 6, 2014, at 14:46 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
>=20
> On Wed, Nov 5, 2014 at 8:08 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> Hi Grant,
>>=20
>>> On Nov 5, 2014, at 22:01 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>>>=20
>>> On Tue, 28 Oct 2014 22:33:52 +0200
>>> , Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>> wrote:
>>>> The notifier now includes the old_prop argument when updating
>>>> properties, propagate this API to changeset internals while
>>>> also retaining the old behaviour of retrieving the old_property
>>>> when NULL is passed.
>>>>=20
>>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>>=20
>>> I'm still fuzzy on the need for this patch. Is this just an optimiz=
ation
>>> so that the property doesn't get looked up twice? Or is there a rea=
son
>>> when the oldprop really needs to be passed in explicitly?
>>>=20
>>=20
>> In the case of overlay's applying a property change the old property=
 has
>> been already retrieved. Passing it as an argument saves us a travers=
al of the
>> property list.
>>=20
>> On the original series were removal was supported, the old property =
was required
>> since you can't find the old property anymore on the node (it was on=
 another list).
>>=20
>> When we go back to revisit the removal case, that API is useful.
>=20
> Since we're not doing removal anymore, lets drop this patch.
>=20

=46ine, I=92ll have to rework the overlay patches however.

> g.

Regards

=97 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
