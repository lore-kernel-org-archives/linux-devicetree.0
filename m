From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: Re: [PATCH] staging: fsl-mc: fix warning in DT ranges parser
Date: Tue, 28 Feb 2017 10:34:02 +0000
Message-ID: <58B55219.4070509@nxp.com>
References: <20170227204235.3547639-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170227204235.3547639-1-arnd@arndb.de>
Content-Language: en-US
Content-ID: <093B06925677204A8B48A614EC3103E3@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Arnd Bergmann <arnd@arndb.de>, Stuart Yoder <stuyoder@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ramiro Oliveira <Ramiro.Oliveira@synopsys.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, German Rivera <german.rivera@nxp.com>, Frank Rowand <frowand.list@gmail.com>, Itai Katz <itai.katz@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 02/27/2017 10:42 PM, Arnd Bergmann wrote:
> The fsl-mc-bus driver in staging contains a copy of the standard
> 'ranges' property parsing algorithm with a hack to treat a missing
> property the same way as an empty one. This code produces false-positive
> warnings for me in an allmodconfig build:
>
> drivers/staging/fsl-mc/bus/fsl-mc-bus.c: In function 'fsl_mc_bus_probe':
> drivers/staging/fsl-mc/bus/fsl-mc-bus.c:645:6: error: 'mc_size_cells' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> drivers/staging/fsl-mc/bus/fsl-mc-bus.c:682:8: error: 'mc_addr_cells' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> drivers/staging/fsl-mc/bus/fsl-mc-bus.c:644:6: note: 'mc_addr_cells' was declared here
> drivers/staging/fsl-mc/bus/fsl-mc-bus.c:684:8: error: 'paddr_cells' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> drivers/staging/fsl-mc/bus/fsl-mc-bus.c:643:6: note: 'paddr_cells' was declared here
>
> To avoid the warnings, I'm simplifying the argument handling to pass
> the number of valid ranges in the property as the function return code
> rather than passing it by reference. With this change, gcc can see that
> we don't evaluate the cell numbers for an missing ranges property.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me, i've tested it and did not see any issues, so here's an:

Acked-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>

---
Thanks & Best Regards, Laurentiu
