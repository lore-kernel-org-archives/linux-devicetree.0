From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Tue, 31 Mar 2015 21:52:31 -0700
Message-ID: <20150401045231.70614C4082F@trevor.secretlab.ca>
References: <1421859974-24507-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1421861843.10574.23.camel@perches.com>
	<7EBFDD59-156A-42FB-AAF0-CE4A88219794@antoniou-consulting.com>
	<20150330190432.42192C40A67@trevor.secretlab.ca>
	<8421E7C5-C0D9-4C86-AA37-F6507B3BCC57@konsulko.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8421E7C5-C0D9-4C86-AA37-F6507B3BCC57-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 31 Mar 2015 13:03:05 +0300
, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
 wrote:
> > +Device tree nodes:
> > +
> > +	%pOn[fnpPcCFr]
> > +
> > +	For printing device tree nodes. The optional arguments are:
> > +	    f device node full_name
> > +	    n device node name
> > +	    p device node phandle
> > +	    P device node path spec (name + @unit)
> > +	    F device node flags
> > +	    c major compatible string
> > +	    C full compatible string
> > +	Without any arguments prints full_name (same as %pOnf)
> > +	The separator when using multiple arguments is =E2=80=98:=E2=80=99
> ^ separator is =E2=80=98.'
> > +
>=20
> > +	Examples:
> > +
> > +	%pOn	/foo/bar@0			- Node full name
> > +	%pOnf	/foo/bar@0			- Same as above
> > +	%pOnfp	/foo/bar@0:10			- Node full name + phandle
> > +	%pOnfcF	/foo/bar@0:foo,device:--P-	- Node full name +
> > +	                                          major compatible string=
 +
> > +						  node flags
> > +							D - dynamic
> > +							d - detached
> > +							P - Populated
> > +							B - Populated bus
> > +

Thinking about this more, I'd like to suggest a different format that
gives us a nice hack on the name that makes it easy to remember:
	'%pOF[...]'
'O' still means 'object', but it is also overloaded for Open Firmware.
That still leaves %pO? for other object types.  What do you think?

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
