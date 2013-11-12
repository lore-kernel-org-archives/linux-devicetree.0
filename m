From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 01/12] mtd: nand: davinci: fix driver registration
Date: Tue, 12 Nov 2013 10:45:34 -0500
Message-ID: <52824D1E.9080409@ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-2-git-send-email-ivan.khoronzhuk@ti.com>
 <4F5844B3A985794BA902E12C070812375F8CE2@DNCE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4F5844B3A985794BA902E12C070812375F8CE2@DNCE04.ent.ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Strashko,
 Grygorii" <grygorii.strashko@ti.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Rob Landley <rob@landley.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Monday 11 November 2013 11:52 AM, Khoronzhuk, Ivan wrote:
> 
> When kernel is booted using DT, there is no guarantee that Davinci
> NAND device has been created already at the time when driver init
> function is executed. Therefore, platform_driver_probe() can't be used
> because this may result the Davinci NAND driver will never be probed.
> The driver probing has to be made with core mechanism.
> 
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---
Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
