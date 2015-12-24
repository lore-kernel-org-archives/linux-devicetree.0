From: Sergei Ianovich <ynvich@gmail.com>
Subject: Re: [PATCH v5] rtc: support DS1302 RTC on ICP DAS LP-8x4x
Date: Thu, 24 Dec 2015 14:07:48 +0300
Message-ID: <1450955268.15911.85.camel@gmail.com>
References: <397668667-27328-3-git-send-email-ynvich@gmail.com>
	 <1450201525-9137-1-git-send-email-ynvich@gmail.com>
	 <20151220033815.GD9883@rob-hp-laptop> <1450613656.15911.62.camel@gmail.com>
	 <CAL_JsqKxEkuvQ=7=zmb0pkNNyUe9aKzKics43QasUBDM2rmrwA@mail.gmail.com>
	 <20151224110453.GJ8623@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151224110453.GJ8623@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alessandro Zummo <a.zummo@towertech.it>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <rtc-linux@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-12-24 at 12:04 +0100, Alexandre Belloni wrote:
> On 22/12/2015 at 12:16:41 -0600, Rob Herring wrote :
> > Well, the binding should reflect that, whether the driver needs to
> > be
> > re-written is somewhat a separate question. That should probably
> > have
> > been done for the DS1302 driver originally and it is not too fair
> > for
> > the 2nd person to fix it. You could just have a single driver bound
> > to
> > the controller node which is aware of the DS1302 being the slave
> > device (ignoring that part of the DT for now).
> > 
> 
> I agree with Rob here. I won't require that you fix the driver but it
> would be better to have a proper DT binding from the beginning so that
> when the driver is fixed it will still work with the previous device
> trees.

No problem. I'll fix the driver. That's how it should be done.

What should be done with SECUREEDGE support?
