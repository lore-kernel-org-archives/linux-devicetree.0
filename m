From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: dtc symbolic constants - not in the preprocessor?
Date: Tue, 17 Apr 2012 21:39:55 -0700
Message-ID: <CAPnjgZ08QajSzLWwGTFci7-5JiQSGs0_rXGJaz5PCbSqbv1_0Q@mail.gmail.com>
References: <4F8E2A87.6000805@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F8E2A87.6000805-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Tue, Apr 17, 2012 at 7:44 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wro=
te:
> So, David has been leaning towards a simple text-based preprocessor as
> the means to add symbolic constants to dtc. Depending on exactly how
> much advanced expression support the dtc language ends up gaining, I'm
> not so sure a text-based preprocessor is the right approach.
>
> So, a text-based preprocessor is fine for basic stuff like:
>
> #define FOO 5
>
> / {
> =A0 =A0prop =3D <(FOO)>;
> };
>
> However, if the dtc language itself gains functions, iteration, etc., I
> think this breaks down.
>
> Using cpp, we could do something like:
>
> #define TEGRA_USB1_INT_STATUS 0x7000000
> #define POS(chip, reg, field) chip##_##reg##_##field##_POS
>
> / {
> =A0 =A0prop1 =3D <(POS(TEGRA, USB1, INT_STATUS))>;
> };
>
> where you can imagine that the POS macro is calculating the name of a
> symbolic constant, then reading the value of the name.
>
> However, what if instead of hard-coding USB1 in the above example, we
> want to iterate over 1, 2, 3? Expressing this iteration as a set of
> functions in the dtc grammar (as in functional programming) has been
> floated as an idea. In other words generate a result like:
>
> / {
> =A0 =A0prop1 =3D <(POS(TEGRA, USB, 1, INT_STATUS))>;
> =A0 =A0prop2 =3D <(POS(TEGRA, USB, 2, INT_STATUS))>;
> =A0 =A0prop3 =3D <(POS(TEGRA, USB, 3, INT_STATUS))>;
> };
>
> ... but using iteration in the dtc language instead of cut/paste.
>
> If this iteration happens in the dtc language phase rather than the
> preprocessing phase, then all the named constants known to the
> preprocessing phase have been thrown away, and hence could never be
> accessed by any functions/macros/... executing in the dtc language phase.
>
> For this reason, I think that symbolic constants should probably be
> something at the dtc language level rather than there being a separate
> preprocessing phase, if we envisage dtc ever gaining anything more
> complex than simple expression and symbolic constant support.
>
> Do people agree with this?

Yes I strongly agree that symbolic constants should be in the dtc
language. I don't like the brackets though...

>
>
>
> If so, the simplest symbolic constant syntax might be:
>
> /define/ FOO 5;
>
> / {
> =A0 =A0prop =3D <(FOO)>;
> };
>
> (this is roughly what was in my somewhat recent /define/ patch proposal).
>
>
>
> As an equivalent of the cpp ## operator, we could imagine something like:
>
> /define/ TEGRA_USB1_INT_STATUS 0x7000000;
> /function/ POS(chip, reg, field)
> =A0 =A0readvar(chip + "_" + reg + "_" + field + "_POS");
>
> / {
> =A0 =A0prop =3D <(POS("TEGRA", "USB1", "INT_STATUS"))>;
> };
>
> where readvar() is a built-in function that reads from the symbol table.
>
>
>
> Following on from this, I've been envisaging symbolic constants holding
> single integer values (perhaps strings too), as in the "FOO" example a
> little above.
>
> Simon Glass was thinking (admittedly I believe more in the context of
> plain text-expansion) of allowing symbolic constants to be more than
> just single integers, perhaps:
>
> /define/ GDB_BASE 0x00e08000;

If it matters I had /define/ GDB_BASE <0x00e08000> for this.

> /define/ CHROME_OS_BOOT_DEVICES "emmc", "spi";
> /define/ UART_BAUD_OPTIONS <115200 57600 19200>;
>
> / {
> =A0 =A0prop1 =3D <GDB_BASE>;
> =A0 =A0prop2 =3D <CHROME_OS_BOOT_DEVICES>;
> =A0 =A0prop3 =3D <UART_BAUD_OPTIONS>;
> };
>
> (The syntax re: where <> appear might need some development in this
> example.)

Yes.

>
> The idea here was that (some) variables might contain a sequence of
> bytes just would just be dumped directly into the property data without
> much interpretation.
>
> This would presumably require symbolic constants to be typed somehow, so
> that dtc would know that (GDB_BASE + 0x100) made sense, whereas
> (UART_BAUD_OPTIONS + 0x100) didn't.

Perhaps, although maybe using /define/ for both is a bad idea.

Actually I was just thinking of dumping the data in. I like your
suggestion in that thread about /defprop/ or /defdata/ instead
actually - so these would just be blobs of data with no value and not
suitable to use in expressions. In other words this feature would be
separate from first class variables / symbols mentioned above which
can be operated on. Perhaps a bit like strings in other languages -
just a sequence of cells / bytes.

The patch is available here, although the title is a misnomer now. It
is just a modification of Stephen's patch mentioned above:

https://gerrit.chromium.org/gerrit/#change,19855

In any case I strongly support efforts to define support for symbolic
constants, one way or another. Looking forward to the outcome!

Regards,
Simon
