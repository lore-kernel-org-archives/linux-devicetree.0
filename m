From: Pavel Machek <pavel@denx.de>
Subject: Re: [RESEND PATCH 1/2] ARM: dts: Change dw-apb-timer-osc and
 dw-apb-timer-sp to just dw-apb-timer
Date: Thu, 8 Aug 2013 23:01:08 +0200
Message-ID: <20130808210108.GA17855@amd.pavel.ucw.cz>
References: <1375740158-10012-1-git-send-email-dinguyen@altera.com>
 <5203FCEA.7040709@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5203FCEA.7040709@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Rutland <mark.rutland@arm.com>, dinh.linux@gmail.com, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, John Stultz <john.stultz@linaro.org>, Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>, dinguyen@altera.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

On Thu 2013-08-08 14:17:46, Stephen Warren wrote:
> On 08/05/2013 04:02 PM, dinguyen@altera.com wrote:
> > From: Dinh Nguyen <dinguyen@altera.com>
> > 
> > "dw-apb-timer-osc" and "dw-apb-timer-sp" are the same implementation of the
> > DW APB timer, just fed by different clocks.
> 
> I assume patch 1/1 made similar changes to the driver?
> 
> > diff --git a/Documentation/devicetree/bindings/rtc/dw-apb.txt b/Documentation/devicetree/bindings/rtc/dw-apb.txt
> 
> >  Required properties:
> > -- compatible: "snps,dw-apb-timer-sp" or "snps,dw-apb-timer-osc"
> > +- compatible: "snps,dw-apb-timer"
> 
> This change is problematic w.r.t device tree as an ABI. any DT that uses
> the new value "snps,dw-apb-timer" will not work with older software that
> was written to expect the old values.

I'm pretty sure there's no such software out there. Actually, I don't
think timers ever worked properly on any mainline kernels.

So I believe we can still fix it the right way... it is same hardware
with different labels after all.

Thanks,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
