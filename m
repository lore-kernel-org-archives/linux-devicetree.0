From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: RFC: Host-endian device tree format
Date: Wed, 19 Jan 2011 06:41:15 -0700
Message-ID: <AANLkTikoZj1WSpE8QNSRiF3oFL4qAb68kNnCKdExvBz7@mail.gmail.com>
References: <AANLkTi=AdwaW5vvm1TzNxcNrjYiJ3dOEjwoZrm-koxuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1318084636871517994=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTi=AdwaW5vvm1TzNxcNrjYiJ3dOEjwoZrm-koxuw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============1318084636871517994==
Content-Type: multipart/alternative; boundary=000325575956c95f7b049a332bae

--000325575956c95f7b049a332bae
Content-Type: text/plain; charset=ISO-8859-1

On Jan 19, 2011 3:43 AM, "Dave Martin" <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> Hi all,
>
> Apologies if this has been discussed before--- I don't see an obvious
> rebuttal in my quick searching past threads, so I'll just quickly ask
> the question:
>
> Could we use host-endianness for the device tree binary blob?

Hi David.

This has been discussed thoroughly and rejected. The dtb isn't so much
bigendian as it is network byte order. While we /could/ switch it for arm,
it creates all kinds of problems with tools and working with .dtb files on
dissimilar platforms.  Plus all the property values must remain in BE
because all the bindings are already defined that way in the OpenFirmware
specifications.

Besides, there is no real advantage to changing it: it already works as-is
on le architectures.  :-)

g.

>
> The fdt binary format seems to lend itself strongly to a host-endian
> format: it begins with a word-sized magic number, and when parsing the
> device tree every elements type and size is known before that element
> is read; furthermore, every element is size-aligned.  Therefore, I
> (naively?) presume that a little-endian format should "just work",
> simply by flipping the endianness of every element and discarding all
> the __be32_to_cpu() type stuff when reading the fdt at boot time.  The
> magic number ensures that there's no risk of accidentally reading the
> fst in the wrong byte order.
>
> Although it would be necessary to augment the fdt tools to cope with
> this, offline tools appear to be the right place to put this
> intelligence.  For the kernel to flip the byte order of everything in
> the fdt blob every time the system boots just seems unnecessary when
> the required endianness is statically known.
>
> Since fdt is new on ARM we have an opportunity to change determine the
> binary format now without breaking anything in the field -- we don't
> necessarily have to adopt the host-endian format on any other
> architectures if it's not desirable.
>
> Any thoughts?
>
> Cheers
> ---Dave
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--000325575956c95f7b049a332bae
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Jan 19, 2011 3:43 AM, &quot;Dave Martin&quot; &lt;<a href=3D"mailto:dave=
.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt; Apologies if this has been discussed before--- I don&#39;t see an obvi=
ous<br>
&gt; rebuttal in my quick searching past threads, so I&#39;ll just quickly =
ask<br>
&gt; the question:<br>
&gt;<br>
&gt; Could we use host-endianness for the device tree binary blob?</p>
<p>Hi David.</p>
<p>This has been discussed thoroughly and rejected. The dtb isn&#39;t so mu=
ch bigendian as it is network byte order. While we /could/ switch it for ar=
m, it creates all kinds of problems with tools and working with .dtb files =
on dissimilar platforms.=A0 Plus all the property values must remain in BE =
because all the bindings are already defined that way in the OpenFirmware s=
pecifications.</p>

<p>Besides, there is no real advantage to changing it: it already works as-=
is on le architectures.=A0 :-)</p>
<p>g.</p>
<p>&gt;<br>
&gt; The fdt binary format seems to lend itself strongly to a host-endian<b=
r>
&gt; format: it begins with a word-sized magic number, and when parsing the=
<br>
&gt; device tree every elements type and size is known before that element<=
br>
&gt; is read; furthermore, every element is size-aligned. =A0Therefore, I<b=
r>
&gt; (naively?) presume that a little-endian format should &quot;just work&=
quot;,<br>
&gt; simply by flipping the endianness of every element and discarding all<=
br>
&gt; the __be32_to_cpu() type stuff when reading the fdt at boot time. =A0T=
he<br>
&gt; magic number ensures that there&#39;s no risk of accidentally reading =
the<br>
&gt; fst in the wrong byte order.<br>
&gt;<br>
&gt; Although it would be necessary to augment the fdt tools to cope with<b=
r>
&gt; this, offline tools appear to be the right place to put this<br>
&gt; intelligence. =A0For the kernel to flip the byte order of everything i=
n<br>
&gt; the fdt blob every time the system boots just seems unnecessary when<b=
r>
&gt; the required endianness is statically known.<br>
&gt;<br>
&gt; Since fdt is new on ARM we have an opportunity to change determine the=
<br>
&gt; binary format now without breaking anything in the field -- we don&#39=
;t<br>
&gt; necessarily have to adopt the host-endian format on any other<br>
&gt; architectures if it&#39;s not desirable.<br>
&gt;<br>
&gt; Any thoughts?<br>
&gt;<br>
&gt; Cheers<br>
&gt; ---Dave<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; linux-arm-kernel mailing list<br>
&gt; <a href=3D"mailto:linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org">linux-arm-kern=
el-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org</a><br>
&gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l">http://lists.infradead.org/mailman/listinfo/linux-arm-kernel</a><br>
</p>

--000325575956c95f7b049a332bae--

--===============1318084636871517994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1318084636871517994==--
