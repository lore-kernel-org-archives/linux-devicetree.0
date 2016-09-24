From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v3 0/4] regulator: axp20x: support
 AXP803/AXP813 variants
Date: Sat, 24 Sep 2016 11:11:27 +0200
Message-ID: <20160924111127.942fa9c65db71fa58cf07f18@free.fr>
References: <cover.1474621107.git.moinejf@free.fr>
	<CAGb2v65LjjB_vM46yurKOcw6mMaxW3pXTHwbxQO6L1BTOnTUmw@mail.gmail.com>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBA4MTG7QKGQEWPJY72A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v65LjjB_vM46yurKOcw6mMaxW3pXTHwbxQO6L1BTOnTUmw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 24 Sep 2016 16:35:05 +0800
Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:

> On Fri, Sep 23, 2016 at 4:58 PM, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org> wr=
ote:
> > This patch series adds support for the X-Powers AXP803 and AXP813 PMICs=
.
> > It is based on the previous patch series
> >         regulator: axp20x: Simplify various code
> >
> > v3:
> > - put the code of the new devices in new files instead of in the common
> >   axp20x file.
> > - fix errors about the regulators and interrupts
> > v2:
> > - fix lack of support of dcdc frequency
> > - notice that the AXP803 is also handled
> > - send the patch to the DT maintainers
> >
> > Jean-Francois Moine (4):
> >   regulator: axp20x: move device independant parts to new files
> >   regulator: axp20x: duplicate the MFD axp20x-rsb code
> >   regulator: axp20x: add the AXP803
> >   regulator: axp20x: add the AXP813
>=20
> NAK. Please follow the axp20x mfd and sub-device driver design we
> already have.

Sorry, I will not: installing a lot of useless code and tables in
permanent system memory for just one regulator is not the way I think
about a good kernel.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
