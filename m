From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: hisilicon: DT: Drop console= and earlyprintk
 bootargs parameter
Date: Fri, 09 Oct 2015 20:26:07 +0200
Message-ID: <9558245.SAyWiXU6Yf@wuerfel>
References: <5617E6FC.6090304@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5617E6FC.6090304@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wei Xu <xuwei5@hisilicon.com>
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Linuxarm <linuxarm@huawei.com>, Yanhaifeng <yanhaifeng@hisilicon.com>, linux-kernel <linux-kernel@vger.kernel.org>, Jiancheng Xue <xuejiancheng@huawei.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Olof Johansson <olof@lixom.net>, Zhangfei Gao <zhangfei.gao@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Friday 09 October 2015 17:10:36 Wei Xu wrote:
> Replace console with stdout-path so that we don't have to put the
> console on the kernel command line.
> 
> Remove earlyprintk to allow the kernel to boot on a system even
> if DEBUG_LL is configured for another system.
> 
> Signed-off-by: Wei Xu <xuwei5@hisilicon.com>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> 

Looks good to me. Do you want us to apply the patch directly, or
do you plan to send a pull request?

	Arnd
