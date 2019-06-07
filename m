From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v4 0/6] MSM8998 Multimedia Clock Controller
Date: Fri, 7 Jun 2019 15:31:13 -0600
Message-ID: <CAOCk7NrnnUzaXtnRvH0pHyHha4sTQDQCRoVPPatHfgVuEPZr0Q@mail.gmail.com>
References: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org>
 <933023a0-10fd-fedf-6715-381dae174ad9@codeaurora.org> <20190607203838.1361E208C3@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190607203838.1361E208C3@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, David Brown <david.brown@linaro.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 7, 2019 at 2:38 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Jeffrey Hugo (2019-05-21 07:52:28)
> > On 5/21/2019 8:44 AM, Jeffrey Hugo wrote:
> > > The multimedia clock controller (mmcc) is the main clock controller for
> > > the multimedia subsystem and is required to enable things like display and
> > > camera.
> >
> > Stephen, I think this series is good to go, and I have display/gpu stuff
> > I'm polishing that will depend on this.  Would you kindly pickup patches
> > 1, 3, 4, and 5 for 5.3?  I can work with Bjorn to pick up patches 2 and 6.
> >
>
> If I apply patch 3 won't it break boot until patch 2 is also in the
> tree? That seems to imply that I'll break bisection, and we have
> kernelci boot testing clk-next so this will probably set off alarms
> somewhere.

Yes, it'll break boot.  Maybe you and Bjorn can make a deal?  (more below)

Doesn't look like kernelci is running tests on 8998 anymore, so maybe
no one will complain?  As far as I am aware, Marc, Lee, Bjorn, and I
are the only ones whom care about 8998 presently, and I think we are
all good with a temporary breakage in order to get this basic
functionality in since the platform isn't really well supported yet.

>
> I thought we had some code that got removed that was going to make the
> transition "seamless" in the sense that it would search the tree for an
> RPM clk controller and then not add the XO fixed factor clk somehow.
> See commit 54823af9cd52 ("clk: qcom: Always add factor clock for xo
> clocks") for the code that we removed. So ideally we do something like
> this too, but now we search for a property on the calling node to see if
> the XO clk is there?
>

Trying to remember back a bit.

I don't think its possible.  Maybe I'm wrong.  I didn't see a solution
to the below:

How does GCC know the following?
-RPMCC is compiled in the build (I guess this can be assumed)
-RPMCC has probed
-RPMCC is not and will not be providing XO
