From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] ARM: dts: at91: Avoid colliding 'display' node and
 property names
Date: Tue, 16 Jul 2019 12:15:24 +0200
Message-ID: <20190716101524.GM4732@piout.net>
References: <20190516225614.1458-1-robh@kernel.org>
 <20190520145830.GE3274@piout.net>
 <CAL_JsqK0piWGQBeqcOceF=fSX4vSW7_vyv0qAAxz-bg25qEVow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqK0piWGQBeqcOceF=fSX4vSW7_vyv0qAAxz-bg25qEVow@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 15/07/2019 15:45:24-0600, Rob Herring wrote:
> On Mon, May 20, 2019 at 8:58 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 16/05/2019 17:56:14-0500, Rob Herring wrote:
> > > While properties and child nodes with the same name are valid DT, the
> > > practice is not encouraged.
> >
> > I don't see anything mentioning that in the devicetree specification. I
> > think this is something you should add if you don't want that to happen
> > again.
> 
> I suppose, but I prefer tools to enforce it.
> 
> >
> > > Furthermore, the collision is problematic for
> > > YAML encoded DT. Let's just avoid the issue and rename the nodes.
> > >
> >
> > Or maybe you should fix the tool ;)
> 
> You mean the YAML and JSON specifications because the problem is it is
> not valid YAML? (I think YAML allowed it at one time, but it is
> deprecated) The only way to fix it in the tool would be to define some
> way to handle the collision like renaming properties and then undoing
> that.
> 
> > Do you plan to enforce it at some point? How close are you?
> 
> Soon as this patch is merged. There's a switch in parsing tools to
> disallow the collision, so it will be an error instead of a warning.
> 
> > > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Is someone going to apply this?
> 

I'll apply it for the next cycle, sorry about that.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
