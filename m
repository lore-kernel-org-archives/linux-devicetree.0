From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/flattree: use callback to setup initrd from /chosen
Date: Tue, 12 Jan 2010 23:43:15 -0700
Message-ID: <fa686aa41001122243v31e25e9et5db40b4f7ea8a56f@mail.gmail.com>
References: <1261474791.289871.854376051633.1.gpush@pororo>
	<1261478868.10767.2.camel@concordia>
	<200912221854.37572.jeremy.kerr@canonical.com>
	<1261487856.10767.128.camel@concordia>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1261487856.10767.128.camel@concordia>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 22, 2009 at 6:17 AM, Michael Ellerman
<michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> wrote:
> On Tue, 2009-12-22 at 18:54 +0800, Jeremy Kerr wrote:
>> Hi Michael,
>>
>> > > =A0void early_init_dt_setup_initrd_arch(unsigned long start,
>> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsi=
gned long end);
>> >
>> > arch_early_init_dt_setup_initrd() makes more sense to me, but ..
>>
>> <foo>_arch has been the general convention for arch-specific hooks in
>> drivers/of/.
>
> Yuck, doh, guess I should have read those patches before they went in :)

It's not necessarily permanent.  My first goal is to get the common
code merged.  Then I want to look closely at it for patterns and
refactor how the common code calls out to arch specific hooks (or
maybe turn it around and have arch code calling out to the common
bits).

>
>> > > +#ifdef CONFIG_BLK_DEV_INITRD
>> > > +void __init early_init_dt_setup_initrd_arch(unsigned long start,
>> > > + =A0 =A0 =A0 =A0 unsigned long end)
>> > > +{
>> > > + initrd_start =3D (unsigned long)__va(start);
>> > > + initrd_end =3D (unsigned long)__va(end);
>> > > + initrd_below_start_ok =3D 1;
>> > > +}
>> > > +#endif
>> >
>> > Given you have two identical implementations why not make that the
>> > default and make it weak, and let ARM override it.
>>
>> Yeah, that would be good too; just been avoiding weak as a potential sou=
rce of
>> magic voodoo complexity. Grant - up to you on this one.
>
> Yeah, depends on what toolchains you're supporting, modern ones should
> be OK but it can be troublesome.

I'll look at this.

g.


-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
