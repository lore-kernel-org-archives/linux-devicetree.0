From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/3] arm/dt: add very basic dts file for babbage board
Date: Wed, 23 Feb 2011 11:59:57 -0700
Message-ID: <20110223185957.GP14597@angua.secretlab.ca>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
	<1298016730-22761-3-git-send-email-r64343@freescale.com>
	<AANLkTikerADxGGRfnumWMN+s2r8gWOb1UAaS3tQ6DTe5@mail.gmail.com>
	<AANLkTi=kxbzDCJqOnPNjCsNxMsLtcbbcGLfZbY05_Svh@mail.gmail.com>
	<20110222141309.GH19871@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110222141309.GH19871-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 22, 2011 at 10:13:10PM +0800, Shawn Guo wrote:
> Hi Grant,
> =

> Thanks for the explanation in details.
> =

> One more minor doubt below ...
> =

> On Mon, Feb 21, 2011 at 10:10:24AM -0700, Grant Likely wrote:
> > On Mon, Feb 21, 2011 at 2:46 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> [...]
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> > >> + =A0 =A0 =A0 };
> > >> +
> > >> + =A0 =A0 =A0 clocks {
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> > >> +
> > >
> > > Can we use hex value here to keep the consistency throughout the file?
> > =

> > For #address-cells and #size-cells use decimal integers.
> > =

> If I run 'dtc -I dts -O dts -o babbage-dtc.dts babbage.dts', I see
> babbage-dtc.dts have these two decimal values written into the hex.

Property values don't have any inherent type checking.  Once it is in
internal form, dtc has no way of knowing the preferred representation
and it just makes a guess.

When it comes to maintaining .dts files; humans like looking at
decimal numbers, so we use decimal for #address/#size-cells.

g.
