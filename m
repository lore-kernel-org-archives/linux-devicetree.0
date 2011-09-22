From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/3] Variable sized cell support
Date: Thu, 22 Sep 2011 10:54:22 -0700
Message-ID: <CAF6FioUyWnF5RsfpzjPF_aCKq2zDUZJUd_2matqk6VgH6wBwcA@mail.gmail.com>
References: <1316637731-21872-1-git-send-email-robotboy@chromium.org>
	<20110922022634.GE22223@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110922022634.GE22223-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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

On Wed, Sep 21, 2011 at 7:26 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Sep 21, 2011 at 01:42:08PM -0700, Anton Staaf wrote:
>> This patch set adds, tests, and documents support for variable sized cel=
ls in
>> cell arrays. =A0The new syntax is:
>>
>> =A0 =A0 property =3D /size/ [8|16|32|64] <0x00 .... 0x12>;
>>
>> So cell arrays of 8, 16, 32, or 64-bits can now be created. =A0No paddin=
g is
>> done on the resulting cell array. =A0So if three 8-bit cells are specifi=
ed the
>> resulting property will contain three bytes.
>>
>> This patch set assumes that the character literals in cell lists patch h=
as
>> already been applied to your tree as it uses them in it's test case and =
the
>> diff will not apply cleanly to TOT without the character literals patch =
because
>> both patch sets modify the same locations in the parser. =A0You do not n=
eed to
>> apply the character literal support in bytestrings patch however.
>
> Nice.

Thanks.

> Still wants a little polish, I think. =A0And some time to sit around
> in case we have a better idea on the syntax, but a very good start.

Yup, makes sense.  I'll submit a v2 today that addresses your other comment=
s.

-Anton

> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
