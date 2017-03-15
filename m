From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH v2 16/23] MAINTAINERS: Add file patterns for powerpc device tree bindings
Date: Wed, 15 Mar 2017 11:19:45 +1100
Message-ID: <87a88nv1b2.fsf@concordia.ellerman.id.au>
References: <1489324627-19126-1-git-send-email-geert@linux-m68k.org> <1489324627-19126-17-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489324627-19126-17-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, qiang.zhao-3arQi8VN3Tc@public.gmane.org, yangbo.lu-3arQi8VN3Tc@public.gmane.org, york.sun-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> writes:

> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.
>
> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
> Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
> Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> ---
> Please apply this patch directly if you want to be involved in device
> tree binding documentation for your subsystem.
>
> v2:
>   - Rebased on top of commit a42715830d552d7c ("MAINTAINERS: Remove
>     powerpc's "opal" pattern match), which just added "powerpc/opal",
>     while obviously the whole "powerpc" hierarchy is of interest.
>
> Impact on next-20170310:

Actual diff ignoring ordering etc:

 +Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> (supporter:LINUX FOR POWERPC (32-BIT AND 64-BIT))
 +Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org> (supporter:LINUX FOR POWERPC (32-BIT AND 64-BIT))
 +linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT))
 -Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org> (commit_signer:5/11=45%)
 -Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org> (commit_signer:4/11=36%,authored:4/11=36%)
 -Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> (commit_signer:1/11=9%)
 -yangbo lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org> (authored:1/11=9%)
 -"Otto Kekäläinen" <otto-Gh1NM5ZPXYb1KXRcyAk9cg@public.gmane.org> (authored:1/11=9%)
 -Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> (authored:1/11=9%)
 -York Sun <york.sun-3arQi8VN3Tc@public.gmane.org> (authored:1/11=9%)

Which looks bad as all the NXP folks get dropped, but they should be
reading linuxppc-dev. So I think I'll merge this, unless anyone
disagrees.

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
