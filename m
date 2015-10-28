From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 3/4] mfd: arizona: Remove bindings covered in new
 subsystem specific docs
Date: Wed, 28 Oct 2015 09:17:39 +0000
Message-ID: <20151028091739.GL5828@x1>
References: <1445961719-1020-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1445961719-1020-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151028090306.GJ5828@x1>
 <5630912A.9090601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5630912A.9090601@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, broonie@kernel.org, myungjoo.ham@samsung.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Wed, 28 Oct 2015, Chanwoo Choi wrote:
> On 2015=EB=85=84 10=EC=9B=94 28=EC=9D=BC 18:03, Lee Jones wrote:
> > On Tue, 27 Oct 2015, Charles Keepax wrote:
> >=20
> >> Binding documentation has been added in new subsystem specific bin=
ding
> >> documents. This patch removes the now duplicate documentation from=
 the
> >> MFD documentation.
> >>
> >> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com=
>
> >> ---
> >>
> >> Changes since v2:
> >>  - No longer moving the core regulators into the regulator binding=
 document,
> >>    as they are properties of the device as a whole not just the re=
gulators
> >>  - Moved the maintainer updates into a seperate patch
> >>
> >> Lee, I have removed your ack because the patch has changed a fair =
amount.
> >> Apologies if this would not have been your preference.
> >=20
> > That was the right thing to do.
> >=20
> >> Thanks,
> >> Charles
> >>
> >>  Documentation/devicetree/bindings/mfd/arizona.txt |   15 +++-----=
-------
> >>  1 files changed, 3 insertions(+), 12 deletions(-)
> >=20
> > Applied, thanks.
>=20
> If you possible, could you pick patch1[1] which has already the acked=
 tag of me?
> [1] [PATCH v3 1/4] extcon: arizona: Add extcon specific device tree b=
inding document

Yes, no problem.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
