From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH v2] arm: dts: keystone: add gpio device entry
Date: Thu, 26 Dec 2013 12:56:25 -0500
Message-ID: <52BC6DC9.9030001@ti.com>
References: <1387211981-26045-2-git-send-email-grygorii.strashko@ti.com>
 <1387885972-8275-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1387885972-8275-1-git-send-email-grygorii.strashko@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Strashko, Grygorii" <grygorii.strashko@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 24 December 2013 06:52 AM, Strashko, Grygorii wrote:
> This patch adds Keystone GPIO IP device definitions in DT which supports
> up to 32 GPIO lines and each GPIO line can be configured as separate
> interrupt source (so called "unbanked" IRQ).
> 
> For more information see:
>  http://www.ti.com/lit/ug/sprugv1/sprugv1.pdf
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
> Hi Santosh,
> 
> I've changed format of "interrupts" property as discussed.
> 
Thanks. This version looks better now. Will take this in my
queue.

Regards,
Santosh
