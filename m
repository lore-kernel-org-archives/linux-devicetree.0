From: "Albrecht Dreﬂ" <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Subject: Re: [PATCH/RFC 1/2] 5200: improve i2c bus error recovery
Date: Tue, 16 Feb 2010 21:14:00 +0100 (CET)
Message-ID: <1427337.1266351240290.JavaMail.ngmail@webmail08.arcor-online.net>
References: <20100216194922.GA27811@ovro.caltech.edu>
	<1264191475.2224.1@antares>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100216194922.GA27811-lulEs6mt1IksTUYHLfqkUA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Ira:

[snip]
> I see this exact hang on a MPC8349EA board. I poll my i2c sensors every
> 500ms, and it takes around 12 hours to produce a hang. The usual hang
> has (CF | BB) set, however I have seen a hang with just BB (only once so
> far in about 2 weeks).
> =

> I think the fixup should be run on 8349 as well, if not all processors.
> I'm happy to test patches. I have a way to reliably trigger a lockup,
> using another master on the i2c bus.

See my other post - hopefully a new patch is ready tomorrow/Thursday...

[snip]
> >  static void mpc_i2c_fixup(struct mpc_i2c *i2c)
> >  {
> > -	writeccr(i2c, 0);
> > -	udelay(30);
> > -	writeccr(i2c, CCR_MEN);
> > -	udelay(30);
> > -	writeccr(i2c, CCR_MSTA | CCR_MTX);
> > -	udelay(30);
> > -	writeccr(i2c, CCR_MSTA | CCR_MTX | CCR_MEN);
> > -	udelay(30);
> > -	writeccr(i2c, CCR_MEN);
> > -	udelay(30);
> > +	if (i2c->real_clk =3D=3D 0) {
> > +		writeccr(i2c, 0);
> > +		udelay(30);
> > +		writeccr(i2c, CCR_MEN);
> > +		udelay(30);
> > +		writeccr(i2c, CCR_MSTA | CCR_MTX);
> > +		udelay(30);
> > +		writeccr(i2c, CCR_MSTA | CCR_MTX | CCR_MEN);
> > +		udelay(30);
> > +		writeccr(i2c, CCR_MEN);
> > +		udelay(30);
> > +	} else {
> > +		int k;
> > +		u32 delay_val =3D 1000000 / i2c->real_clk + 1;
> > +
> > +		if (delay_val < 2)
> > +			delay_val =3D 2;
> > +
> > +		for (k =3D 9; k; k--) {
> > +			writeccr(i2c, 0);
> > +			writeccr(i2c, CCR_MSTA | CCR_MTX | CCR_MEN);
> > +			udelay(delay_val);
> > +			writeccr(i2c, CCR_MEN);
> > +			udelay(delay_val << 1);
> > +		}
> > +	}
> >  }
> >  =

> =

> The old sequence has always un-hung the bus for me. Yours might be
> better. I'll try it next time the bus wedges up on me.

The easiest way to verify the /waveforms/ is to simply call the function so=
mewhere else (e.g. in a i2c write call), and then record SCK and SDA with a=
 scope.  I saw *huge* unnecessary delays in the original code, and by some =
creative interpretation of the (not very clear) 5200 data sheet I came to t=
he write's and delays above.  If you have a scope, you might want to repeat=
 the test with your '8349.

Best, Albrecht.

Immer auf dem Laufenden! Sport, Auto, Reise, Politik und Promis. Von uns f=
=FCr Sie: der neue Arcor.de-Newsletter!
Jetzt anmelden und einfach alles wissen: http://www.arcor.de/rd/footer.news=
letter
