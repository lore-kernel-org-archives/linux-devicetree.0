From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC] arm devicetree meeting/hacking day
Date: Mon, 24 Jan 2011 13:25:40 -0700
Message-ID: <AANLkTi=1kQR2yFY8xJw=XX0aH5PG53sVmZCXf5fuUOu0@mail.gmail.com>
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
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lennert Buytenhek <buytenh-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Jason Hui <jason>
Cc: =?ISO-8859-1?Q?Lo=EFc_Minier?= <loic.minier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Rusling <david.rusling-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "Paul E. McKenney" <paulmck-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linaro-dev <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

For those of you who are working, or are soon-to-be working, on device
tree support for ARM, I'm organizing a regular weekly status update
and a hacking day for getting device tree support added to several of
the ARM platforms.  I've already talked to some of you about this
briefly.  Basically the idea is to have a day when all of us working
on dt can coordinate and get problems solved.  I'll commit to being
available and focused on answering dt questions for that day so it
should be easier to get my help.  I'll also put together some
documents and guides for dt bringup on new platforms which will break
down the features that each platform needs to implement.

For the status update part, rather than scheduling yet another
meeting, I think it would be appropriate to tack it onto the end of
the Monday kernel working group status update call.  I'll dial into
both the west (1600UTC) and east (0400UTC-tuesday) calls so that I've
got a chance to talk with everyone..  Let me know if you don't have
the dial-in details for either of the calls and I'll ask Paul or Loic
to add you to the invite.

For the hacking day, how does Tuesday(west)/Wednesday(east) sound for
everyone?  I'll be available on IRC, and I'll also keep my schedule
clear so that I'll be available for phone calls.

Right now, here's the list of people that I know are or may be working
on DT support, and the platform they are working on (not exclusively
Linaro work):

Lennert Buytenhek (Core infrastructure & omap3)
Thomas Abraham (Samsung)
John Bonesio (nVidia Tegra)
Shawn Guo and Jason Hui (Freescale imx51)
Jon Masters (omap3, beagle board)

Anybody else want me to add them to this list?

g.

On Mon, Jan 17, 2011 at 9:43 AM, Lo=EFc Minier <loic.minier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:
> =A0 =A0 =A0 =A0Hey
>
> =A0- Thomas Abraham working on Samsung DT right now
> =A0- Jeremy Kerr doing some stuff in his free time
> =A0- Lennert working on OMAP bits
>
> =A0Needs:
> =A0- someone to work on low-level core architecture implementation needs;
> =A0 Lennert currently doing this
> =A0- folks for various SoCs
>
> =A0Potential SoC candidates:
> =A0- Jason Hui is from Freescale and is currently on some kernel
> =A0 configuration stuff
> =A0- ST-Ericsson assignees are not too available: Per is busy with SD/MMC
> =A0 stuff and Mian is going away for 5 weeks; maybe Linus from the
> =A0 ST-Ericsson Landing Team
> =A0- Shawn Guo would be another potential Freescale assignees
> =A0- TI: Aneesh V could help; Anand and Nishant are busy with Kexec and
> =A0 Storage stuff respectively
>
> =A0Grant should interview Shawn + Jason to brief them; perhaps they could
> =A0work on two different parts (e.g. u-boot, and kernel).
>
> =A0Grant did a one-liner to enable DT on Tegra in u-boot; will send to try
> =A0enabling Freescale platforms as well.
>
> =A0Shawn might be able to work on core code, and perhaps even Jason, but
> =A0not clear.
>
> =A0Would be nice to have someone working on the QEMU side of things as
> =A0it's really useful.
>
> =A0Lo=EFc will check with Michael Hope about QEMU mentoring and QEMU work.
>
> =A0Arnd would be a good candidate for the kernel side of the ARM DT work
> =A0(picking up where Lorenzo left it).
>
> =A0 =A0Bye
> --
> Lo=EFc Minier
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
