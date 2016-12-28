From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/3] Documentation: dt: net: add mt76 wireless device binding
Date: Wed, 28 Dec 2016 14:51:45 +0100
Message-ID: <CACna6rzxtJ96tGUmy_k1wAtDu8z=vsJXw5SmHvr3+1=gD++Frg@mail.gmail.com>
References: <20160905095128.80560-1-nbd@nbd.name> <201609301636.43363.arnd@arndb.de>
 <557be2b8-5ff1-83ea-f6d1-6421c2465969@nbd.name> <201609301658.35039.arnd@arndb.de>
 <87vax9r26s.fsf@kamboji.qca.qualcomm.com> <CACna6ryikdd0Yt2FWB_JT27N5uuh9XU+JUWNRjs4H5YcD5PVpw@mail.gmail.com>
 <CAFBinCBzz0Jvk_jcWAJ1jEz17r-NYEE87xLUACTybRSHGE7uGA@mail.gmail.com> <CACna6rzKc8kAnc2_Ca8pXtuu9Rw2mjqfV8VNumoF_E7GdvJx-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6rzKc8kAnc2_Ca8pXtuu9Rw2mjqfV8VNumoF_E7GdvJx-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 28 December 2016 at 14:28, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> On 28 December 2016 at 11:43, Martin Blumenstingl
> <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> should we describe the center freq in Hz or MHz (cfg80211's
>> ieee80211_channel uses the latter)?
>
> Is there any case that may require HZ accuracy? I was thinking about usin=
g MHz.

Regulatory code uses KHz, so we may better do the same.

--=20
Rafa=C5=82
