From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 2/2] rtc: Add ASPEED RTC driver
Date: Wed, 27 Mar 2019 01:00:56 +0000
Message-ID: <CACPK8Xe0h2iVbuXApccrZD8Qxo4QEpe5Y4OgW1i7GsPfmJKbvQ@mail.gmail.com>
References: <20190325133159.10653-1-joel@jms.id.au>
 <20190325133159.10653-3-joel@jms.id.au>
 <20190325145954.GM30105@piout.net>
 <CACPK8XfFTF2hDzwO33gE=fotEEC-CZztThoaYj98Le9JAsAQ-w@mail.gmail.com>
 <20190325161010.GP30105@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190325161010.GP30105@piout.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-aspeed@lists.ozlabs.org, devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 25 Mar 2019 at 16:10, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:> >
> While doing that change, I relaized that the whole locking is probably
> unnecessary as all the rtc_ops are called with the rtc lock taken. If
> you are not planning to add alarm support, the lock can be removed.

I had a stab at alarm support, but the select() tests in rtctest.c
were failing. I will submit a v3 without the locking so we can get
that out of the way, and defer adding alarm support for now.

Cheers,

Joel
