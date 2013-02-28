From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: imx: replace magic number with pin
 function name
Date: Thu, 28 Feb 2013 11:06:19 +0800
Message-ID: <20130228030616.GA26106@S2101-09.ap.freescale.net>
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
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux ARM Kernel ML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 27, 2013 at 12:16:20PM -0600, Matt Sealey wrote:
> Shawn, I might be much happier about the patch if I knew for sure that it
> 
> a) followed some Freescale design database export of pins vs. alt
> modes and default mux settings

This is the case today.

> (this must exist because the manuals
> and IOMUX tool data are generated from some XML files) and that

The problem seems to be that the ALT function names are a little
inconsistent between XML files and design database.  I'm checking with
design team right now to see how this happens, and ensure this will
never happen again in the future.

And I will ensure the macro for later SoCs, e.g. imx6dl and imx6sl,
will be consistent with Reference Manual.

> b) that data was available to generate the macros used in the binding.

Ok.  I will check with IOMUX-tool people to see if we can have the data
integrated and exported with the tool.

Shawn
