From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v2] of/irq: lookup 'interrupts-extended' property first
Date: Fri, 15 Aug 2014 13:51:28 +0100
Message-ID: <20140815125128.A1E62C410ED@trevor.secretlab.ca>
References: <1407355347-30286-1-git-send-email-f.fainelli@gmail.com>
	<20140806201500.GP3711@ld-irv-0074>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140806201500.GP3711@ld-irv-0074>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 6 Aug 2014 13:15:00 -0700, Brian Norris <computersforpeace@gmail.com> wrote:
> On Wed, Aug 06, 2014 at 01:02:27PM -0700, Florian Fainelli wrote:
> > In case the Device Tree blob passed by the boot agent supplies both an
> > 'interrupts-extended' and an 'interrupts' property in order to allow for
> > older kernels to be usable, prefer the new-style 'interrupts-extended'
> > property which conveys a lot more information.
> > 
> > This allows us to have bootloaders willingly maintaining backwards
> > compatibility with older kernels without entirely deprecating the
> > 'interrupts' property.
> > 
> > Update the bindings documentation to describe a situation where both the
> > 'interrupts-extended' and the 'interrupts' property are present, and
> > which one takes precedence over the other.
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Might we add this?
> 
> Cc: <stable@vger.kernel.org> # 3.13+
> 
> Brian

Applied, thanks.

g.
