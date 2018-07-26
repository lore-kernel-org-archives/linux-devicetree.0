From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v9 1/2] regulator: dt-bindings: add QCOM RPMh regulator
 bindings
Date: Thu, 26 Jul 2018 11:39:22 -0700
Message-ID: <20180726183922.GA4402@hector.mosconeconnections.com>
References: <cover.1531531808.git.collinsd@codeaurora.org>
 <56b9d5c38cfe46da1228c54f001a49773c3e31dc.1531531808.git.collinsd@codeaurora.org>
 <CAD=FV=VmfqWRGRMEn+0dzZ8x4R5vVaHbkthXAN91Lm-XmP9Gqg@mail.gmail.com>
 <20180724145755.GF13268@sirena.org.uk>
 <CAD=FV=Uo8sT72a0gRitOVoK0SfC-_QixsovW94_LnL6H7QdKvA@mail.gmail.com>
 <20180724152514.GJ13268@sirena.org.uk>
 <CAD=FV=WHJcAoR7Y_uhi7_GbVzy6K8FnovVFVRz8js0REONox=w@mail.gmail.com>
 <20180724165942.GP13268@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180724165942.GP13268@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

+ olof

On Tue, Jul 24, 2018 at 05:59:42PM +0100, Mark Brown wrote:
> On Tue, Jul 24, 2018 at 08:43:46AM -0700, Doug Anderson wrote:
> > On Tue, Jul 24, 2018 at 8:25 AM, Mark Brown <broonie@kernel.org> wrote:
> 
> > > There was also some other thing called command DB as well which was a
> > > separate series.  Ideally there'd be a branch I could pull as there's a
> > > build dependency on rpmh so I can't apply until the code has landed in
> > > my tree, don't know what command DB is exactly.
> 
> > Yup.  That one landed in May and is already in mainline Linux.  Refer
> > to commit 312416d9171a ("drivers: qcom: add command DB driver").
> 
> That's good at least - the cover letter said it was still under review,
> guess it just hadn't been updated.
> 
> > Adding Andy to this thread (I guess he wasn't on it?).  Hopefully he
> > can provide you with the branch.
> 
Mark,

The arm-soc guys merged the Qualcomm pull requests.  So you can just use my
qcom-drivers-for-4.19 tag.  That won't change at this point.

git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git
qcom-drivers-for-4.19

Regards,
Andy
