From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 2/2] rtc: Add ASPEED RTC driver
Date: Mon, 25 Mar 2019 17:10:10 +0100
Message-ID: <20190325161010.GP30105@piout.net>
References: <20190325133159.10653-1-joel@jms.id.au>
 <20190325133159.10653-3-joel@jms.id.au>
 <20190325145954.GM30105@piout.net>
 <CACPK8XfFTF2hDzwO33gE=fotEEC-CZztThoaYj98Le9JAsAQ-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACPK8XfFTF2hDzwO33gE=fotEEC-CZztThoaYj98Le9JAsAQ-w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-aspeed@lists.ozlabs.org, devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 25/03/2019 15:28:26+0000, Joel Stanley wrote:
> On Mon, 25 Mar 2019 at 14:59, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hi,
> >
> > This seems mostly good to me.
> >
> > On 26/03/2019 00:01:59+1030, Joel Stanley wrote:
> > > +     dev_dbg(dev, "%s: %4d-%02d-%02d %02d:%02d:%02d\n", __func__,
> > > +                     1900 + tm->tm_year, tm->tm_mon + 1, tm->tm_mday,
> > > +                     tm->tm_hour, tm->tm_min, tm->tm_sec);
> > > +
> >
> > We now have %ptR, could you use that?
> 
> I tried this:
> 
>   dev_dbg(dev, "%s: %ptR", __func__, tm);
> 
> Yes, that appears to do the job. Can you make the change when applying?
> 

While doing that change, I relaized that the whole locking is probably
unnecessary as all the rtc_ops are called with the rtc lock taken. If
you are not planning to add alarm support, the lock can be removed.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
