From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 00/11] make struct of_device_id.data const
Date: Sat, 14 Jul 2012 20:31:55 +0200
Message-ID: <20120714183155.GP592@pengutronix.de>
References: <5000175E.4070702@gmail.com>
 <CACxGe6tXvz+rt2yrHHaD=j94-=JQEh06sHW0FWGiHb2=9GS2pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6tXvz+rt2yrHHaD=j94-=JQEh06sHW0FWGiHb2=9GS2pA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Grant,

On Fri, Jul 13, 2012 at 01:36:59PM -0600, Grant Likely wrote:
> On Fri, Jul 13, 2012 at 6:41 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> > On 07/13/2012 07:32 AM, y@pengutronix.de wrote:
> >> this series' goal is to make struct of_device_id.data const.
> >> Conceptually a driver must not modify the data contained there so maki=
ng
> >> it const is the right thing.
> >>
> >> This change might introduce warnings because drivers don't use const to
> >> access the data pointed to by of_device_id.data. In most cases the fix
> >> is to add some consts.
> >>
> >> This series (apart from adding this const in patch 10) fixes all drive=
rs
> >> covered by all arm defconfigs (based on v3.5-rc6).
> >>
> >
> > What about other arches?
> =

> This whole series is of questionable value to me.  While I agree that
> .data should be const, I don't think changing it has is measurably
> better than what we have now.  Particularly when the series isn't
> complete for all users.  And "building all defconfigs" is not the
> right way to look for affected users.
As it's not really bad if a user isn't fixed (it only introduces a
compiler warning) I think not being 100% sure to have fixed all of them
is OK. I plan to check the defconfigs and an allyes build on powerpc and
look over the patch that Arnd sent. IMHO this is enough to go on.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
