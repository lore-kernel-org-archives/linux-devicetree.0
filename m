From: Michael Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v4 3/5] clk: add lpc18xx ccu clk driver
Date: Thu, 18 Jun 2015 15:45:38 -0700
Message-ID: <20150618224538.9112.61682@quantum>
References: <1432845107-12458-1-git-send-email-manabian@gmail.com>
 <1432845107-12458-4-git-send-email-manabian@gmail.com>
 <20150610021315.6017.58085@quantum>
 <CAGhQ9VwONWTULGUbGuf_2HbLpfU4pp8S49xdtoCcKcm1p=n7hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGhQ9VwONWTULGUbGuf_2HbLpfU4pp8S49xdtoCcKcm1p=n7hg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Quoting Joachim Eastwood (2015-06-10 07:02:59)
> Hi Mike,
> 
> 
> > Hi Joachim,
> >
> > If it were me, I would have broken this up into two tables, one for each
> > CCU. In general I would structure the code to reflect the fact that two
> > different IP blocks are being accessed. This isn't a deal breaker but I
> > thought I would mention it in case you want to make the change.
> >
> > Otherwise this series looks good to me. Let me know if you plan a V5
> > submission.
> 
> If there is still time for 4.2 and you don't have any more comments on
> how the driver uses the DT bindings I would rather send a follow up
> patch that splits the ccu table for 4.3.
> 
> 
> > I can take patches #1-4 into the clk tree. Please add my Acked-by to
> > patch #5. I will create an immutable branch to share with the arm-soc
> > tree so that they can take #5 and have access to the dt-bindings
> > headers.
> 
> Sounds good. I'll talk to arm-soc team about it. But it isn't critical
> for me to get the DTS changes in for 4.2, but I would be very grateful
> for getting the drivers and headers in for 4.2 so that 4.3 is ready
> and doesn't have any header dependencies for all the driver DTS stuff.

Patches #1-4 applied to clk-next for 4.2.

Regards,
Mike

> 
> Thanks, Mike.
> 
> 
> regards,
> Joachim Eastwood
