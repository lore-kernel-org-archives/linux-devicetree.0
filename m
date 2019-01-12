From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: New IIO/counter driver
Date: Sat, 12 Jan 2019 17:51:59 +0000
Message-ID: <20190112175159.3dac7a70@archlinux>
References: <CAKKE0ZHmODzhvjPNJFVgT2cF_F=f2kNKr5K_CGP+0XgA5XZokw@mail.gmail.com>
        <20190108004632.GA3247@icarus>
        <CA+M3ks7wX6MxvapDi_5SQ0rkJWoV+BcmzmbvtiqHVBzrrwAp4g@mail.gmail.com>
        <8b2bb569-a6e0-25ec-740d-48083b30fe60@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8b2bb569-a6e0-25ec-740d-48083b30fe60@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, Patrick Havelange <patrick.havelange@essensium.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Benjamin GAIGNARD <benjamin.gaignard@st.com>, linux-iio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>, Andrew Morton <akpm@linux-foundation.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 8 Jan 2019 12:01:57 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> On 1/8/19 11:57 AM, Benjamin Gaignard wrote:
> > Le mar. 8 janv. 2019 =C3=A0 01:46, William Breathitt Gray
> > <vilhelm.gray@gmail.com> a =C3=A9crit : =20
> >>
> >> On Mon, Jan 07, 2019 at 02:45:37PM +0100, Patrick Havelange wrote: =20
> >>> Hello,
> >>>
> >>> I'm in the process of adding a new IIO/counter driver, however I also=
 saw
> >>> that there was a work in progress to have a separate counter subsyste=
m (
> >>> https://marc.info/?l=3Dlinux-iio&m=3D153974167727206 ). But it seems =
there is
> >>> no recent progress on it.
> >>> What is the state of those patches ? Is it still interesting to devel=
op the
> >>> driver as an IIO/counter , or should I use already that new subsystem=
 ?
> >>>
> >>> Best Regards,
> >>>
> >>> Patrick Havelange. =20
> >>
> >> Hello,
> >>
> >> I am still open to merging this patchset and maintaining the Counter
> >> subsystem. However, I took the lack of response for my latest
> >> submission to indicate a loss of interest in this patchset's approach.
> >> If there are still people who want this, I can rebase and resend this
> >> patchset for submission; the past few versions have primarily been code
> >> clarity and documentation changes so I believe the core design itself =
is
> >> somewhat stable now.
> >>
> >> Just let me know how best to proceed and I shall be happy to oblige --
> >> whether to continue maintaining this patchset or to drop this design in
> >> favor of improving the existing IIO Counter code in the kernel.
> >>
> >> I'll CC those from the patchset submission to keep them in the loop. =
=20
> >=20
> > I confirm that I still interested to get those patches merged.
> >=20
> > Regards,
> > Benjamin =20
> Hi,
>=20
> Same for me,
In a more abstract fashion (I don't have any hardware of this type!)
I'm still keen for the counter subsystem to go in.  Hopefully, if
Greg or anyone else wants to take a detailed look they will have time
this cycle to do so.

I was pretty happy with the last version I read through.  There will
always be things to improved, but as long a we are happy with
the userspace inteface, the little things can happen later.

Jonathan

>=20
> Regards,
> Fabrice
> >>
> >> Sincerely,
> >>
> >> William Breathitt Gray
> >>
> >> _______________________________________________
> >> linux-arm-kernel mailing list
> >> linux-arm-kernel@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel =20
> >=20
> >=20
> >  =20
