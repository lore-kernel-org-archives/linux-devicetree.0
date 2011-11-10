From: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: Re: [PATCH 1/1] microblaze: Added fdt chosen capability for timer
Date: Fri, 11 Nov 2011 00:21:50 +1000
Message-ID: <CACPZLaU4gEwFbW6God5hz3Xb9XdDmGNwj8zVd2D8hGu0oC1CVA@mail.gmail.com>
References: <1320930623-15060-1-git-send-email-monstr@monstr.eu>
 <1320930623-15060-2-git-send-email-monstr@monstr.eu>
 <1320930623-15060-3-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1320930623-15060-3-git-send-email-monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 10, 2011 at 11:10 PM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> From: "Peter A. G. Crosthwaite" <peter.crosthwaite-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
>
> This lets a dts author flag a particular timer in the system as the syste=
m timer.
> If the chosen node contains a "system-timer=3D<&foo>" entry than that han=
dle will
> be used to determine the system timer. In no such entry exists then the f=
irst
> found timer will be used (current behaviour).
>
> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
> Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
> ---
> =A0arch/microblaze/kernel/timer.c | =A0 12 ++++++++----
> =A01 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/arch/microblaze/kernel/timer.c b/arch/microblaze/kernel/time=
r.c
> index 91804cd..c289412 100644
> --- a/arch/microblaze/kernel/timer.c
> +++ b/arch/microblaze/kernel/timer.c
> @@ -267,11 +267,15 @@ void __init time_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NULL
> =A0 =A0 =A0 =A0};
>
> - =A0 =A0 =A0 for (i =3D 0; timer_list[i] !=3D NULL; i++) {
> + =A0 =A0 =A0 prop =3D of_get_property(of_chosen, "system-timer", NULL);
> + =A0 =A0 =A0 if (prop)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 timer =3D of_find_node_by_phandle(be32_to_c=
pup(prop));

Suggest expanding this code to check that the chosen timer meets the
kernel requirements - IRQ connected, dual channel etc.

If it fails, then perhaps fall through to finding the first suitable
one, or panic()?

> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "No chosen timer found, us=
ing default\n");
> +
> + =A0 =A0 =A0 for (i =3D 0; timer_list[i] !=3D NULL && !timer; i++)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0timer =3D of_find_compatible_node(NULL, NU=
LL, timer_list[i]);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (timer)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;

There is another issue I think - can we somehow mark the system timer
instance as 'taken' so it can't be bound by another driver that might
be compatible (esp. generic-uio for example).

Currently if you mark the timer as generic-uio then a UIO app can mess
with it - not good.

John
--
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com=A0=A0p: +61-7-30090663=A0 f: +61-7-30090663
