From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 01/10] dt-bindings: rtc: Move trivial RTC over to trivial
 devices
Date: Mon, 27 May 2019 18:06:57 +0200
Message-ID: <20190527160657.GN3274@piout.net>
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <20190527120626.GM3274@piout.net>
 <20190527121832.lui2n6vhlemlqy2z@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190527121832.lui2n6vhlemlqy2z@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 27/05/2019 14:18:32+0200, Maxime Ripard wrote:
> Hi Alex,
> 
> On Mon, May 27, 2019 at 02:06:26PM +0200, Alexandre Belloni wrote:
> > On 27/05/2019 14:00:33+0200, Maxime Ripard wrote:
> > > The RTC generic bindings has a bunch of devices that have a pretty simple
> > > binding, with just compatible, reg and optional interrupts properties.
> > >
> >
> > This is not true, they all also support the star-year property, this is
> > why they are not in the trivial-devices file anymore.
> 
> Ok, I misunderstood the binding then.
> 
> Should we create a separate file for the trivial RTC, on the model of
> the trivial-devices but supporting all the RTC properties?
> 

I would say that this is the way forward. Note that all the RTCs support
start-year but you will have to check for the other properties.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
