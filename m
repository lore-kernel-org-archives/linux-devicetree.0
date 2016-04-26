From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 15/41] Documentation: dt: mfd: fix spelling mistakes
Date: Tue, 26 Apr 2016 07:35:16 +0100
Message-ID: <20160426063516.GQ2713@dell>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-16-git-send-email-eric@engestrom.ch>
 <20160425135017.GA8656@rob-hp-laptop>
 <20160425165830.GP2713@dell>
 <CAL_JsqJC1epdP_RBm4fSz2ouYPy40NuFzfj6M1qB0rxV7H4S=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJC1epdP_RBm4fSz2ouYPy40NuFzfj6M1qB0rxV7H4S=Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Eric Engestrom <eric@engestrom.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 25 Apr 2016, Rob Herring wrote:

> On Mon, Apr 25, 2016 at 11:58 AM, Lee Jones <lee.jones@linaro.org> wr=
ote:
> > On Mon, 25 Apr 2016, Rob Herring wrote:
> >
> >> On Mon, Apr 25, 2016 at 01:24:12AM +0100, Eric Engestrom wrote:
> >> > Signed-off-by: Eric Engestrom <eric@engestrom.ch>
> >>
> >> Applied, thanks.
> >
> > I'd prefer to continue taking these if you don't mind Rob.  It'd li=
mit
> > on the amount of immutable branch pull requests I have to send/hand=
le.
>=20
> Why? Do you really expect to have a dependency here?

Because the file is in ".*/mfd/.*", which normally goes through the MFD
tree.

$ git log --committer=3D"Rob Herring" --oneline -- Documentation/device=
tree/bindings/mfd/ | wc -l
6
$ git log --committer=3D"Lee Jones" --oneline -- Documentation/devicetr=
ee/bindings/mfd/ | wc -l
99

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
