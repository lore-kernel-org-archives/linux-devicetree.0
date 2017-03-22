From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: Document rk3399 Gru/Kevin
Date: Wed, 22 Mar 2017 10:56:37 -0700
Message-ID: <20170322175636.GA98450@google.com>
References: <20170320235344.126298-1-briannorris@chromium.org>
 <20170320235344.126298-2-briannorris@chromium.org>
 <3700058.o6cBinDvsr@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3700058.o6cBinDvsr@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Caesar Wang <wxt@rock-chips.com>, Doug Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Stephen Barber <smbarber@chromium.org>, linux-arm-kernel@lists.infradead.org, Chris Zhong <zyw@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 22, 2017 at 10:01:00AM +0100, Heiko Stuebner wrote:
> Am Montag, 20. März 2017, 16:53:41 CET schrieb Brian Norris:
> > Gru is a base dev board for a family of devices, including Kevin. Both
> > utilize Rockchip RK3399, and they share much of their design.
> > 
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > Acked-by: Rob Herring <robh@kernel.org>
> 
> applied for 4.12, after adding a "(Samsung Chromebook Plus)" hint, as that may 
> help people identifying the correct dts and also is public knowledge (some 
> blogs but also /proc/device-tree/compatible on the device itself).

Oh, thanks. There wasn't a public name when I first started sending this
series :)

Brian
