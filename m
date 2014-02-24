From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH V8 1/2] PHY: Exynos: Add Exynos5250 SATA PHY driver
Date: Mon, 24 Feb 2014 19:26:44 +0530
Message-ID: <530B4F9C.2050302@ti.com>
References: <1393248775-3283-1-git-send-email-yuvaraj.cd@samsung.com>
 <1393248775-3283-2-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1393248775-3283-2-git-send-email-yuvaraj.cd@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, kgene.kim@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: mark.rutland@arm.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>, swarren@wwwdotorg.org, Girish K S <ks.giri@samsung.com>, Vasanth Ananthan <vasanth.a@samsung.com>, rob.herring@calxeda.com, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

Hi,

On Monday 24 February 2014 07:02 PM, Yuvaraj Kumar C D wrote:
> This patch adds the SATA PHY driver for Exynos5250.Exynos5250 SATA
> PHY comprises of CMU and TRSV blocks which are of I2C register Map.
> So this patch also adds a i2c client driver, which is used configure

We no longer have i2c client driver here.
> the CMU and TRSV block of exynos5250 SATA PHY.
> 
> This patch incorporates the generic PHY framework to deal with SATA
> PHY.

It should be rephrased to have *uses* generic PHY framework. However I feel we
can do away with this line.
> 
> This patch depends on the below patch for the sata functionality
> 	[1].ata: ahci_platform: Manage SATA PHY
> 		by Roger Quadros <rogerq@ti.com>

hasn't this patch merged yet?

Thanks
Kishon
