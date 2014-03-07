From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/7] of: introduce of_dma_is_coherent() helper
Date: Fri, 7 Mar 2014 17:09:11 +0100
Message-ID: <201403071709.11568.arnd@arndb.de>
References: <1394097598-17622-1-git-send-email-santosh.shilimkar@ti.com>
 <CAL_JsqJ3QhRRNVAsvAPP=Ex_ptQcbpCXh7pf44K1xh+scFqiug@mail.gmail.com>
 <531948A8.9040106@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <531948A8.9040106@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Friday 07 March 2014, Santosh Shilimkar wrote:
> On Friday 07 March 2014 11:55 AM, Rob Herring wrote:
>
> > Thinking about this some more, if the arch is always coherent or
> > always non-coherent, then the default ops are always fine. In that
> > case set_arch_dma_coherent_ops is always a nop and of_dma_is_coherent
> > is a don't care.
> > 
> Hmmm.. I guess you are right. In that case we can drop the need of
> config option.

A compile-time config option clearly would not work here, because it
breaks multiplatform support when some platforms are different from
others. I can still see the possible need for a global run-time setting
though, to give some platform init code the ability to override the
DT flags when it knows better. That is probably what you want to do
on keystone without LPAE.

	Arnd
