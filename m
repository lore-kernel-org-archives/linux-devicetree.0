From: Xiubo Li-B47053 <B47053@freescale.com>
Subject: RE: [PATCHv4 4/4] Documentation: Add device tree bindings for
 Freescale FTM PWM.
Date: Mon, 16 Sep 2013 02:49:06 +0000
Message-ID: <1DD289F6464F0949A2FCA5AA6DC23F82833236@039-SN2MPN1-013.039d.mgd.msft.net>
References: <1379051922-4930-1-git-send-email-Li.Xiubo@freescale.com>
 <1379051922-4930-5-git-send-email-Li.Xiubo@freescale.com>
 <523392EA.6050909@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <523392EA.6050909@wwwdotorg.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Guo Shawn-R65073 <r65073@freescale.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "rob@landley.net" <rob@landley.net>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "t.figa@samsung.com" <t.figa@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> > +- fsl,pwm-counter-clk: The FTM PWM counter clock source, should be
> > +one of the
> > +  entries in clock-names.
> 
> So the IP block has 3 input clocks, and also a mux to select which one to
> use? That sounds slightly unusual, but possible.
> 
> If there is really only 1 clock input to the IP block, and the mux is
> part of some other module, then this binding should have only 1 entry in
> clocks.
> 

Yes, there are 3 input clocks that can be selectable, and the mux is inside the FTM IP block.


Thanks.

--
Best Regard,
Xiubo
