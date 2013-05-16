From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Thu, 16 May 2013 02:19:27 +0200
Message-ID: <4404195.qJMM4PHBj7@flatron>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com> <51941F64.9090104@wwwdotorg.org> <CAD=FV=UWftrtEe+qUT92RTd-3BG8hpznu3CtztOfw4eMWOqHrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=UWftrtEe+qUT92RTd-3BG8hpznu3CtztOfw4eMWOqHrw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Doug Anderson <dianders@google.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 15 of May 2013 17:03:44 Doug Anderson wrote:
> Stephen,
> 
> On Wed, May 15, 2013 at 4:51 PM, Stephen Warren <swarren@wwwdotorg.org> 
wrote:
> > I don't really see much disadvantage here; the interrupt bindings
> > specify things related to interrupts and the pinctrl bindings specify
> > thing related to pin configuration.
> 
> OK.  If this is the best way then I can accept that and maybe we
> should just drop this thread.  What do people think?  It means less
> work for me in the short term since I've already got it implemented
> that way and then I don't need to submit any patches to try to change
> things!  ;)
> 
> > If you want to condense the DT, I'd suggest using a the pinctrl
> > hogging
> > feature, i.e. don't put pinctrl-* properties in the trackpad node, but
> > rather define a system-wide "default" pinctrl state in the pin
> > controller node itself. That configuration will be applied as soon as
> > the pin controller driver is registered. That'd be the same as the
> > above, with the following added:
> > 
> > pinctrl@11400000 {
> > 
> >     pinctrl-names = "default";
> >     pinctrl-0 = <&cyapa_irq>;
> > 
> > };
> > 
> > except that the pinctrl-0 property would probably end up configuring a
> > whole bunch of basic pinctrl state rather than just that one interrupt
> > pin.
> > 
> > I prefer to put all the static pinctrl configuration in the pinctrl
> > hog, and only the dynamic stuff in the individual device nodes.
> > 
> > I know LinusW won't like this suggestion much though:-)
> 
> Ah right!  I forgot about hogs in this case.  That's also reasonable
> as a solution and is similar to what we've got in the tree for
> powerdown configuration of pins (I'll try to post this patch soon too,
> WIP at <https://gerrit.chromium.org/gerrit/#/c/51292/> and
> <https://gerrit.chromium.org/gerrit/#/c/51372/>.

Hmm, last thing before I fell asleep: We already have support for power 
down configuration in pinctrl-samsung. See samsung,pin-conpdn and 
samsung,pin-pudpdn.

Also I already have patches for suspend/resume support of pinctrl-samsung 
and pinctrl-exynos, as well as configuration of wake-up sources. I'm going 
to post them soon.

Best regards,
Tomasz
