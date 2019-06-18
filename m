From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Tue, 18 Jun 2019 21:22:14 +0200
Message-ID: <b90977f94df020986c6bb490e7fd0262603726b0.camel@sipsolutions.net>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <583907409fad854bd3c18be688ec2724ad7a60e9.camel@sipsolutions.net>
 <31c2c94c-c6d3-595b-c138-faa54d0bfc00@linaro.org>
 (sfid-20190618_160100_881541_6AD64A3C)
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <31c2c94c-c6d3-595b-c138-faa54d0bfc00@linaro.org>
 (sfid-20190618_160100_881541_6AD64A3C)
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alex Elder <elder@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: DTML <devicetree@vger.kernel.org>, syadagir@codeaurora.org, Eric Caruso <ejcaruso@google.com>, Dan Williams <dcbw@redhat.com>, linux-arm-msm@vger.kernel.org, abhishek.esse@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, evgreen@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Networking <netdev@vger.kernel.org>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, linux-soc@vger.kernel.org, David Miller <davem@davemloft.net>, cpratapa@codeaurora.org, Ben Chan <benchan@google.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-06-18 at 09:00 -0500, Alex Elder wrote:

> Deaggregation is a connection property, not a channel property.

That'd make sense, yes.

> And it looks like that's exactly how it's used in the rmnet
> driver.  

Yeah, I think you're right. I got confused by the whole use of "port"
there, but it seems like "port" actually refers to the underlying
netdev.

Which is really strange too, btw, because you configure the "port" to
agg/non-agg when you add a new channel to it ... So it seems like it's
part of the channel configuration, when it's not!

Anyway, I think for now we could probably live with not having this
configurable for the IPA driver, and if it *does* need to be
configurable, it seems like it should be a driver configuration, not a
channel configuration - so something like a debugfs hook if you really
just need to play with it for performance testing, or a module
parameter, or something else?

Or even, in the WWAN framework, a knob that we provide there for the
WWAN device, rather than for the (newly created) channel.

> The hardware is capable of aggregating QMAP packets
> arriving on a connection into a single buffer, so this provides
> a way of requesting it do that.
> 
> > > #define RMNET_FLAGS_INGRESS_MAP_COMMANDS          (1U << 1)
> > 
> > Similar here? If you have flow control you probably want to use it?
> 
> I agree with that, though perhaps there are cases where it
> is pointless, or can't be supported, so one might want to
> simply *not* implement/advertise the feature.  I don't know.

Sure, but then that's likely something the driver would need to know,
not necessarily userspace?

johannes
