From: Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RESEND PATCH v3 2/7] Add utilfdt for common functions
Date: Mon, 19 Sep 2011 20:54:02 -0700
Message-ID: <CAPnjgZ0U_gYkQQR14UNZ0tAOT8jYxzwi_mEYXsT134m14m=8Bg@mail.gmail.com>
References: <1316463668-976-1-git-send-email-sjg@chromium.org>
	<1316463668-976-3-git-send-email-sjg@chromium.org>
	<20110920010859.GE29197@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110920010859.GE29197-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Mon, Sep 19, 2011 at 6:08 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Mon, Sep 19, 2011 at 01:21:03PM -0700, Simon Glass wrote:
>> This adds a new utility library for performing libfdt operations.
>>
>> This is a separate library from libfdt because it performs OS operations,
>> like open/close/read/write, while libfdt is OS-neutral. These utility
>> functions are useful within the dtc package, and could potentially even
>> be generally useful, but should not be part of libfdt.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>> Changes in v2:
>> - Remove util_decode_key
>> - Add utilfdt_decode_type to be used by fdtget/put
>> - Remove limits on device tree binary size
>>
>> Changes in v3:
>> - Change format of -t argument to be more like printf
>> - Move utilfdt into its own directory and make it a library
>> - Use code closer to testutils.c implementation
>> - Use open/close instead of fopen/fclose
>
> [snip]
>> diff --git a/Makefile b/Makefile
>> index 380a705..4f5ccdd 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -15,7 +15,7 @@ EXTRAVERSION =3D
>> =A0LOCAL_VERSION =3D
>> =A0CONFIG_LOCALVERSION =3D
>>
>> -CPPFLAGS =3D -I libfdt
>> +CPPFLAGS =3D -I libfdt -I utilfdt
>> =A0WARNINGS =3D -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-exter=
ns \
>> =A0 =A0 =A0 -Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
>> =A0CFLAGS =3D -g -Os -fPIC -Werror $(WARNINGS)
>> @@ -151,6 +151,35 @@ ifneq ($(DEPTARGETS),)
>> =A0-include $(LIBFDT_OBJS:%.o=3D$(LIBFDT_objdir)/%.d)
>> =A0endif
>>
>> +#
>> +# Rules for utilfdt
>> +#
>> +UTILFDT_objdir =3D utilfdt
>> +UTILFDT_srcdir =3D utilfdt
>> +UTILFDT_archive =3D $(UTILFDT_objdir)/libutilfdt.a
>> +UTILFDT_lib =3D $(UTILFDT_objdir)/libutilfdt-$(DTC_VERSION).$(SHAREDLIB=
_EXT)
>> +UTILFDT_include =3D $(addprefix $(UTILFDT_srcdir)/,$(UTILFDT_INCLUDES))
>> +
>> +include $(UTILFDT_srcdir)/Makefile.utilfdt
>> +
>> +.PHONY: utilfdt
>> +utilfdt: $(UTILFDT_archive) $(UTILFDT_lib)
>> +
>> +$(UTILFDT_archive): $(addprefix $(UTILFDT_objdir)/,$(UTILFDT_OBJS))
>> +$(UTILFDT_lib): $(addprefix $(UTILFDT_objdir)/,$(UTILFDT_OBJS))
>
> Building a shared library out of this is complete overkill. =A0In fact,
> so is building a .a of it. =A0This is not an exported library for
> general use, but just an internal mini-"library" for use by the fdtget
> and fdtput functions. =A0Just have them both link with utilfdt.o.

I guess I misunderstood your comment on this patch in v2, referring I
thought to the function to read an fdt:

> Yes, you'll need to fix that for a general library version.  It
> should indeed return an error rather than dying.

I took that to me it should be in a library, and of course it couldn't
be in libfdt due to the OS use...

It is used by the tests, ftdump, fdtget and fdtput. I didn't really
want the tests to have to have -I.. and linking ../utilfdt.o.

So should I just make in an object file in the root that everything
except dtc links with?

Regards,
Simon

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
