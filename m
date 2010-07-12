From: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] sparc: move is_root_node from private header to of.h
Date: Mon, 12 Jul 2010 16:28:59 +0000 (UTC)
Message-ID: <20100713200541.0dc8d0be__12633.5106011995$1278952139$gmane$org@debxo>
References: <20100713094226.33b421dd@debxo>
	<AANLkTinVpBjQQa93DZ17ULQdspDByGV8h037bVJ2qxGC@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Date: Tue, 13 Jul 2010 20:05:41 +0000
In-Reply-To: <AANLkTinVpBjQQa93DZ17ULQdspDByGV8h037bVJ2qxGC-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 12 Jul 2010 09:53:04 -0600
Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:

> On Tue, Jul 13, 2010 at 3:42 AM, Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
> wrote:
> >
> > Make is_root_node available for all archs to use, as it's not
> > PROM-specific. Also rename it to of_is_root_node, and a few other
> > minor changes for style/consistency.
> >
> > Signed-off-by: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
> > ---
> > =A0arch/sparc/kernel/prom.h =A0 =A0 =A0 =A0| =A0 =A08 --------
> > =A0arch/sparc/kernel/prom_64.c =A0 =A0 | =A0 =A06 +++---
> > =A0arch/sparc/kernel/prom_common.c | =A0 =A02 +-
> > =A0include/linux/of.h =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A08 ++++++++
> > =A04 files changed, 12 insertions(+), 12 deletions(-)
> [...]
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index a367e19..b38cdf7 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -97,6 +97,14 @@ extern struct device_node *of_node_get(struct
> > device_node *node); extern void of_node_put(struct device_node
> > *node); #endif
> >
> > +static inline bool of_is_root_node(const struct device_node *node)
> > +{
> > + =A0 =A0 =A0 if (!node)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return false;
> > +
> > + =A0 =A0 =A0 return (node->parent =3D=3D NULL);
> > +}
> =

> Are you okay if I shorten this to?
> =

> +static inline bool of_is_root_node(const struct device_node *node)
> +{
> +       return (node && (node->parent =3D=3D NULL));
> +}
> =

> g.

It's fine with me.
