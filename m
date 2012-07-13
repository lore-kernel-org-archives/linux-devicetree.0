From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 00/11] make struct of_device_id.data const
Date: Fri, 13 Jul 2012 15:46:38 +0200
Message-ID: <20120713134638.GH592@pengutronix.de>
References: <1342182734-321-1-git-send-email-y>
 <5000175E.4070702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5000175E.4070702-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 13, 2012 at 07:41:02AM -0500, Rob Herring wrote:
> On 07/13/2012 07:32 AM, y@pengutronix.de wrote:
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > =

> > this series' goal is to make struct of_device_id.data const.
> > Conceptually a driver must not modify the data contained there so making
> > it const is the right thing.
> > =

> > This change might introduce warnings because drivers don't use const to
> > access the data pointed to by of_device_id.data. In most cases the fix
> > is to add some consts.
> > =

> > This series (apart from adding this const in patch 10) fixes all drivers
> > covered by all arm defconfigs (based on v3.5-rc6).
> > =

> =

> What about other arches?
I didn't looked at them, mainly because I don't have the scripts for
arches other than arm to do such testing. Also note that it introduces
only some warnings, but no breakage. So adding the const in the merge
window might be ok?!

I'm not sure I'll have the capacity to fix other arches now. Maybe only
add the const for ARCH=3Darm for now and I'll address the other archs as
time permits even though this is ugly? At least getting in patches 1-9
would be nice to get in to save me from keeping them up to date.

Which other arches do you consider relevant?

$ git grep -l '\<OF\>' arch/*/Kconfig
arch/arm/Kconfig
arch/c6x/Kconfig
arch/microblaze/Kconfig
arch/mips/Kconfig
arch/openrisc/Kconfig
arch/powerpc/Kconfig
arch/sparc/Kconfig
arch/x86/Kconfig

For most of these I first have to look where to get a toolchain from.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
