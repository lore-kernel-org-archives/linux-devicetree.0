From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 0/9] Implement clocksource for rockchip SoC using rockchip timer
Date: Mon, 23 Jan 2017 18:12:42 +0100
Message-ID: <1793912.WfGyM7qEjy@diego>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com> <E6DD9335-0D2D-47CB-8098-5F96C2E08139@gmail.com> <20170123144744.GE2166@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170123144744.GE2166@mai>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexander Kochetkov <al.kochet@gmail.com>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, LAK <linux-arm-kernel@lists.infradead.org>, linux-rockchip@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Caesar Wang <wxt@rock-chips.com>, Huang Tao <huangtao@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Am Montag, 23. Januar 2017, 15:47:44 CET schrieb Daniel Lezcano:
> On Wed, Dec 21, 2016 at 05:21:05PM +0300, Alexander Kochetkov wrote:
> > Hello Heiko, Daniel!
> > 
> > Are there any reasons why the patches [1][2] are not applied yet into
> > kernel? How can I help in applying patches?
> 
> Hi Alexander,
> 
> sorry for the delay. Let me review them before taking the patchset.
> 
> Heiko, can you have a look to them also ?

somehow this series moved down to much in my inbox, sorry.

Devicetree changes look good, except where I commented.
I guess it would be best (least intrusive) if I queue up the (then fixed) 
devicetree changes after you are satisfied with the code parts.

I've also looked over the code changes again, test-build them and found the 
build error mentioned separately. Overall they look good though.


Heiko
