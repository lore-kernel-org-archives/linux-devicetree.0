From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: Re: [PATCH v2 14/16] arm: dts: sun8i: h3: enable H3
 sid controller
Date: Wed, 25 Jul 2018 11:12:47 +0200
Message-ID: <29a3dfaf8df43498a3886a49ce91db583707689e.camel@paulk.fr>
References: <20180128232919.12639-1-embed3d@gmail.com>
	 <20180128232919.12639-15-embed3d@gmail.com>
	 <20180129095200.attg7cgvpifpchtn@flea.lan>
	 <470ec61e-8b08-5193-ede1-01d02b2c865e@gmail.com>
	 <CACNAnaGVSbk7czb+mcGTx1C=YwCWe1qqHQDQe9+PNifwEXovMw@mail.gmail.com>
	 <F1D7126A-B6ED-4A83-A941-5F39CED472CE@aosc.io>
	 <CACNAnaFMKDmvAUXJngKHWkeGLfjsgn5hhJszNk7Sg4BU98Oafw@mail.gmail.com>
	 <0ab29bf0-b069-338e-f312-e533656fa0b6@gmail.com>
	 <39b1eef01c2ed32f09ef30439c4f4297de009898.camel@paulk.fr>
	 <20180725110512.b6fb81be76f66b07942e5af0@bidouilliste.com>
Reply-To: contact-W9ppeneeCTY@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBC75HK6WUAEBBK764DNAKGQEGQ2GHVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180725110512.b6fb81be76f66b07942e5af0-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Cc: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, icenowy-h8G6r0blFSE@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, sean-hENCXIMQXOg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, 2018-07-25 at 11:05 +0200, Emmanuel Vadot wrote:

[...]

>  Hello Paul,
> 
>  I've sent a serie yesterday for SID on A64/H3/H5.
>  https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=761

Awesome, thanks for taking care of that :)

Cheers,

Paul

> > > On 19.04.2018 17:19, Kyle Evans wrote:
> > > > On Thu, Apr 19, 2018 at 10:13 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> > > > > 
> > > > > 
> > > > > ? 2018?4?19? GMT+08:00 ??11:11:22, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> ??:
> > > > > > On Mon, Jan 29, 2018 at 6:03 AM, Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > > > wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 29.01.2018 10:52, Maxime Ripard wrote:
> > > > > > > > 
> > > > > > > > On Mon, Jan 29, 2018 at 12:29:17AM +0100, Philipp Rossak wrote:
> > > > > > > > > 
> > > > > > > > > This patch enables the the sid controller in the H3. It can be used
> > > > > > > > > for thermal calibration data.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > > > > > > ---
> > > > > > > > >    arch/arm/boot/dts/sun8i-h3.dtsi | 7 +++++++
> > > > > > > > >    1 file changed, 7 insertions(+)
> > > > > > > > > 
> > > > > > > > > diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi
> > > > > > > > > b/arch/arm/boot/dts/sun8i-h3.dtsi
> > > > > > > > > index 3f83f6a27c74..9bb5cc29fec5 100644
> > > > > > > > > --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> > > > > > > > > +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> > > > > > > > > @@ -72,6 +72,13 @@
> > > > > > > > >                  };
> > > > > > > > >          };
> > > > > > > > >    +     soc {
> > > > > > > > > +               sid: eeprom@1c14000 {
> > > > > > > > > +                       compatible = "allwinner,sun8i-h3-sid";
> > > > > > > > > +                       reg = <0x01c14000 0x400>;
> > > > > > > > > +               };
> > > > > > > > > +       };
> > > > > > > > > +
> > > > > > > > 
> > > > > > > > 
> > > > > > > > Shouldn't you also use a nvmem-cells property to the THS node?
> > > > > > > > 
> > > > > > > > Maxime
> > > > > > > > 
> > > > > > > 
> > > > > > > Oh seems like I forgot that.
> > > > > > > As related to the wiki [1] this should be 64 bit wide at the address
> > > > > > 
> > > > > > 0x34. I
> > > > > > > will add that in the next version.
> > > > > > > 
> > > > > > > 
> > > > > > > [1]: http://linux-sunxi.org/SID_Register_Guide#eFUSE
> > > > > > > 
> > > > > > > Thanks,
> > > > > > > Philipp
> > > > > > > 
> > > > > > 
> > > > > > Hi,
> > > > > > 
> > > > > > Any chance this will see a v3 soon? I'm kind of interested in sid node
> > > > > > for h3. =)
> > > > > 
> > > > > This patch is independent and can be easily sent out
> > > > > by its own.
> > > > > 
> > > > 
> > > > Right- I had considered doing so, but wanted to make sure I wasn't
> > > > going to collide with this series if a v3 is imminent.
> > > > 
> > > 
> > > 
> > 
> > -- 
> > Developer of free digital technology and hardware support.
> > 
> > Website: https://www.paulk.fr/
> > Coding blog: https://code.paulk.fr/
> > Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
> 
> 
-- 
Developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
