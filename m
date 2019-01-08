From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: New IIO/counter driver
Date: Tue, 8 Jan 2019 11:57:13 +0100
Message-ID: <CA+M3ks7wX6MxvapDi_5SQ0rkJWoV+BcmzmbvtiqHVBzrrwAp4g@mail.gmail.com>
References: <CAKKE0ZHmODzhvjPNJFVgT2cF_F=f2kNKr5K_CGP+0XgA5XZokw@mail.gmail.com>
 <20190108004632.GA3247@icarus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108004632.GA3247@icarus>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Patrick Havelange <patrick.havelange@essensium.com>, Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Benjamin GAIGNARD <benjamin.gaignard@st.com>, linux-iio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>, Andrew Morton <akpm@linux-foundation.org>, Fabrice Gasnier <fabrice.gasnier@st.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Le mar. 8 janv. 2019 =C3=A0 01:46, William Breathitt Gray
<vilhelm.gray@gmail.com> a =C3=A9crit :
>
> On Mon, Jan 07, 2019 at 02:45:37PM +0100, Patrick Havelange wrote:
> > Hello,
> >
> > I'm in the process of adding a new IIO/counter driver, however I also s=
aw
> > that there was a work in progress to have a separate counter subsystem =
(
> > https://marc.info/?l=3Dlinux-iio&m=3D153974167727206 ). But it seems th=
ere is
> > no recent progress on it.
> > What is the state of those patches ? Is it still interesting to develop=
 the
> > driver as an IIO/counter , or should I use already that new subsystem ?
> >
> > Best Regards,
> >
> > Patrick Havelange.
>
> Hello,
>
> I am still open to merging this patchset and maintaining the Counter
> subsystem. However, I took the lack of response for my latest
> submission to indicate a loss of interest in this patchset's approach.
> If there are still people who want this, I can rebase and resend this
> patchset for submission; the past few versions have primarily been code
> clarity and documentation changes so I believe the core design itself is
> somewhat stable now.
>
> Just let me know how best to proceed and I shall be happy to oblige --
> whether to continue maintaining this patchset or to drop this design in
> favor of improving the existing IIO Counter code in the kernel.
>
> I'll CC those from the patchset submission to keep them in the loop.

I confirm that I still interested to get those patches merged.

Regards,
Benjamin
>
> Sincerely,
>
> William Breathitt Gray
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



--=20
Benjamin Gaignard

Graphic Study Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

Follow Linaro: Facebook | Twitter | Blog
