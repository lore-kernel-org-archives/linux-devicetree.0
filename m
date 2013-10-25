From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 3/4] ARM: dts: i.MX53: dts for Voipac x53-dmm-668 module
Date: Fri, 25 Oct 2013 09:27:28 +0800
Message-ID: <20131025012725.GG14529@S2101-09.ap.freescale.net>
References: <1382461643-16790-1-git-send-email-lisovy@gmail.com>
 <1382461643-16790-4-git-send-email-lisovy@gmail.com>
 <20131023072738.GI2839@S2101-09.ap.freescale.net>
 <1382641926.16515.2.camel@lolumad>
 <CAHCPf3vB+HYkFoBYcbVM6Ecp+8BSApG2JZi1PRwc7ag6ygszOw@mail.gmail.com>
 <1382644733.19373.2.camel@lolumad>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1382644733.19373.2.camel@lolumad>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rostislav Lisovy <lisovy@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Matt Sealey <neko@bakuhatsu.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, pisa@cmp.felk.cvut.cz
List-Id: devicetree@vger.kernel.org

On Thu, Oct 24, 2013 at 09:58:53PM +0200, Rostislav Lisovy wrote:
> I saw that most of the vendor prefixes are somehow shortened (e.g.
> Freescale -- fsl, etc.).

The 'fsl' is the stock symbol of Freescale.  If that's not the case for
voipac, I think 'voipac' is more appropriate.

Shawn

> On Thu, 2013-10-24 at 14:49 -0500, Matt Sealey wrote: 
> > On Thu, Oct 24, 2013 at 2:12 PM, Rostislav Lisovy <lisovy@gmail.com> wrote:
> > > Dear Shawn;
> > > Thank you for your comments.
> > > Should I also add Voipac to
> > > Documentation/devicetree/bindings/vendor-prefixes.txt?
> > 
> > I would agree with that, but why is your chosen prefix "vp" instead of
> > "voipac" anyway?
> > 
> 
> 
