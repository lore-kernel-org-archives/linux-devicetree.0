From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 0/5] simplefb: add clock handling code
Date: Thu, 13 Nov 2014 19:00:56 +0100
Message-ID: <5464F1D8.5060106@redhat.com>
References: <1415808952-23549-1-git-send-email-hdegoede@redhat.com> <5464CC5A.7010508@ti.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDRZXY4CYYORB777SORQKGQEEH3H6QA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5464CC5A.7010508-l0cyMroinI0@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 11/13/2014 04:20 PM, Tomi Valkeinen wrote:
> On 12/11/14 18:15, Hans de Goede wrote:
>> Hi Tomi,
>>
>> Here is v5 of my simplefb patch-set, this time with an Ack from
>> Grant Likely for the dt-bindings bits, which should end all controversy
>> surrounding that patch.
>>
>> For changes since the original postings please see the per patch changel=
ogs
>> in the patch commit messages.
>>
>> Please merge this into your tree for 3.19.
>=20
> I applied this and the "dt-bindings: simplefb: Specify node location and
> handoff related properties" v3 series to my test branch, compiled for
> x64 and:
>=20
> drivers/video/fbdev/simplefb.c: In function =E2=80=98simplefb_clocks_init=
=E2=80=99:
> drivers/video/fbdev/simplefb.c:204:2: error: implicit declaration of
> function =E2=80=98of_clk_get_parent_count=E2=80=99 [-Werror=3Dimplicit-fu=
nction-declaration]
>   par->clk_count =3D of_clk_get_parent_count(np);
>   ^
> In file included from include/linux/i2c.h:33:0,
>                  from include/uapi/linux/fb.h:5,
>                  from include/linux/fb.h:5,
>                  from drivers/video/fbdev/simplefb.c:24:
> drivers/video/fbdev/simplefb.c: In function =E2=80=98simplefb_init=E2=80=
=99:
> drivers/video/fbdev/simplefb.c:399:25: error: =E2=80=98of_chosen=E2=80=99=
 undeclared
> (first use in this function)
>   for_each_child_of_node(of_chosen, np) {
>                          ^
> include/linux/of.h:736:33: note: in definition of macro
> =E2=80=98for_each_child_of_node=E2=80=99
>   for (child =3D of_get_next_child(parent, NULL); child !=3D NULL; \
>                                  ^
> drivers/video/fbdev/simplefb.c:399:25: note: each undeclared identifier
> is reported only once for each function it appears in
>   for_each_child_of_node(of_chosen, np) {
>                          ^
> include/linux/of.h:736:33: note: in definition of macro
> =E2=80=98for_each_child_of_node=E2=80=99
>   for (child =3D of_get_next_child(parent, NULL); child !=3D NULL; \
>                                  ^
>=20
> We need "depends on OF"?

Good catch!

So a quick-grep through the entire kernel sources has thought me that
apparently simplefb is used on non devicetree / of platforms through
platform-device instantiation, using the trick of naming the platform-devic=
e the
same as the driver to get the driver to bind.

So the answer to your compile breakage is to make the relevant code bits
be #ifdef CONFIG_OF

I'll respin the offending patch (5/5) in the "simplefb: add clock handling =
code"
series, and I'll respin the entire second series, as I need to also address
your comment on the example in the bindings there.

I hope to be able to post a re-spun version of both later tonight.

Regards,

Hans



>=20
>  Tomi
>=20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
