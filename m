From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/5] gpio: of: Add support to have multiple gpios in
 gpio-hog
Date: Thu, 17 Mar 2016 10:46:56 -0500
Message-ID: <20160317154656.GA9444@rob-hp-laptop>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
 <56E05AA9.8000503@wwwdotorg.org>
 <56E11D34.60401@nvidia.com>
 <2337414.ntEtcfKnX0@hermes>
 <56E16053.60802@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56E16053.60802@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Markus Pargmann <mpa@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, treding@nvidia.com, Benoit Parrot <bparrot@ti.com>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 10, 2016 at 05:23:55PM +0530, Laxman Dewangan wrote:
> 
> On Thursday 10 March 2016 04:46 PM, Markus Pargmann wrote:
> >On Thursday 10 March 2016 12:37:32 Laxman Dewangan wrote:
> >>On Wednesday 09 March 2016 10:47 PM, Stephen Warren wrote:
> >>>On 03/09/2016 06:20 AM, Laxman Dewangan wrote:
> >>>The problem with that is the description used when acquiring the GPIO
> >>>is just "wlan_input", "wlan_output", or "wlan_control". There's
> >>>nothing to indicate what those individual pins do (perhaps one is a
> >>>reset signal, one is a regulator enable, etc.?) By requiring separate
> >>>nodes for each GPIO, then the node name can provide a meaningful
> >>>semantic name/description for each GPIO, which provides much more
> >>>information.

I agree.

> >>On this case, we have already property "line-name" and passed the name
> >>of the gpio via this property.
> >>The property names is "line-name" which is good for one string. We can
> >>support other property "line-names" with multiple string per GPIO index.
> >>
> >>line-names = "wlan-reset", "wlan-enable";

Then what happens when someone wants to selectively disable gpio hogs?

status = "okay", "disabled", "okay";

While I often push things to fewer nodes and more compact descriptions, 
I don't think that is the right direction in this case.

> >There is currently a discussion about the future bindings for subnodes in GPIO
> >controller nodes. Please have a look at these two mail threads:
> >
> >	"Device tree binding documentation for gpio-switch"
> >	"gpio: of: Add support to have multiple gpios in gpio-hog"
> 
> Second one is this patch only. Is it by intention?
> 
> The binding details about the gpio-switch and names are given by property
> "lable". I think property "label" is standard way of going forward i.e. I
> post similar patch for gpio-keys device name from DT after got review
> comment.
> 
> So here,  we can have the gpio names  under property "label" or "labels".

label is standard. labels you just made up.

> Or am I missing anything?

The point is the more one off changes I see that are all inter-related, 
the less willing I am to accept any that don't consider all the cases. 
The inter-relationship here is how do we describe gpio lines that don't 
otherwise have a connection to another node and how to deal with them if 
that changes.

Rob
