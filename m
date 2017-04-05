From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 21/23] drivers/fsi: Add SCOM FSI client device driver
Date: Wed, 5 Apr 2017 09:35:56 -0700
Message-ID: <bddbb80e-10b6-fbb9-152a-6e192dfe0745@infradead.org>
References: <20170405020607.79939-1-cbostic@linux.vnet.ibm.com>
 <20170405020607.79939-22-cbostic@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170405020607.79939-22-cbostic@linux.vnet.ibm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, rostedt@goodmis.org, mingo@redhat.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: andrew@aj.id.au, alistair@popple.id.au, linux-kernel@vger.kernel.org, joel@jms.id.au, "Edward A . James" <eajames@us.ibm.com>, benh@kernel.crashing.org, Jeremy Kerr <jk@ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 04/04/17 19:06, Christopher Bostic wrote:
> From: Chris Bostic <cbostic@linux.vnet.ibm.com>
> 
> Create a simple SCOM engine device driver that reads and writes
> its control registers via an FSI bus.
> 
> Includes changes from Edward A. James <eajames@us.ibm.com>.
> 
> Signed-off-by: Chris Bostic <cbostic@linux.vnet.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>  drivers/fsi/Kconfig    |   6 ++
>  drivers/fsi/Makefile   |   1 +
>  drivers/fsi/fsi-scom.c | 263 +++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 270 insertions(+)
>  create mode 100644 drivers/fsi/fsi-scom.c
> 
> diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
> index 9cf8345..0fa265c 100644
> --- a/drivers/fsi/Kconfig
> +++ b/drivers/fsi/Kconfig
> @@ -18,6 +18,12 @@ config FSI_MASTER_GPIO
>  	---help---
>  	This option enables a FSI master driver using GPIO lines.
>  
> +config FSI_SCOM
> +	tristate "SCOM FSI client device driver"
> +	depends on FSI

depends on FSI is redundant.

> +	---help---
> +	This option enables an FSI based SCOM device driver.
> +
>  endif
>  


-- 
~Randy
