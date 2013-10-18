From: Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC 0/1] Device Tree Schema Source format proposal
Date: Fri, 18 Oct 2013 17:51:15 +0200
Message-ID: <526158F3.4060104@baylibre.com>
References: <9610740.2oBMxfeRkE@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9610740.2oBMxfeRkE@amdc1227>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "Chaiken, Alison" <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Tomasz,

I'm glad you're back, we were missing you on that topic :-)

On 18/10/2013 16:56, Tomasz Figa wrote:
> Hi All,
>
> Since the ARM Kernel Summit in Edinburgh is coming by big steps and w=
e
> need some food for thought for discussions that will be happening the=
re,
> I am posting my work in progress on Device Tree Schema Source format.
>
> I know I've been supposed to actively work on this and come up with
> something working long time ago already, but due to unexpected
> circumstances (aka neverending streams of other work) I could spend w=
ay
> less time than I wanted on it.
>
> How miserably I failed can be seen on an example of Benoit's and Fabi=
en's
> attempt to solve this problem that has likely taken much less time an=
d
> is in an already working state.

That was more a proof of concept that helped us checking our assumption=
s=20
and the feasibility. Based on the first feedbacks, we were working on a=
=20
slightly different v2, that will anyway not be ready for ELCE. Your=20
inputs are thus very welcome and will help progressing and converging o=
n=20
the schema definition.
Well, at least, I hope :-)

> So here I am, posting whatever I have done till now to present my ide=
as
> that came to my mind while working on this and possibly allow wider
> discussion on this topic.

Great, I'll review that during the flight to be able to discuss that=20
next week.

> A work in progress text on DTSS format will be sent in a follow-up
> message, for clarity.

Thanks,
See you next week,

Benoit

--=20
Beno=EEt Cousson
BayLibre
Embedded Linux Technology Lab
www.baylibre.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
