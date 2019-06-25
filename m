From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device
 tree bindings for vibrator
Date: Mon, 24 Jun 2019 20:54:34 -0400
Message-ID: <20190625005434.GA6401@onstation.org>
References: <20190516085018.2207-1-masneyb@onstation.org>
 <20190520142149.D56DA214AE@mail.kernel.org>
 <CACRpkdZxu1LfK11OHEx5L_4kyjMZ7qERpvDzFj5u3Pk2kD1qRA@mail.gmail.com>
 <20190529101231.GA14540@basecamp>
 <CACRpkdY-TcF7rizbPz=UcHrFvDgPJD68vbovNdcWP-aBYppp=g@mail.gmail.com>
 <20190623105332.GA25506@onstation.org>
 <CACRpkdYTaM+sBs-bhaXVtAwFtp6+_PWWJ_k9jobd7qB41HubDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYTaM+sBs-bhaXVtAwFtp6+_PWWJ_k9jobd7qB41HubDg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, MSM <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2019 at 12:29:29AM +0200, Linus Walleij wrote:
> On Sun, Jun 23, 2019 at 12:53 PM Brian Masney <masneyb@onstation.org> wrote:
> 
> > 2) Do what Linus suggests above. We can use v1 of this series from last
> >    September (see below for link) that adds this to the pwm subsystem.
> >    The locking would need to be added so that it won't conflict with the
> >    clk subsystem. This can be tied into the input subsystem with the
> >    existing pwm-vibra driver.
> 
> What I imagined was that the clk driver would double as a pwm driver.
> Just register both interfaces.
> 
> There are already plenty of combines clk+reset drivers for example.
> 
> Otherwise I'm all for this approach (but that's just me).

I agree that this makes sense. I especially like that it'll allow us
to use the existing pwm-vibra driver in the input subsystem with this
approach.

Brian
