From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v4 1/6] ARM: sunxi: h3/h5: add simplefb nodes
Date: Tue, 02 Jan 2018 16:14:37 +0800
Message-ID: <2823749.lCJ0TQNemj@ice-x220i>
References: <20171230113043.30237-1-icenowy@aosc.io> <20171230113043.30237-2-icenowy@aosc.io> <CAGb2v64V7KYw5W95-E=b=Li13ZFXy7JakK4+Dx1dsrXXSJZ+wg@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB7H6VTJAKGQEJEVJWDI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v64V7KYw5W95-E=b=Li13ZFXy7JakK4+Dx1dsrXXSJZ+wg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2018=E5=B9=B41=E6=9C=882=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C CST =
=E4=B8=8B=E5=8D=884:11:04=EF=BC=8CChen-Yu Tsai =E5=86=99=E9=81=93=EF=BC=9A
> On Sat, Dec 30, 2017 at 7:30 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> > The H3/H5 SoCs have a HDMI output and a TV Composite output.
> >=20
> > Add simplefb nodes for these outputs.
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > ---
> > Changes in v4:
> > - Dropped extra clocks (bus clocks and HDMI DDC clocks), only keep the
> >=20
> >   clocks that are needed to display framebuffer to the monitor.
>=20
> Looks good. I assume you've tested this? It does continue to work
> with the bus and DDC clocks disabled, right?

Yes. This patchset is tested in Orange Pi PC and SoPine w/ Baseboard "Model=
=20
A".

>=20
> Thanks
> ChenYu


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
