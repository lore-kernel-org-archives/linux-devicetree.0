From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH 02/21] usb: ulpi: Support device discovery via DT
Date: Tue, 28 Jun 2016 11:27:12 -0700
Message-ID: <146713843204.31418.2851512559600064552@sboyd-linaro>
References: <20160626072838.28082-1-stephen.boyd@linaro.org>
 <20160626072838.28082-3-stephen.boyd@linaro.org>
 <20160627143422.GB21398@kuha.fi.intel.com>
 <146706544012.30684.15569003844798199881@sboyd-linaro>
 <20160628114205.GA3378@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160628114205.GA3378@kuha.fi.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Felipe Balbi <balbi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Heikki Krogerus (2016-06-28 04:42:05)
> On Mon, Jun 27, 2016 at 03:10:40PM -0700, Stephen Boyd wrote:
> > 
> > Right, I would have to make up some IDs in this case. I suppose I can
> > use the qcom vendor ID 0x05c6 and then product ids 0 and 1 for HS phy
> > and HSIC phy? That doesn't make me feel great because it's all made up,
> > but I guess there's no other option. I hope they don't decide to start
> > populating these ids in the future though and then we may have
> > conflicting product ids. If that happens I suppose we can do a
> > workaround based on compatible strings in the DT node. Fun!
> > 
> > Nice side effect of all that is I can drop requesting the module by DT
> > aliases and things become simpler. I'll try this out.
> 
> I was hoping that we could manage with product id 0 as an exception (I
> failed to consider that you have multiple PHYs to deal with). I don't
> think we can just come up with product id > 0.
> 
> I guess we should have the of_driver_match_device() call after all.
> Let's just call it conditionally, only in cases where there is no
> product ID, to make me feel a bit more better. I don't want to make it
> too easy to use.
> 
> The properties for the vendor and product ID are still something that
> we need to introduce in any case. We have the powered off problem on
> all kinds of platforms, and not all of them use DT. Please feel free
> to incorporate the diff into the patch you had for the powered off
> case if you are OK with it. So I think in your case you would just
> need to addthe correct ulpi-vendor id 0x05c6 and ulpi-product id 0 to
> the chipidea device node, and I think this would work.
> 

Hmm ok. I'll have to bring back all the module loading and uevent stuff
based on DT compatible strings then. We'll have the same product id on
HSIC and HS phys, but that isn't a big deal.
