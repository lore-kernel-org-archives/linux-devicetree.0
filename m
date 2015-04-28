From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] misc: ti-st: use GPIO_LOW for initial value of
 nshutdown
Date: Tue, 28 Apr 2015 18:56:20 +0100
Message-ID: <20150428175620.GF9169@x1>
References: <1430000118-26386-1-git-send-email-eric.nelson@boundarydevices.com>
 <20150428111745.GR11956@x1>
 <553FB848.4090802@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <553FB848.4090802-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, der.herr-kA1LtwSENNE@public.gmane.org, bvijay-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, gigi.joseph-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eyalr-l0cyMroinI0@public.gmane.org, robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 28 Apr 2015, Eric Nelson wrote:
> On 04/28/2015 04:17 AM, Lee Jones wrote:
> > On Sat, 25 Apr 2015, Eric Nelson wrote:
> >=20
> >> All other uses of the nshutdown gpio use macros GPIO_LOW and
> >> GPIO_HIGH to allow changing the pin polarity.
> >>
> >> Do this in gpio_direction_output as well.
> >>
> >> Signed-off-by: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
> >> ---
> >>  drivers/misc/ti-st/st_kim.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > Where your cover-letter?
> >=20
>=20
> /dev/null (I didn't create one).

It's good practice to send cover letters attached to patch-sets.  It
gives a basic overview of what the set is trying to achieve, a nice
succinct centralised change-log and a diff-stat for the entire set.
All very handy information for a Maintainer/reviewer and is likely to
speed-up acceptance times.

> > Why did you even sent me this set?
> >=20
> get_maintainer.pl told me to...
>=20
> 	Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> (commit_signer:2/5=3D40%,authored:2/5=3D40%,added_lines:2/12=3D17%,re=
moved_lines:2/11=3D18%)

I'd Cc "commit signers" with extreme caution to be honest.  As a rule
I never add them, unless they are the author of, or have made vast
changes to the file you're modifying.

I guess get_maintainer.pl is relating to change e4ebe5f where I was
fixing some Coverity reports.  Bottom line is, I shouldn't be in
receipt of this patch-set.  It's just clogging up my already very
clogged-up inbox.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
