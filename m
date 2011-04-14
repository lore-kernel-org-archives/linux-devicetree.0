From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH] ARM: add DT support to the S3C SDI driver
Date: Thu, 14 Apr 2011 11:51:50 +0300
Message-ID: <201104141151.50497.anarsoul@gmail.com>
References: <20110413172547.GA27819@dandreoli.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110413172547.GA27819@dandreoli.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Domenico Andreoli <cavokz@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 13 April 2011 20:25:47 Domenico Andreoli wrote:
> From: Domenico Andreoli <cavokz@gmail.com>
> 
> This patch adds DeviceTree support to the S3C SDI driver.
> 
> It implements all the configurations of the platform driver except the
> set_power() callback and the ocr_avail mask.
> 
> Signed-off-by: Domenico Andreoli <cavokz@gmail.com>

Hm, but is there any bootloader with dt support for s3c24xx?

Regards
Vasily
