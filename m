From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 0/6] Update Davinci watchdog driver
Date: Mon, 25 Nov 2013 18:36:52 +0530
Message-ID: <52934B6C.4060308@ti.com>
References: <1384795139-19466-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1384795139-19466-1-git-send-email-ivan.khoronzhuk@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Strashko Grygorii <grygorii.strashko@ti.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 18 November 2013 10:48 PM, Ivan Khoronzhuk wrote:
> These patches are intended to update Davinci watchdog to use WDT core
> and reuse driver for keystone arch, because Keystone uses the similar
> IP like Davinci.

This series causes a regression on all DaVinci platforms because after
the series is applied the watchdog device does not get registered at
all. Since you changed the device name please include a patch to fix the
platform references too.

Thanks,
Sekhar
