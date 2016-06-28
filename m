From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH] usb: misc: Add driver for usb4604
Date: Tue, 28 Jun 2016 15:24:36 -0700
Message-ID: <146715267666.31418.16063659578272167797@sboyd-linaro>
References: <20160626052454.7743-1-stephen.boyd@linaro.org>
 <20160628205637.GO3737@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160628205637.GO3737@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2016-06-28 13:56:37)
> On Sat, Jun 25, 2016 at 10:24:54PM -0700, Stephen Boyd wrote:
> > +
> > +Examples:
> > +     usb-hub@2d {
> 
> I'm not sure what we'll do when/if we need this as a USB bus child node.
> 
 
I'll need to do something there soon. Right now, I have to probe this
device driver first before probing the HSIC controller, or this hub
never enumerates itself on the USB bus (when it does enumerate I see two
devices on the hub itself). I was thinking of holding some phandle in
the HSIC controller node to this i2c device and then probe deferring at
usb_add_hcd() until this device had probed. That solution still doesn't
feel great though because we really need to express that the hub needs
to be in "HUB" mode instead of just probed. Dual bus devices are a real
pain!
