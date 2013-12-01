From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V5] kbuild: dtbs_install: new make target
Date: Sun, 1 Dec 2013 18:40:03 -0500
Message-ID: <20131201234003.GF2879@titan.lakedaemon.net>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
 <1385062552-9882-1-git-send-email-jason@lakedaemon.net>
 <653B066B-5B24-4817-86EF-D4D9F129123D@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <653B066B-5B24-4817-86EF-D4D9F129123D-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Kumar,

On Thu, Nov 21, 2013 at 05:31:49PM -0600, Kumar Gala wrote:
> On Nov 21, 2013, at 1:35 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrot=
e:
=2E..
> > #
> > +# INSTALL_DTBS_PATH specifies a prefix for relocations required by=
 build roots.
> > +# Like INSTALL_MOD_PATH, it isn't defined in the Makefile, but can=
 be passed as
> > +# an argument if needed.
> > +#
>=20
> Nit, do we want to match INSTALL_MOD_PATH and drop the =E2=80=99S=E2=80=
=99 for INSTALL_DTB_PATH?

I thought about this, and I prefer to keep the S.  Installing one
module sounds silly, while installing one dtb implies we are doing
something we aren't.  Namely selecting the correct dtb.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
