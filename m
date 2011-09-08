From: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dtc: Refactor character literal parsing code
Date: Thu, 8 Sep 2011 09:06:13 -0700
Message-ID: <CAF6FioUi6vFbQVuTJq=Jo4gLhSE8JWPjszTcP7QJapEX=X53HA@mail.gmail.com>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
	<1315437340-1661-2-git-send-email-robotboy@chromium.org>
	<20110908032250.GM30278@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110908032250.GM30278-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 7, 2011 at 8:22 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Sep 07, 2011 at 04:15:38PM -0700, Anton Staaf wrote:
>> Move the parsing of hex, octal and escaped characters from data.c
>> to util.c where it can be used for character literal parsing within
>> strings as well as for stand alone C style character literals.
>
> [snip]
>> +char get_oct_char(const char *s, int *i)
>
> Probably make these static, since I can't really see a use for them
> other than in the escape processing code.

Yup, will do.

>> +{
>> + =A0 =A0 char x[4];
>> + =A0 =A0 char *endx;
>> + =A0 =A0 long val;
>> +
>> + =A0 =A0 x[3] =3D '\0';
>> + =A0 =A0 strncpy(x, s + *i, 3);
>> +
>> + =A0 =A0 val =3D strtol(x, &endx, 8);
>> +
>> + =A0 =A0 assert(endx > x);
>> +
>> + =A0 =A0 (*i) +=3D endx - x;
>> + =A0 =A0 return val;
>> +}
>> +
>> +char get_hex_char(const char *s, int *i)
>> +{
>> + =A0 =A0 char x[3];
>> + =A0 =A0 char *endx;
>> + =A0 =A0 long val;
>> +
>> + =A0 =A0 x[2] =3D '\0';
>> + =A0 =A0 strncpy(x, s + *i, 2);
>> +
>> + =A0 =A0 val =3D strtol(x, &endx, 16);
>> + =A0 =A0 if (!(endx =A0> x))
>> + =A0 =A0 =A0 =A0 =A0 =A0 die("\\x used with no following hex digits\n");
>> +
>> + =A0 =A0 (*i) +=3D endx - x;
>> + =A0 =A0 return val;
>> +}
>> +
>> +char get_escape_char(const char *s, int *i)
>
> Yes, splitting this function off is quite nice.
>
> [snip]
>> +char get_escape_char_exact(const char *s, int len)
>> +{
>> + =A0 =A0 int =A0 =A0 j =3D 1; //skip intial "\"
>> + =A0 =A0 char =A0 =A0c =3D get_escape_char(s, &j);
>> +
>> + =A0 =A0 if (j !=3D len)
>> + =A0 =A0 =A0 =A0 =A0 =A0 die("Extra characters at end of character lite=
ral '%s' "
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "(%d !=3D %d)\n", s, j, len);
>> +
>> + =A0 =A0 return c;
>> +}
>
> This I'm not a fan of. =A0Handling erroneous input with a die() in a
> low-level helper like this is pretty nasty (I know there are other
> instances of it). =A0I'd prefer to see the action handling the error in
> the caller though, where it's better equipped to know a reasonable way
> of informing the user.

Can do, this behavior was copied from another _exact function, I'll
switch to doing the check in the parser rule.

Thanks,
    Anton

> Some more on error handling in comments on your next patch.
>
> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
