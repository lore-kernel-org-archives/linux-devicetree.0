From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 2/3] arm/dt: add very basic dts file for babbage board
Date: Mon, 28 Feb 2011 22:32:01 +0800
Message-ID: <20110228143159.GA3688@S2100-06.ap.freescale.net>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
	<1298016730-22761-3-git-send-email-r64343@freescale.com>
	<AANLkTikerADxGGRfnumWMN+s2r8gWOb1UAaS3tQ6DTe5@mail.gmail.com>
	<AANLkTi=kxbzDCJqOnPNjCsNxMsLtcbbcGLfZbY05_Svh@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=kxbzDCJqOnPNjCsNxMsLtcbbcGLfZbY05_Svh-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Mon, Feb 21, 2011 at 10:10:24AM -0700, Grant Likely wrote:
> On Mon, Feb 21, 2011 at 2:46 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
[...]
> >> + =A0 =A0 =A0 clocks {

Do we already have a clock binding specification, which is followed
by this example?  Or the properties given here still can be discussed
and open to change?

Also to support dynamically creating and registering 'struct clk' per
dt clock nodes, I need to add a few properties to map stuff like
parent 'struct clk', con_id of 'struct clk_lookup'.  Is there any
specification to follow, or I can draft it per the needs of my work?

> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> >> +
> >
> > Can we use hex value here to keep the consistency throughout the file?
> =

> For #address-cells and #size-cells use decimal integers.
> =

> >
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_clk0: uart@0 {
> =

> @0 should only be specified if the node has a 'reg =3D <0>' property.
> In this case it doesn't so either 'reg' should be added, or '@0'
> should be removed.
> =

> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-u=
art.0";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_clk1: uart@1{
> >
> > Can we put a space before "{" to keep the consistency throughout the fi=
le?
> =

> Yes, please.
> =

> >
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-u=
art.1";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_clk2: uart@2{
> >
> > ditto
> >
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-u=
art.2";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };

-- =

Regards,
Shawn
