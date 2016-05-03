From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V5 2/6] of/slimbus: OF helper for SLIMbus
Date: Tue, 03 May 2016 21:26:25 +0200
Message-ID: <2394122.1OlmZMdZVa@wuerfel>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org> <1461801489-16254-3-git-send-email-sdharia@codeaurora.org> <20160503161156.GA12898@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160503161156.GA12898@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sagar Dharia <sdharia@codeaurora.org>, gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 03 May 2016 11:11:56 Rob Herring wrote:
> > +
> > +Child nodes:
> > +Every SLIMbus controller node can contain zero or more child nodes
> > +representing slave devices on the bus. Every SLIMbus slave device is
> > +uniquely determined by the enumeration address containing 4 fields:
> > +Manufacturer ID, Product code, Device index, and Instance value for
> > +the device.
> > +If child node is not present and it is instantiated after device
> > +discovery (slave device reporting itself present),
> > +its name will be in this format: "217:60:1:0"
> > +
> > +However, the device may need additional non-standard way to power it
> > +up so that it can start functioning. In that case, child node will
> > +need to be present as slave of the slimbus-controller device.
> > +The compatible property will be necessary so that corresponding
> > +driver can probe and execute the required procedure to make it
> > +functional.
> > +
> > +Required property for SLIMbus child node if it is present:
> > +- reg                - enumeration address fields of the device
> > +
> > +- compatible - name of SLIMbus child node using practice typically
> > +             followed by discoverable buses:
> > +             "<manufacturer>,<product-model>", "slim"
> 
> Im most cases for compatible strings on discoverable buses, the VID and 
> PID (and perhaps more) are used to form the compatible string. See USB 
> binding for a recent example. This will save you from having to make up 
> strings for every device.

Actually it seems like the current binding puts the same manufacturer ID
and product ID pair into both address and compatible string. Is that
correct?

I would have expected the address to have only index and instance fields
and the compatible string match whatever we can detect by looking at
that device. This has probably been discussed 5 years ago when the
patches were first posted, but I don't remember the outcome.

	Arnd
