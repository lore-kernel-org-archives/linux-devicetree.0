From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/5] arm/mxc: add clk members to ease dt clock support
Date: Mon, 7 Mar 2011 10:53:37 -0700
Message-ID: <AANLkTikZsMxs1dXgBxVEar+MLF0j4ROZO+uTmo+OSF4s@mail.gmail.com>
References: <1299514932-13558-1-git-send-email-shawn.guo@linaro.org>
	<1299514932-13558-3-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1299514932-13558-3-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 7, 2011 at 9:22 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> The 'rate' is added for fixed-clock support, while 'pll_base' is for
> pll clock. =A0These two particular type of clocks are supposed to be
> gracefully supported by the common clk api when it gets ready.

How does the current imx clock code handle fixed and pll clocks?
Using the dt shouldn't require any special treatment in this regard.

g.

>
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> =A0arch/arm/plat-mxc/include/mach/clock.h | =A0 =A04 ++++
> =A01 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/plat-mxc/include/mach/clock.h b/arch/arm/plat-mxc/i=
nclude/mach/clock.h
> index 753a598..a29dc45 100644
> --- a/arch/arm/plat-mxc/include/mach/clock.h
> +++ b/arch/arm/plat-mxc/include/mach/clock.h
> @@ -38,6 +38,10 @@ struct clk {
> =A0 =A0 =A0 =A0/* Register address for clock's enable/disable control. */
> =A0 =A0 =A0 =A0void __iomem *enable_reg;
> =A0 =A0 =A0 =A0u32 flags;
> + =A0 =A0 =A0 /* clock rate used by fixed-clock */
> + =A0 =A0 =A0 unsigned long rate;
> + =A0 =A0 =A0 /* base address of pll */
> + =A0 =A0 =A0 void __iomem *pll_base;
> =A0 =A0 =A0 =A0/* get the current clock rate (always a fresh value) */
> =A0 =A0 =A0 =A0unsigned long (*get_rate) (struct clk *);
> =A0 =A0 =A0 =A0/* Function ptr to set the clock to a new rate. The rate m=
ust match a
> --
> 1.7.1
>
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
