From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 3/7] i2c: pxa: add OF support
Date: Mon, 5 Mar 2012 14:41:26 +0000
Message-ID: <201203051441.26774.arnd@arndb.de>
References: <1330950111-30797-1-git-send-email-haojian.zhuang@marvell.com>
 <1330950111-30797-4-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1330950111-30797-4-git-send-email-haojian.zhuang@marvell.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Haojian Zhuang <haojian.zhuang@marvell.com>
Cc: grant.likely@secretlab.ca, eric.y.miao@gmail.com, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 05 March 2012, Haojian Zhuang wrote:
> Append these properties in below.
> mrvl,i2c-polling
> mrvl,i2c-fast-mode
> 
> Still keep slave, slave_addr and class in platform data.
> 
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

Just one tiny detail:

> +       *i2c_types = (u32)(of_id->data);

By convention, please use (unsigned long) as the cast from pointer to an
integer type. While this doesn't make any difference on 32 bit systems,
it's better to always write code that is 64-bit clean.

	Arnd
