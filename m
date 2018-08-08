From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH RESEND RFC 1/4] drivers: pinctrl: qcom: add wakeup
 capability to GPIO
Date: Wed, 8 Aug 2018 07:26:32 +0100
Message-ID: <20180808072632.21f076b6@why.wild-wind.fr.eu.org>
References: <20180801020021.9782-1-ilina@codeaurora.org>
        <20180801020021.9782-2-ilina@codeaurora.org>
        <86600uy4vh.wl-marc.zyngier@arm.com>
        <20180801194538.GA6422@codeaurora.org>
        <86wot9wb9u.wl-marc.zyngier@arm.com>
        <20180802065104.GA27850@codeaurora.org>
        <86sh3xw7m9.wl-marc.zyngier@arm.com>
        <20180802125827.GB27850@codeaurora.org>
        <153370830708.220756.4595316550560511917@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153370830708.220756.4595316550560511917@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Lina Iyer <ilina@codeaurora.org>, evgreen@chromium.org, linus.walleij@linaro.org, bjorn.andersson@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 07 Aug 2018 23:05:07 -0700
Stephen Boyd <swboyd@chromium.org> wrote:

> Quoting Lina Iyer (2018-08-02 05:58:27)
> > On Thu, Aug 02 2018 at 01:27 -0600, Marc Zyngier wrote:  
> > >
> > >Sure. But once woken up (GIC *and* TLMM), the gpio line (which I
> > >assume is level) is still high at the TLMM input. So why isn't it
> > >registering that state once it has been woken up?
> > >
> > >I can understand that it would be missing an edge. But that doesn't
> > >hold for level signalling.
> > >  
> > Sure, yes. Sorry for not registering your point in my response.
> > Once woken up we should see the level interrupt in TLMM.  
> 
> And the level type gpio interrupt will trigger the TLMM summary
> interrupt line after the wakeup? So then the only thing that needs to be
> replayed is edge interrupts? How are edge interrupts going to be
> replayed?

Level interrupts should be taken care of without doing anything, by the
very nature of being a level signal.

Edge interrupts should be replayed using check_irq_resend() after
taking the right locks and making the interrupt pending. Or, if there
is a way for SW to make the interrupt pending at the TLMM level, to use
that as a way to reinject the interrupt (which would be the preferred
way, as it avoids all kind of ugly locking considerations).

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.
