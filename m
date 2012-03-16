From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH v4] ARM: SPEAr600: Add device-tree support to SPEAr600
 boards
Date: Fri, 16 Mar 2012 12:51:56 +0100
Message-ID: <20120316115156.GG7757@game.jcrosoft.org>
References: <1331890216-8361-1-git-send-email-sr@denx.de>
 <4F630D39.2090905@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4F630D39.2090905@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Viresh Kumar <viresh.kumar@st.com>
Cc: spear-devel <spear-devel@list.st.com>, Stefan Roese <sr@denx.de>, "devicetree-discuss@ozlabs.org" <devicetree-discuss@ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On 15:21 Fri 16 Mar     , Viresh Kumar wrote:
> On 3/16/2012 3:00 PM, Stefan Roese wrote:
> > This patch adds a generic target for SPEAr600 board that can be
> > configured via the device-tree. Currently the following devices
> > are supported via the devicetree:
> > 
> > - VIC interrupts
> > - PL011 UART
> > - PL061 GPIO
> > - Synopsys DW I2C
> > - Synopsys DW ethernet
> > 
> > Signed-off-by: Stefan Roese <sr@denx.de>
> > Cc: Viresh Kumar <viresh.kumar@st.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> 
> Acked-by: Viresh Kumar <viresh.kumar@st.com>
> 
> I have one query (as part of my learning of DT) to all DT experts:
> 
> > 
> > +                       /* local/cpu GPIO */
> > +                       gpio0: gpio@f0100000 {
> > +                               #gpio-cells = <2>;
> > +                               compatible = "arm,pl061", "arm,primecell";
> > +                               gpio-controller;
> > +                               reg = <0xf0100000 0x1000>;
> > +                               interrupt-parent = <&vic0>;
> > +                               interrupts = <18>;
> > +                       };
> > +
> > 
> 
> Can we add name property here:
> 				name = "gpio0"
> 
> So that we don't need to do below stuff.
no the nae of the device is f0100000.gpio"

so what do stefan is right

Best Regards,
J.
