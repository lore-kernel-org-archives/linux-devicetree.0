From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH] ARM: dts: cygnus: Add HWRNG node
Date: Wed, 6 Jun 2018 19:06:51 +0200
Message-ID: <CAJiuCcdfmrdHf10JkVOGQXD77JN=_FUv2ysEGTzyvwON31HX_A@mail.gmail.com>
References: <20180606093441.16483-1-peron.clem@gmail.com> <c8836130-1d96-b813-4e87-5011db679ba8@broadcom.com>
 <c7990001-00e6-d828-bafd-3d472fcfee20@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c7990001-00e6-d828-bafd-3d472fcfee20@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: scott.branden@broadcom.com, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Cl=C3=A9ment_Peron?= <clement.peron@devialet.com>
List-Id: devicetree@vger.kernel.org

Hi Scott, Florian,

On Wed, 6 Jun 2018 at 18:47, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 06/06/201 8 09:03 AM, Scott Branden wrote:
> > Hi Clement,
> >
> >
> > On 18-06-06 02:34 AM, Cl=C3=A9ment P=C3=A9ron wrote:
> >> From: Cl=C3=A9ment Peron <clement.peron@devialet.com>
> >>
> >> There is a HWRNG in Broadcom Cygnus SoC, so enable it.
> >>
> >> Signed-off-by: Cl=C3=A9ment Peron <clement.peron@devialet.com>
> > Thanks for upstreaming some missing Cygnus components.
> >
> > But, the problem is the tarball release from Broadcom you are extractin=
g
> > these changes from does not contain git history; so, you are missing th=
e
> > original authors and signed-off's.
> > I checked our internal git repository and for this commit the author is=
:
> > Mohamed Ismail Abdul Packir Mohamed <mohamed-ismail.abdul@broadcom.com>
> >
> > Please adjust author and signed-off appropriately.  If there are other
> > changes you are extracting from the source tarballs you have please
> > contact me so we can construct patch appropriately.
>
> If you want the original author's Signed-off-by to be preserved, why
> don't you extract it from your internal git tree and submit the patch on
> Mohamed's behalf?
>
> AFAICT what Clement is doing here is permissible given the Linux
> developer certificate of origin though I am not a lawyer of course.
> --
> Florian

Totally not my goal to steal the author and agree to keep track of the
original author
as soon as it's possible. I didn't though it was important for this
patch as the same
code is available in the dt-bindings documentation.

Actually there are still some buggy components like DSA (Arun proposed
a patch this morning)
the PWM (config and delay aren't correct) and I2C. These are mainlined
but can't be used
and need a minimal effort to correctly work on Cygnus.

Also there are some important components like USB Phy or Mailbox that
were proposed and
almost made it, but just need a small modification to be accepted.

My idea was just to submit small patches that are trivial to review.
In order to avoid keeping
lots of patches in our kernel and also have something functional when
building a mainline kernel.

Regards,
Clement
