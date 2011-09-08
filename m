From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/6] Add utilfdt for common functions
Date: Thu, 8 Sep 2011 05:37:08 -0700
Message-ID: <CAPnjgZ1J0k93vo1A5ns5OxW5=nesr9pwLMMPAc+gyaOWmtmwuQ@mail.gmail.com>
References: <1315425260-2711-1-git-send-email-sjg@chromium.org>
	<1315425260-2711-2-git-send-email-sjg@chromium.org>
	<20110908052028.GQ30278@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110908052028.GQ30278-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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

On Wed, Sep 7, 2011 at 10:20 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Sep 07, 2011 at 12:54:15PM -0700, Simon Glass wrote:
>> This adds a new utility library for performing libfdt operations.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>> Changes in v2:
>> - Remove util_decode_key
>> - Add utilfdt_decode_type to be used by fdtget/put
>> - Remove limits on device tree binary size

[snip]

>> + =A0 =A0 if (strcmp(filename, "-") =3D=3D 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 fp =3D stdin;
>> + =A0 =A0 =A0 =A0 =A0 =A0 toread =3D 64 * 1024; =A0 =A0 /* Suitable like=
ly maximum */
>
> Arbitrary limits, yuck.

There is no arbitrary limit here - it is just the number of bytes read
initially.

>
>> + =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 fp =3D fopen(filename, "rb");
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (fp =3D=3D NULL) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "unable to ope=
n '%s'\n", filename);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (fstat(fileno(fp), &stat_buf)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "couldn't get =
size of file\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
>
> stdin is not the only possibility for something that's not stat()able.
>
> You shouldn't use stat() at all to get the size, but either just
> read() until EOF, or read the header first and use the size in there.
>
> Wait.. I already wrote this function.. look at load_blob() in
> tests/testutils.c. =A0Why don't you give it a cleaner name, rather than
> rewriting it badly.

Thanks for the pointer to the existing code. It looks very similar
except for my use of stat and its use of xmalloc() and CONFIG. Also I
note that it uses open() rather than fopen(). I will need to move it
to the library and change it a bit.

It uses this macro to display errors:

#define CONFIG(fmt, ...)				\
	do {						\
		cleanup();				\
		printf("Bad configuration: " fmt "\n", ##__VA_ARGS__);	\
		exit(RC_CONFIG);			\
	} while (0)

Given that I am trying to write a general utility function I would
prefer not to bomb out in a low-level function, but to return an error
result.

So are you ok with the error message bring different in this case (not
printing 'Bad configuration' before the error, and going out on
stderr)? Then I can make all the test code call this function in
libfdt.

[snip]
> [snip]
>> +/**
>> + * Decode a data type string.
>> + *
>> + * The string consists of:
>> + * =A0 One optional character (s=3Dstring, i=3Dint, u=3Dunsigned b=3Dby=
te)
>> + * =A0 Optional format character (x=3Dhex)
>> + *
>> + * If either of type or format is not found, then that variable is not
>> + * updated, and the caller's default will be used.
>
> Yes, but what does the function actually *do*?

I don't follow - are you asking that I make it more specific like
"Decode a data type string as used by fdtget and fdtput to specify the
data type format to use for property values"?

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
