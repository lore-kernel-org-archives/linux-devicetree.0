From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND v2 0/3] bus: add Broadcom GISB bus arbiter
 timeout/error handler
Date: Sat, 24 May 2014 01:00:32 +0200
Message-ID: <201405240100.32725.arnd@arndb.de>
References: <1400529962-9612-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1400529962-9612-1-git-send-email-f.fainelli@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Alexander Shiyan <shc_work@mail.ru>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Randy Dunlap <rdunlap@infradead.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Huang Shijie <b32955@freescale.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, arm@kernel.org, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 19 May 2014, Florian Fainelli wrote:
> Hi all,
> 
> This patch adds support for the Broadcom GISB bus arbiter timeout/error handler.
> GISB is a custom and proprietary bus used in the Broadcom Set Top Box devices
> exclusively. The bus arbiter offers the possibly to decode faulting masters as
> well as masters that are timing out on the bus.
> 
> V2 addresses some comments made by Arnd, and widens the audience by posting
> on linux-arm-kernel as well.
> 
> These patches should be merged via the 'arm-soc' tree. I am resending those
> such that every mailing-list has them in copy.
> 
> Thank you!

Applied to the next/drivers branch now. I've changed the Kconfig and Makefile
slightly to maintain alphabetical ordering, which helps avoid a merge conflict
with the vexpress drivers.

	Arnd
