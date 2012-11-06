From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH Resend V2] dt: add helper function to read u8 & u16
	variables & arrays
Date: Tue, 6 Nov 2012 20:09:04 +0530
Message-ID: <CAKohpok4N6M+kqVZf9aP6RjAJ12skXpfta0c+Aas7xa1_0S8Fw@mail.gmail.com>
References: <64c5278ebdec503f83e9b7002bf13affb7f3260f.1351225085.git.viresh.kumar@linaro.org>
	<50991C41.50705@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1608845921597803060=="
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <50991C41.50705-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============1608845921597803060==
Content-Type: multipart/alternative; boundary=e89a8f646a114ede5504cdd490d1

--e89a8f646a114ede5504cdd490d1
Content-Type: text/plain; charset=ISO-8859-1

On 6 November 2012 19:48, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> > diff --git a/drivers/of/base.c b/drivers/of/base.c
>


> > +#define of_property_read_array(_np, _pname, _out, _sz)
>       \
> > +     struct property *_prop = of_find_property(_np, _pname, NULL);   \
> > +     const __be32 *_val;                                             \
> > +                                                                     \
> > +     if (!_prop)                                                     \
> > +             return -EINVAL;                                         \
> > +     if (!_prop->value)                                              \
> > +             return -ENODATA;                                        \
> > +     if ((_sz * sizeof(*_out)) > _prop->length)                      \
> > +             return -EOVERFLOW;                                      \
> > +                                                                     \
> > +     _val = _prop->value;                                            \
> > +     while (_sz--)                                                   \
> > +             *_out++ = (typeof(*_out))be32_to_cpup(_val++);          \
>
> This will not work. You are incrementing _out by 1, 2, or 4 bytes, but
> _val is always incremented by 4 bytes.
>
> According to the dtc commit adding this feature, the values are packed:
>
> With this patch the following property assignment:
>
>     property = /bits/ 16 <0x1234 0x5678 0x0 0xffff>;
>
> is equivalent to:
>
>     property = <0x12345678 0x0000ffff>;
>

Something which i haven't expected :(
I will fix and test it well for all types before sending it now.


> > +/**
> > + * of_property_read_u8_array - Find and read an array of u8 from a
> property.
> > + *
> > + * @np:              device node from which the property value is to be
> read.
> > + * @propname:        name of the property to be searched.
> > + * @out_value:       pointer to return value, modified only if return
> value is 0.
> > + *
>
> Missing sz
>

Yes for both misses.

--e89a8f646a114ede5504cdd490d1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 6 November 2012 19:48, Rob Herring <span dir=3D"ltr">&lt;<a href=3D"mail=
to:robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</=
span> wrote:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">&gt; diff --git a/drivers/of/base.c=
 b/drivers/of/base.c<br></div></div></blockquote><div>=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">&gt; +#define of_property_read_arra=
y(_np, _pname, _out, _sz) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \<br>
&gt; + =A0 =A0 struct property *_prop =3D of_find_property(_np, _pname, NUL=
L); =A0 \<br>
&gt; + =A0 =A0 const __be32 *_val; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \<br>
&gt; + =A0 =A0 if (!_prop) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \<br>
&gt; + =A0 =A0 if (!_prop-&gt;value) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 return -ENODATA; =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br>
&gt; + =A0 =A0 if ((_sz * sizeof(*_out)) &gt; _prop-&gt;length) =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 return -EOVERFLOW; =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \<br>
&gt; + =A0 =A0 _val =3D _prop-&gt;value; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br>
&gt; + =A0 =A0 while (_sz--) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 *_out++ =3D (typeof(*_out))be32_to_cpup(_val=
++); =A0 =A0 =A0 =A0 =A0\<br>
<br>
</div></div>This will not work. You are incrementing _out by 1, 2, or 4 byt=
es, but<br>
_val is always incremented by 4 bytes.<br>
<br>
According to the dtc commit adding this feature, the values are packed:<br>
<br>
With this patch the following property assignment:<br>
<br>
=A0 =A0 property =3D /bits/ 16 &lt;0x1234 0x5678 0x0 0xffff&gt;;<br>
<br>
is equivalent to:<br>
<br>
=A0 =A0 property =3D &lt;0x12345678 0x0000ffff&gt;;<br></blockquote><div><b=
r></div><div>Something which i haven&#39;t expected :(</div><div>I will fix=
 and test it well for all types before sending it now.</div><div>=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">

<div class=3D"im">&gt; +/**<br>
&gt; + * of_property_read_u8_array - Find and read an array of u8 from a pr=
operty.<br>
&gt; + *<br>
&gt; + * @np: =A0 =A0 =A0 =A0 =A0 =A0 =A0device node from which the propert=
y value is to be read.<br>
&gt; + * @propname: =A0 =A0 =A0 =A0name of the property to be searched.<br>
&gt; + * @out_value: =A0 =A0 =A0 pointer to return value, modified only if =
return value is 0.<br>
&gt; + *<br>
<br>
</div>Missing sz<br>
<div class=3D"im"></div></blockquote></div><br><div>Yes for both misses.</d=
iv>

--e89a8f646a114ede5504cdd490d1--


--===============1608845921597803060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linaro-dev mailing list
linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
http://lists.linaro.org/mailman/listinfo/linaro-dev

--===============1608845921597803060==--
