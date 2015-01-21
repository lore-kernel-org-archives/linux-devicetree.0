From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Wed, 21 Jan 2015 17:59:28 +0000
Message-ID: <yw1xppa8c8vz.fsf@unicorn.mansr.com>
References: <1421859974-24507-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1421861843.10574.23.camel@perches.com>
	<D84576D1-27F5-44F9-83DA-347C26F593FE@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D84576D1-27F5-44F9-83DA-347C26F593FE-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
	(Pantelis Antoniou's message of "Wed, 21 Jan 2015 19:39:44 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> writes:

> Hi Joe,
>
>> On Jan 21, 2015, at 19:37 , Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
>>=20
>> On Wed, 2015-01-21 at 19:06 +0200, Pantelis Antoniou wrote:
>>> 90% of the usage of device node's full_name is printing it out
>>> in a kernel message. Preparing for the eventual delayed allocation
>>> introduce a custom printk format specifier that is both more
>>> compact and more pleasant to the eye.
>>>=20
>>> For instance typical use is:
>>> 	pr_info("Frobbing node %s\n", node->full_name);
>>>=20
>>> Which can be written now as:
>>> 	pr_info("Frobbing node %pO\n", node);
>>=20
>> Still disliking use of %p0.
>>=20
>
> Choices are limited. And it=E2=80=99s pO not p0.

O as in OF.  Makes sense.

--=20
M=C3=A5ns Rullg=C3=A5rd
mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
