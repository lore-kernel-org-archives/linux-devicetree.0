From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH RESEND RFC 1/4] drivers: pinctrl: qcom: add wakeup capability to
 GPIO
Date: Tue, 07 Aug 2018 23:05:07 -0700
Message-ID: <153370830708.220756.4595316550560511917@swboyd.mtv.corp.google.com>
References: <20180801020021.9782-1-ilina@codeaurora.org>
 <20180801020021.9782-2-ilina@codeaurora.org>
 <86600uy4vh.wl-marc.zyngier@arm.com> <20180801194538.GA6422@codeaurora.org>
 <86wot9wb9u.wl-marc.zyngier@arm.com> <20180802065104.GA27850@codeaurora.org>
 <86sh3xw7m9.wl-marc.zyngier@arm.com> <20180802125827.GB27850@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802125827.GB27850@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <marc.zyngier@arm.com>
Cc: evgreen@chromium.org, linus.walleij@linaro.org, bjorn.andersson@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Lina Iyer (2018-08-02 05:58:27)
> On Thu, Aug 02 2018 at 01:27 -0600, Marc Zyngier wrote:
> >
> >Sure. But once woken up (GIC *and* TLMM), the gpio line (which I
> >assume is level) is still high at the TLMM input. So why isn't it
> >registering that state once it has been woken up?
> >
> >I can understand that it would be missing an edge. But that doesn't
> >hold for level signalling.
> >
> Sure, yes. Sorry for not registering your point in my response.
> Once woken up we should see the level interrupt in TLMM.

And the level type gpio interrupt will trigger the TLMM summary
interrupt line after the wakeup? So then the only thing that needs to be
replayed is edge interrupts? How are edge interrupts going to be
replayed?
