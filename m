From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM64: dts: meson-gxbb: Add GXBB AO Clock and Reset node
Date: Wed, 24 Aug 2016 16:09:10 -0700
Message-ID: <147208015014.66208.14165603610884470316@resonance>
References: <1471514928-3341-1-git-send-email-narmstrong@baylibre.com>
 <1471514928-3341-4-git-send-email-narmstrong@baylibre.com>
 <7hk2fc76xx.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7hk2fc76xx.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Kevin Hilman (2016-08-19 15:03:06)
> Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:
> =

> > Add the AO clock controller node for the AmLogic GXBB SoC.
> >
> > Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > ---
> =

> Applying this to the amlogic tree, but will need to wait a cycle due to
> include dependencies on the bindings, which are going through the clock
> tree.

FYI, for picked patches, Stephen and I create a stable branch for each
platform. You can pull this into your tree if you want, just let us know
so we'll be sure not to rebase:

git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-meson-gxbb-=
ao

Regards,
Mike

> =

> Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
