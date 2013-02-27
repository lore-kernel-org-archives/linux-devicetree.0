From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: imx: replace magic number with pin
 function name
Date: Wed, 27 Feb 2013 21:00:01 +0100
Message-ID: <20130227200001.GM1906@pengutronix.de>
References: <1361344089-16804-1-git-send-email-shawn.guo@linaro.org>
 <1361344089-16804-3-git-send-email-shawn.guo@linaro.org>
 <51251A11.2030300@wwwdotorg.org>
 <CAKGA1bkHH1XC38_VM=QhDrr33uqqSbwe0n+GfXEPs43K_Do=CQ@mail.gmail.com>
 <20130221050247.GD17738@S2101-09.ap.freescale.net>
 <CAKGA1bn22xctSj_33HQsWwnVB=RO2OJ=eYvgRD-kF+PiQcnC4Q@mail.gmail.com>
 <20130222055203.GB27371@S2101-09.ap.freescale.net>
 <CAKGA1bmw+CzBDLHty1+L1VdeWLgkPpLSLpGKBJEeQj-ByyzicA@mail.gmail.com>
 <20130227074404.GD1906@pengutronix.de>
 <CAKGA1bmqdCiocc_O6hU3ym6uJ-bAjwKMNrt43Qs_dkjEGpX-KQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKGA1bmqdCiocc_O6hU3ym6uJ-bAjwKMNrt43Qs_dkjEGpX-KQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Cc: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linux ARM Kernel ML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 27, 2013 at 12:16:20PM -0600, Matt Sealey wrote:
> On Wed, Feb 27, 2013 at 1:44 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > On Wed, Feb 27, 2013 at 12:51:56AM -0600, Matt Sealey wrote:
> 
> I do notice that, what I'm a little perturbed by is that it doesn't
> seem to improve the situation (the amount of work required to use and
> VERIFY the values in each macro - on the assumption that any of them
> could be wrong and cross-check them with the schematics, the board
> designer if necessary, and then put them in a device tree as known
> working. Not all of the data files used in PCB design packages
> actually match the docs anyway so there are some cross-checks against
> yet another Freescale design database. If I asked someone here to go
> find the pin settings for USDHC2 on a board we have, they would first
> have to figure out which pad this was coming out of, go to the manual,
> find the signals that exit on that pad, look at the IOMUX, cross check
> it with some example code and the FSL IOMUX tool... pre-processing and
> using macros doesn't make that any easier until we have a single,
> fixed, totally verified and unchangeable set of macros which will
> cover all the usual cases. If the intent is that we just glob in 2500
> pin definitions at the start and "hope" that someone "eventually"
> notices any errors.. this is not normal in embedded design.

If the macro is unused then who cares about the bugs in it? If on the
other hand it is used, then people will notice the bugs quite fast and
will fix them. If you don't like the macros, then don't use them. If
you have a better idea how the macros should look like, send patches.

Please try and make your point in the amount of text I quoted above,
preferably even shorter, because that's the maximum amount of text I
think most people are willing to read per mail. The shorter you write
the more people will read your mails up to the end and maybe react to
it.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
