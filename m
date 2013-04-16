From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] Add fdtgrep to grep and subset FDTs
Date: Mon, 15 Apr 2013 22:37:11 -0400
Message-ID: <201304152237.13011.vapier@gentoo.org>
References: <1360968578-18443-1-git-send-email-sjg@chromium.org>
 <1360968578-18443-3-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1549343907608043962=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1360968578-18443-3-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============1549343907608043962==
Content-Type: multipart/signed;
  boundary="nextPart1534670.ZjyTj0S1Y5";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1534670.ZjyTj0S1Y5
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday 15 February 2013 17:49:37 Simon Glass wrote:
> --- /dev/null
> +++ b/fdtgrep.c

hopefully my patchset gets merged soon in which case you should rebase on t=
op=20
of it to use the new common getopts code

> +/* Define DEBUG to get some debugging output on stderr */
> +#ifdef DEBUG
> +#define debug(a, b...) fprintf(stderr, a, ## b)
> +#else
> +#define debug(a, b...)
> +#endif

shouldn't this be in util.h ?  seems to be copied from dtc.h ...

> +static void report_error(const char *where, int err)
> +{
> +	fprintf(stderr, "Error at '%s': %s\n", where, fdt_strerror(err));
> +}

report_error should probably get pulled out of fdt{get,put}.c and this file=
 and=20
put into util.h.  it already has a bunch of helpers like die().

> +	str =3D strdup(str);

xstrdup()

> +	node =3D malloc(sizeof(*node));

xmalloc()

> +	if (!str || !node) {
> +		fprintf(stderr, "Out of memory\n");
> +		return -1;
> +	}

then you don't need this

> +static int do_fdtgrep(struct display_info *disp, const char *filename)
> +{
> +	struct fdt_region *region;
> +	int max_regions;
> +	int count =3D 100;
> +	char path[1024];

isn't there a constant somewhere to use rather than 1024 ?

> +		region =3D malloc(count * sizeof(struct fdt_region));
> +		if (!region) {
> +			fprintf(stderr, "Out of memory for %d regions\n",
> +				count);
> +			return -1;
> +		}

xmalloc(), then you can drop the error checking

> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
>
> +    if [ -z "$nodename" ]; then
> +	nodename=3Dtesting
> +    fi
> +    if [ -z "$base" ]; then
> +	base=3D$($DTGREP ${args} -O bin $tree | sha1sum)
> +    fi

you could one line these sort of defaults:
	: ${nodename:=3Dtesting}
	: ${base:=3D$($DTGREP ${args} -O bin $tree | sha1sum)}

> +    if [ "$base" =3D=3D "$hash" ]; then
> +	if [ "$changed" =3D=3D 1 ]; then

this is not valid POSIX shell.  you have to use "=3D".  you should update t=
he=20
other parts of your patch too

> +    lines=3D$($@ | wc -l)

you should quote that:
	lines=3D$("$@" | wc -l)

> +    bytes=3D$($@ | wc -c)

same here

> +    if $@ | grep -q $text; then

same here.  and you should probably quote that $text:
	if "$@" | grep -q "$text"; then

> +    tmp=3D/tmp/tests.$$

probably better to do:
	tmp=3D$(mktemp)

> +    addr=3D$($DTGREP -a $dtb | head -1 | tr -d : | awk '{print $1}')

you could do:
	addr=3D$($DTGREP -a $dtb | tr -d : | awk '{print $1; exit}')

> +    addr=3D$($DTGREP -a $dtb | tail -1 | tr -d : | awk '{print $1}')

same here

> +    last=3D$(printf "%#x" $(($dt_start + $dt_size - 8)))

for $((...)) operations, you don't need to expand the var yourself:
	last=3D$(printf "%#x" $((dt_start + dt_size - 8)))
seems to show up a few times in this patch

> +    cat >$tmp <<END
> +	#address-cells
> +	airline
> +	bootargs
> +	compatible
> +	linux,platform
> +	model
> +	#size-cells
> +	status
> +	weather
> +END

if you use - with the heredoc marker, you can indent the contents with tabs:
	cat >$tmp <<-END
	foo
	bar
	mew
	END

> +    lines=3D$(cat $tmp | wc -l)

avoid the cat/pipe:
	lines=3D$(wc -l < $tmp)

> +    lines=3D$(grep "=3D" $dts |wc -l)

needs a space after the pipe:
	lines=3D$(grep "=3D" $dts | wc -l)

> +    base=3D$(stat -c %s $dtb)

this isn't portable.  do this instead:
	base=3D$(wc -c < $dtb)

> +    rm -f $tmp

so failures in this test leaks the tmp file ?  should add a `trap` to rm it=
=20
upon exit.
=2Dmike

--nextPart1534670.ZjyTj0S1Y5
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRbLlYAAoJEEFjO5/oN/WBowIP/3lG4wV+K4Sxg7KFR44k4bSt
FS3QsCO7eE7Xu5hwatk2LyInRUqMz6QkGQ8nCl0VgmK3kDLiLS3YFfqqkDJidISN
yv1xYVluadZysqrou3vnx/H8cybW2Bsnetw2+YEGH/hN+nQFZ0DJpH8UxUmd8lIW
hy4eeb5YlJbLrEenKLmPCIjEqQE5hpYzhT9pR2ccGQRf+8vyfplpt2ShVbooCrhz
Pt7sQEufGBLNfNajwxjBpLrp3hXEcYVAyBPCtMLJF92cliGRleyR9SZYkXsVnJt9
ZLZH31BU+usL0e91vkSNm8SbRexrs1zzDpI4/vCPb7ckbRDSORdy3rg6pEiLvE0N
GCrBPvVuT4esR1GipgZob8jbgRlK8rjLXruHHUSgGQ0Y7vo1B0ftRJd84l4v46n1
RkPMJUT46UDo9hc7uoje3kE971luMhjhyeidJhczgzkPS2mQq9vlO7aAPKIR9VGs
kioIDySne94T0NSGS7qcTuIzqRvJJGvpvdnssWCjcspFNd/Ii/qW5X/+CxdOdnUD
+95IADn+qWPWRbD24NEBL5BCT/qu6WK4kSCkP51k+dBKHilR9LdJzTZP99W3zlHj
i9UAvpNtMNsdG8aLRoa+zNn20EEn6ZVk79PGLbos1c2wM6toDU99ljZ9HePL6gDH
ShosVXpxa260zLLP7VrE
=nTIu
-----END PGP SIGNATURE-----

--nextPart1534670.ZjyTj0S1Y5--

--===============1549343907608043962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1549343907608043962==--
