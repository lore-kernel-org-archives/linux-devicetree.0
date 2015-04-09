From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/flattree: print memory scan node results in CPU endian
Date: Wed, 08 Apr 2015 20:17:23 -0700
Message-ID: <5525EF43.1040309@gmail.com>
References: <1428475450-12072-1-git-send-email-f.fainelli@gmail.com> <55259B4D.2020304@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55259B4D.2020304-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 08/04/2015 14:19, Frank Rowand a =C3=A9crit :
> On 4/7/2015 11:44 PM, Florian Fainelli wrote:
>> Commit 51975db0b7333 ("of/flattree: merge early_init_dt_scan_memory(=
)
>> common code") consolidated some code from PowerPC (typically
>> big-endian), and ended-up adding a pr_debug() printing reg propertie=
s in
>> big-endian (DT native) format, not CPU endian. Unsurprisingly, when
>> these messages are turned on a little-endian systems, this is confus=
ing,
>> so do the conversion while printing the values.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/of/fdt.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index 3a896c9aeb74..0d8f0e4bd107 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -880,7 +880,8 @@ int __init early_init_dt_scan_memory(unsigned lo=
ng node, const char *uname,
>>  	endp =3D reg + (l / sizeof(__be32));
>> =20
>>  	pr_debug("memory scan node %s, reg size %d, data: %x %x %x %x,\n",
>> -	    uname, l, reg[0], reg[1], reg[2], reg[3]);
>> +	    uname, l, be32_to_cpu(reg[0]), be32_to_cpu(reg[1]),
>> +	    be32_to_cpu(reg[2]), be32_to_cpu(reg[3]));
>=20
> The pr_debug() assumes that the length of reg[] is >=3D 4 elements, w=
hich might not be true.
> Since the following while loop checks the length of reg[] and then us=
es pr_debug() to
> print each (base, size) tuple with the correct endian, maybe it would=
 be better to
> just remove reg[0] through reg[3] from the above pr_debug() instead o=
f fixing the
> endian issue.

Right, that works too, will follow-up with a patch removing the
reg[0..3] prints.

Thanks!
--
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
