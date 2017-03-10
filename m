From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 07/39] ARM: dts: imx6qdl-sabrelite: remove erratum
 ERR006687 workaround
Date: Fri, 10 Mar 2017 19:05:02 -0300
Message-ID: <CAOMZO5DjiJGXXOg2sw79=sO6zvP7iO634AE1Zds=tuWe7jWadg@mail.gmail.com>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <1489121599-23206-8-git-send-email-steve_longerbeam@mentor.com>
 <9f5d0ac4-0602-c729-5c00-1d9ef49247c1@boundarydevices.com>
 <CAOMZO5BNrSEyrbWbCBCbsy4yTrh4AHfk2Too0qHuffxqUCgADg@mail.gmail.com> <20170310215731.GB6540@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170310215731.GB6540@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Troy Kisky <troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Nick Dyer <nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org>, markus.heiser-m1Uo1GnMJf0b1SvskN2V4Q@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, bparrot-l0cyMroinI0@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jean-Christophe
List-Id: devicetree@vger.kernel.org

On Fri, Mar 10, 2017 at 6:57 PM, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> wrote:

> And it should not depend on configuration. Hardware vendor should be
> able to ship board with working device tree...

We are talking about pin conflict here. Please read the commit log of
this patch for details.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
