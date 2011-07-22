From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] Various fixups from first bug reports
Date: Fri, 22 Jul 2011 21:20:51 +0200
Message-ID: <20110722192051.GH16561__49969.5851038725$1311362477$gmane$org@pengutronix.de>
References: <alpine.LFD.2.02.1107211932440.2702@ionos>
	<1311278277-8222-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<1311313414.2940.8.camel@box>
	<20110722065711.GD16561@pengutronix.de>
	<87y5zqzick.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87y5zqzick.fsf-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, linux-rt-users-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlaKREJ1Ck/qmQ@public.gmane.org
Cc: hermann <brummer--S0/GAf8tV78@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Fri, Jul 22, 2011 at 08:34:59PM +0930, Rusty Russell wrote:
> On Fri, 22 Jul 2011 08:57:11 +0200, Uwe Kleine-K=F6nig <u.kleine-koenig@p=
engutronix.de> wrote:
> > > second was with CONFIG_LGUEST_GUEST enabled, module build stage 2 fai=
led
> > > with Documentation/lguest not found
> > Hmm, there is Documentation/virtual/lguest. Didn't find where
> > Documentation/lguest is used from a quick look. Rusty?
> =

> No, it's not compiled from the kernel build, at least in mainline...
> =

> If it is in the -r tree, you need to
> s,Documentation/lguest,Documentation/virtual/lguest, as it has moved.
I don't understand that and didn't try to reproduce. =

hermann, maybe you can follow up with your failing .config and try to
reproduce on v3.0 (without rt)?

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
