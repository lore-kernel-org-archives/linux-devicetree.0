From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: DT include files
Date: Sat, 11 Jan 2014 14:15:28 +0100
Message-ID: <201401111415.29395.arnd@arndb.de>
References: <20140103023211.GA25079@S2101-09.ap.freescale.net> <CAOesGMhP5t=QHj7TdDY9Nq+=WHeQXv1V0n9TGmmEnqSG9SaFKg@mail.gmail.com> <20140111031214.GK21717@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140111031214.GK21717-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 11 January 2014, Shawn Guo wrote:
> While I agree such macro usage should be avoided or limited, it really
> helps IMX pinctrl case to improve the readability and make the handwriting
> of these pinctrl entries less error prone.  Isn't it the whole point of
> introducing macro support for DTC?

The macros are useful for all cases where the binding defines an
arbitrary number space, e.g. for the interrupt flags or when a
clock or pin controller provides a set of pins/clocks that don't
already have a number assigned to them. In this case, the header
file can be shared between the dts and kernel source files to ensure
that they are talking about the same things.

However, I don't like to see uses of such macros where the definition
is done to match a hardware constant (bit number, register index, etc),
like in the recently posted eDMA driver case. Here the macro /reduces/
readability of the dts source IMHO, because you cannot easily check
the dts file against the data sheet without cross-referencing the
header file as well.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
