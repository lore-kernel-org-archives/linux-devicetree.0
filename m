From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH] drivers/of: add option to load a default Device Tree
Date: Thu, 30 Jun 2016 23:46:10 +0300
Message-ID: <FC6DF2EE-CE1A-4EEB-BCD6-ECCE04F680A8@antoniou-consulting.com>
References: <1466607954-2821-1-git-send-email-franck.jullien@odyssee-systemes.fr> <57755ACF.1090204@gmail.com> <CAJfOKByav-r9=4YEJrzuCfeAyTEtr4+=a_0d08gSLBSRrPPiEA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJfOKByav-r9=4YEJrzuCfeAyTEtr4+=a_0d08gSLBSRrPPiEA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Franck Jullien <franck.jullien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, jose.abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Franck,

> On Jun 30, 2016, at 23:44 , Franck Jullien <franck.jullien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
>=20
> 2016-06-30 19:45 GMT+02:00 Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> Hi Franck,
>>=20
>> (This could be confusing, with Franck and Frank -- feel free to
>> address me as rowand in this thread if it is less confusing.)
>>=20
>> On 06/22/16 08:05, Franck Jullien wrote:
>>> Even if a platform doesn't use a device tree during its
>>> boot process it can be useful to enable CONFIG_OF and get
>>> an empty device tree.
>>>=20
>>> Then, devices can use device tree overlays to populate this
>>> default tree.
>>>=20
>>> Signed-off-by: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
>>> ---
>>> drivers/of/Kconfig     |  9 +++++++++
>>> drivers/of/Makefile    |  3 +++
>>> drivers/of/base.c      | 50 +++++++++++++++++++++++++++++++++++++++=
+++++++++++
>>> drivers/of/default.dts |  4 ++++
>>> drivers/of/unittest.c  | 33 +++++----------------------------
>>> include/linux/of.h     |  2 ++
>>> 6 files changed, 73 insertions(+), 28 deletions(-)
>>> create mode 100644 drivers/of/default.dts
>>=20
>> < snip >
>>=20
>> For context, in a later reply, you mention that this is for x86_64.
>>=20
>> My current inclination is to prefer not to solve the problem this wa=
y.
>> I was going to ask why you didn't just add the compiled default.dts
>> to the kernel as an appended device tree blob, until I found out
>> this was for x86_64.
>>=20
>> Can you add unflatten_devicetree() to x86_64, then just use the
>> appended device tree blob method?
>>=20
>=20
> You're saying I should implement the ability for x86_64 to detect and
> load a devicetree that is appended to the binary image like ARM does =
[1] ?
>=20
> Would you keep CONFIG_DEFAULT_DTB at all ? Or appending an
> empty (or not) devicetree would be after the binary image is built ?
>=20
> I like the idea. I think I could remove CONFIG_DEFAULT_DTB and
> let the user append a blob to the image.
>=20
> By the way, why having an empty devicetree built-in is not your
> preferred choice ?
>=20

Already have a patch that does that but it needs some cleanup. I haven=E2=
=80=99t bothered
with the i386 version either.

Sigh, -ENOTIME..

> Franck.
>=20

Regards

=E2=80=94 Pantelis

> [1] http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3De2a6a3aafa9862c4a4b59f2a59b8f923d64a680e

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
