Return-Path: <SRS0=qjSo=MA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from bastet.se.axis.com ([195.60.68.11]:42803 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbeIRQ5a (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Sep 2018 12:57:30 -0400
Date: Tue, 18 Sep 2018 13:25:17 +0200
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpio: Add binding for gpio-mockup
Message-ID: <20180918112516.vf2nussdavzhtsxo@axis.com>
References: <20180905132618.31274-1-vincent.whitchurch@axis.com>
 <20180905132618.31274-2-vincent.whitchurch@axis.com>
 <CACRpkdaOU+dumvVsrsjm5C=uo-cKLKqG2iwAwy=Xh9vbjq3UtQ@mail.gmail.com>
 <CAMRc=McbWJdaKbWnoXF7+-TTKA=dkWCnHJmZybcfQOPNcm9q+A@mail.gmail.com>
 <CACRpkdaFsdk8LKOQcQ4pab1J_LKo8+StCF9f93+1PX_0hm+Cug@mail.gmail.com>
 <5b9f3f64.1c69fb81.6cb6.b5ef@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b9f3f64.1c69fb81.6cb6.b5ef@mx.google.com>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sun, Sep 16, 2018 at 06:24:52PM -0500, Rob Herring wrote:
> On Thu, Sep 06, 2018 at 02:47:23PM +0200, Linus Walleij wrote:
> > On Thu, Sep 6, 2018 at 1:09 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > 
> > > Do we even need DT bindings for this? Device tree bindings mean that
> > > we commit to a stable interface so that once a device with given DT
> > > blob is released, it will work on every future kernel. Also: DT should
> > > only include information about actual HW, not operating system
> > > concepts. Meanwhile this is for testing purposes only and it won't end
> > > up in any actual DT source file upstream.
> > 
> > Hm that relates to another discussion I have with the DT maintainers
> > about a virtualized display panel.
> > 
> > I do not know how the DT maintainers feel about supporting things
> > in the kernel that uses DT infrastructure and specially tailored
> > device trees but include elements with no formal device tree
> > bindings. Would be interesting to hear their thoughts on this.
> 
> I have one usecase in mind where I think it is valid, but for this case 
> in particular, I think it would be better to just provide a sysfs 
> interface. If there's no GPIO binding connections to this mockup 
> controller, there's no real need for DT. OTOH, if this device allowed 
> building a test framework for all the other GPIO based drivers and 
> bindings such as LED, PWM, bitbanged buses, etc.

My original usecase for this was for leds-gpio.  I used the DT bindings
added by this patch and hooked up a leds-gpio via DT in order to develop
userspace.  Once the hardware with the GPIO expander arrived, the mockup
device in the DT was replaced with the expander.  I don't see how a
sysfs interface would allow the same thing.
