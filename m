From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] OF: DT-Overlay configfs interface (v3)
Date: Mon, 8 Dec 2014 20:29:03 +0200
Message-ID: <C7DADD77-A379-47E5-93DE-FB04C1C0FF30@konsulko.com>
References: <1417605808-23327-1-git-send-email-pantelis.antoniou@konsulko.com> <20141204103104.7D8E0C40992@trevor.secretlab.ca> <8795CB40-87D6-4683-8396-987A49E94574@konsulko.com> <20141205164450.A9294C40B61@trevor.secretlab.ca> <E64BA68B-A339-4BB2-B453-B8A9165CB9B7@konsulko.com> <20141208182531.41BD6C40D73@trevor.secretlab.ca>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141208182531.41BD6C40D73-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

> On Dec 8, 2014, at 20:25 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
>=20
> On Fri, 5 Dec 2014 19:58:27 +0200
> , Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> wrote:
>> Hi Grant,
>>=20
>>> On Dec 5, 2014, at 18:44 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>>>>=20
>> [snip]
>>=20
>>>> For instance, if the user issued a load request for a path in a co=
ntainer
>>>> which is the namespace under which the firmware file is located? I=
s it the
>>>> non-container filesystem, or is it under the container filesystem =
that
>>>> issued the request. The firmware layer does not have an API to dis=
cern.
>>>=20
>>> Wait, what? Why on earth would you want to expose this interface in=
 a container?
>>>=20
>>=20
>> It was a complaint raised.=20
>>=20
>> Look at this thread.
>>=20
>> http://permalink.gmane.org/gmane.linux.documentation/27655
>=20
> I've replied on that thread. I don't think the issues raised there
> warrent two completely separate methods for loading the data into the
> kernel. I want to see one method only.
>=20

The firmware interface is required and is the simplest one.

If that=E2=80=99s OK, let=E2=80=99s go with that.

> g.
>=20

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
