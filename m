From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 2/5] arm/mxc: add clk members to ease dt clock support
Date: Tue, 15 Mar 2011 15:50:29 +0800
Message-ID: <20110315075028.GG11098@S2100-06.ap.freescale.net>
References: <1299514932-13558-1-git-send-email-shawn.guo@linaro.org>
	<1299514932-13558-3-git-send-email-shawn.guo@linaro.org>
	<AANLkTikZsMxs1dXgBxVEar+MLF0j4ROZO+uTmo+OSF4s@mail.gmail.com>
	<20110308035633.GD14370@S2101-09.ap.freescale.net>
	<20110315074101.GH23050@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110315074101.GH23050-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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

On Tue, Mar 15, 2011 at 01:41:01AM -0600, Grant Likely wrote:
> On Tue, Mar 08, 2011 at 11:56:34AM +0800, Shawn Guo wrote:
> > On Mon, Mar 07, 2011 at 10:53:37AM -0700, Grant Likely wrote:
> > > On Mon, Mar 7, 2011 at 9:22 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrot=
e:
> > > > The 'rate' is added for fixed-clock support, while 'pll_base' is for
> > > > pll clock. =A0These two particular type of clocks are supposed to be
> > > > gracefully supported by the common clk api when it gets ready.
> > > =

> > > How does the current imx clock code handle fixed and pll clocks?
> > =

> > For fixed-clock, the current code gets several variables holding the
> > rate and then return the rate from several get_rate functions.
> > =

> > static unsigned long external_high_reference, external_low_reference;
> > static unsigned long oscillator_reference, ckih2_reference;
> > =

> > static unsigned long get_high_reference_clock_rate(struct clk *clk)
> > {
> >         return external_high_reference;
> > }
> > =

> > static unsigned long get_low_reference_clock_rate(struct clk *clk)
> > {
> >         return external_low_reference;
> > }
> > =

> > static unsigned long get_oscillator_reference_clock_rate(struct clk *cl=
k)
> > {
> >         return oscillator_reference;
> > }
> > =

> > static unsigned long get_ckih2_reference_clock_rate(struct clk *clk)
> > {
> >         return ckih2_reference;
> > }
> > =

> > With this new rate member added, all these can be consolidated into one.
> > =

> > For base address of pll, the current code uses the reference to clocks
> > statically defined to know which pll is the one.
> > =

> > static inline void __iomem *_mx51_get_pll_base(struct clk *pll)
> > {
> > #ifdef CONFIG_OF
> >         return pll->pll_base;
> > #else
> >         if (pll =3D=3D &pll1_main_clk)
> >                 return MX51_DPLL1_BASE;
> >         else if (pll =3D=3D &pll2_sw_clk)
> >                 return MX51_DPLL2_BASE;
> >         else if (pll =3D=3D &pll3_sw_clk)
> >                 return MX51_DPLL3_BASE;
> >         else
> >                 BUG();
> > =

> >         return NULL;
> > #endif
> =

> Be careful about stuff like this.  Remember that enabling CONFIG_OF
> must *not break* board support that does not use the device tree.  The
> above #ifdef block will break existing users.
> =

Though the code has been killed in the latest version I just sent
yesterday I sent last night, I do not understand how it will break
the existing users.  The existing code is:

static inline void __iomem *_mx51_get_pll_base(struct clk *pll)
{
        if (pll =3D=3D &pll1_main_clk)
                return MX51_DPLL1_BASE;
        else if (pll =3D=3D &pll2_sw_clk)
                return MX51_DPLL2_BASE;
        else if (pll =3D=3D &pll3_sw_clk)
                return MX51_DPLL3_BASE;
        else
                BUG();

        return NULL;
}

-- =

Regards,
Shawn
