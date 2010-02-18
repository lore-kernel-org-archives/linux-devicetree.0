From: "Albrecht Dreﬂ" <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Subject: Re: [Patch v2 1/2] 5200/mpc: improve i2c bus error recovery
Date: Thu, 18 Feb 2010 16:04:16 +0100 (CET)
Message-ID: <2921453.1266505456809.JavaMail.ngmail@webmail09.arcor-online.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: joakim.tjernlund-SNLAxHN9vbcOP4wsBPIw7w@public.gmane.org
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Joakim:

[snip]
> >   static void mpc_i2c_fixup(struct mpc_i2c *i2c)
> >   {
> > -   writeccr(i2c, 0);
> > -   udelay(30);
> > -   writeccr(i2c, CCR_MEN);
> > -   udelay(30);
> > -   writeccr(i2c, CCR_MSTA | CCR_MTX);
> > -   udelay(30);
> > -   writeccr(i2c, CCR_MSTA | CCR_MTX | CCR_MEN);
> > -   udelay(30);
> > -   writeccr(i2c, CCR_MEN);
> > -   udelay(30);
> > +   int k;
> > +   u32 delay_val =3D 1000000 / i2c->real_clk + 1;
> > +
> > +   if (delay_val < 2)
> > +      delay_val =3D 2;
> > +
> > +   for (k =3D 9; k; k--) {
> > +      writeccr(i2c, 0);
> > +      writeccr(i2c, CCR_MSTA | CCR_MTX | CCR_MEN);
> > +      udelay(delay_val);
> > +      writeccr(i2c, CCR_MEN);
> > +      udelay(delay_val << 1);
> > +   }
> >   }
> =

> I am curious, didn't old method work with by just wrapping
> a for(k=3D9; k; k--) around it? How did the wave form look?

Sure does that work!  The waveform was somewhat "streched", mainly due to t=
he delays between some of the writeccr() calls which don't change the sda/s=
cl lines.  Unfortunately I didn't take shots from the scope.

However, for *one* cycle, the old code needed (only counting the udelay's) =
150 us.  For 9 cycles, it's 1.35 ms, which isn't really nice ;-).  At 375 k=
Hz real clock rate, delay_val is 3, i.e. each cycle consumes 9 us, or 81 us=
 for the whole fixup procedure.  If the clock is slower, the gain is of cou=
rse a lot smaller, and at 20.5 kHz each cycle again needs 150 us...

My feeling is that the delays used in the old code are just "some" values w=
hich work for sure, to if you like, my change is basically optimisation...

BTW, related to your earlier question, I checked the timings recorded with =
the scope at 100 and at 20 kHz against the nxp's "I2C bus specification and=
 user manual", rev. 03 - everything seems to be fine.

Thanks, Albrecht.

Immer auf dem Laufenden! Sport, Auto, Reise, Politik und Promis. Von uns f=
=FCr Sie: der neue Arcor.de-Newsletter!
Jetzt anmelden und einfach alles wissen: http://www.arcor.de/rd/footer.news=
letter
