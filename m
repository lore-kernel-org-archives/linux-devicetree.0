From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 1/2] arm/mx5: parse iomuxc pad configuratoin from
	device tree
Date: Sun, 7 Aug 2011 17:23:49 +0100
Message-ID: <20110807162348.GA2101@n2100.arm.linux.org.uk>
References: <1311606467-28985-1-git-send-email-shawn.guo@linaro.org>
	<1311606467-28985-2-git-send-email-shawn.guo@linaro.org>
	<20110725204630.GD26735@ponder.secretlab.ca>
	<CAKGA1bmbWUeyhUtDwHZjB8V4e2wJ0NHX2qWhqaqx6HoBm7uMnQ@mail.gmail.com>
	<20110805070729.GA26563@huya.qualcomm.com>
	<CAKGA1bkM6X533w20hDV7GCPwzzj2nrjGdN6zkXsS+hCvUD_s2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKGA1bkM6X533w20hDV7GCPwzzj2nrjGdN6zkXsS+hCvUD_s2A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 05, 2011 at 01:36:56PM -0500, Matt Sealey wrote:
> On Fri, Aug 5, 2011 at 2:07 AM, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> > On Thu, Aug 04, 2011 at 06:07:15PM -0500, Matt Sealey wrote:
> >> Hi Grant, Shawn,
> >>
> >> On Mon, Jul 25, 2011 at 3:46 PM, Grant Likely <grant.likely@secretlab.=
ca> wrote:
> >> > This could get really verbose in a really big hurry. =A0Fortunately =
the
> >> > dtb format is sophisticated enough to only store each unique property
> >> > name once, so the data shouldn't be huge, but it is still going to
> >> > make for huge source files. =A0Can you think of a more concise
> >> > representation?
> >>
> >> Yes: no representation at all. The correct place for IOMUX setup being
> >> done is *inside the boot firmware as soon as physically possible* and
> >> not seconds into boot after U-Boot has made a console, done a boot
> >> timeout, loaded scripts, kernels and ramdisks from media and then
> >> uncompressed and entered a Linux kernel.
> >
> > This is true in situations where we have control over the bootloader,
> > but that isn't always the case.
> =

> Indeed it is not, but then it is "their" fault the board won't boot
> Linux, and not yours, right? :)

Not normally.  What happens is that you're provided with the boot loader.
You're told to get Linux working on the board.  Anything which the boot
loader doesn't do ends up being hacked around in the kernel.

Don't say that isn't what happens, because that comment is made with a
substantial body experience in dealing with patches from multiple
different sources containing crap to work around boot loader bugs.  Most
boot loader bugs go _unfixed_ on hardware even after being reported.

So please, don't tell us that boot loaders should do things right.  We
know, and we know (again from a vast body of experience) that relying on
boot loaders is plain idiotic and totally unworkable.
