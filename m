From: Johan Hovold <johan@kernel.org>
Subject: Re: [PING 2] [PATCH v5 1/7] nfc: pn533: i2c: "pn532" as dt
 compatible string
Date: Mon, 5 Aug 2019 14:42:36 +0200
Message-ID: <20190805124236.GG3574@localhost>
References: <20190111161812.26325-1-poeschel@lemonage.de>
 <20190228104801.GA14788@lem-wkst-02.lemonage>
 <20190403094735.GA19351@lem-wkst-02.lemonage>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190403094735.GA19351@lem-wkst-02.lemonage>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, "open list:NFC SUBSYSTEM" <linux-wireless@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 03, 2019 at 11:47:35AM +0200, Lars Poeschel wrote:
> Second Ping.

> On Thu, Feb 28, 2019 at 11:48:01AM +0100, Lars Poeschel wrote:
> > A gentle ping on this whole patch series.

> > On Fri, Jan 11, 2019 at 05:18:04PM +0100, Lars Poeschel wrote:
> > > It is favourable to have one unified compatible string for devices that
> > > have multiple interfaces. So this adds simply "pn532" as the devicetree
> > > binding compatible string and makes a note that the old ones are
> > > deprecated.
> > > 
> > > Cc: Johan Hovold <johan@kernel.org>
> > > Signed-off-by: Lars Poeschel <poeschel@lemonage.de>

You may want to resend this series to netdev now. David Miller will be
picking up NFC patches directly from there.

Johan
