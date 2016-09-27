From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [RFC/PATCH] usb: misc: Add a driver for TC7USB40MU
Date: Tue, 27 Sep 2016 14:25:44 -0700
Message-ID: <147501154421.20482.11679706034780655409@sboyd-linaro>
References: <20160914014246.31847-1-stephen.boyd@linaro.org>
 <147384330268.13546.17843140335600627152@sboyd-linaro>
 <20160917011605.GB10392@b29397-desktop>
 <147457026249.9057.8712383708019243942@sboyd-linaro>
 <20160926032927.GA25395@b29397-desktop>
 <147491549050.5206.9497559526723777799@sboyd-linaro>
 <20160927045357.GB27697@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160927045357.GB27697@b29397-desktop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: devicetree@vger.kernel.org, Peter Chen <peter.chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, robh+dt@kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Peter Chen (2016-09-26 21:53:58)
> On Mon, Sep 26, 2016 at 11:44:50AM -0700, Stephen Boyd wrote:
> > Quoting Peter Chen (2016-09-25 20:29:27)
> > > On Thu, Sep 22, 2016 at 11:51:02AM -0700, Stephen Boyd wrote:
> > > > Quoting Peter Chen (2016-09-16 18:16:05)
> > > > > On Wed, Sep 14, 2016 at 01:55:02AM -0700, Stephen Boyd wrote:
> > > > > > Quoting Stephen Boyd (2016-09-13 18:42:46)
> > > > > > 
> > > > > >       soc {
> > > > > >               usb@78d9000 {
> > > > > >                       extcon = <&usb_id>, <&usb_id>;
> > > > > 
> > > > > Why you have two same extcon phandler? From my mind, one should id,
> > > > > another should is vbus. Besides, I find extcon-usb-gpio.c is lack of
> > > > > vbus support, how you support vbus detection for
> > > > > connection/disconnection with PC for your chipidea msm patch set?
> > > > 
> > > > This was already in the dts files for db410c. In the chipidea binding
> > > > one is for EXTCON_USB (vbus) and one is for EXTCON_USB_HOST (id). My
> > > > understanding is that extcon-usb-gpio.c sends events for both EXTCON_USB
> > > > and EXTCON_USB_HOST when the gpio changes state. vbus detection is not
> > > > that great on this board because we only have on gpio for this.
> > > 
> > > I think extcon-usb-gpio.c needs to extend for supporting vbus event,
> > > otherwise, the micro-b cable's connect/disconnect will introduce
> > > EXTCON_USB_HOST event, if you use two <&usb_idx> for both id and
> > > vbus event.
> > > 
> > 
> > Sorry, I'm lost now. extcon-usb-gpio.c already supports EXTCON_USB as an
> > event. Is the problem that we're using two of the same phandles in the
> > binding?
> 
> No, ID and VBUS are different events.
> 
> http://www.spinics.net/lists/linux-usb/msg147004.html
> 

Agreed. But we only register for EXTCON_USB or EXTCON_USB_HOST for each
phandle in the list respectively based on the index of the phandle. So
with or without the patch you mention I don't see how it matters.

We do it this way to trigger the role switch when the cable is
disconnected. I think the problem with just having the id phandle is
that we'll never see the vbus event, and so the role switch doesn't
work.
