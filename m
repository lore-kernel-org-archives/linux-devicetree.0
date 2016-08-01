From: Hoan Tran <hotran@apm.com>
Subject: Re: [PATCH v3 2/3] hwmon: xgene: Add hwmon driver
Date: Mon, 1 Aug 2016 09:39:31 -0700
Message-ID: <CAFHUOYzpD2J_uqdeFqVJk9jMw2J2fN5nGxqt2Xu-=0HXooHNdg@mail.gmail.com>
References: <1469134557-26869-3-git-send-email-hotran@apm.com>
 <201608012126.BWziGkjc%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201608012126.BWziGkjc%fengguang.wu@intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kbuild test robot <lkp@intel.com>
Cc: linux-hwmon@vger.kernel.org, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Jean Delvare <jdelvare@suse.com>, linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Duc Dang <dhdang@apm.com>, Jassi Brar <jassisinghbrar@gmail.com>, linux-doc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, kbuild-all@01.org, Guenter Roeck <linux@roeck-us.net>, Loc Ho <lho@apm.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Aug 1, 2016 at 6:21 AM, kbuild test robot <lkp@intel.com> wrote:
> Hi Hoan,
>
> [auto build test ERROR on hwmon/hwmon-next]
> [also build test ERROR on v4.7]
> [cannot apply to next-20160801]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Hoan-Tran/hwmon-xgene-Add-support-for-X-Gene-hwmon-driver/20160725-015356
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> config: arm64-allmodconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 5.4.0-6) 5.4.0 20160609
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm64
>
> All errors (new ones prefixed by >>):
>
>>> drivers/hwmon/xgene-hwmon.c:38:22: fatal error: acpi/pcc.h: No such file or directory
>    compilation terminated.

This driver should be built with kernel 4.8 and above where the
"pcc.h" file is available.

Thanks
Hoan

>
> vim +38 drivers/hwmon/xgene-hwmon.c
>
>     32  #include <linux/mailbox_controller.h>
>     33  #include <linux/mailbox_client.h>
>     34  #include <linux/module.h>
>     35  #include <linux/of.h>
>     36  #include <linux/platform_device.h>
>     37  #include <acpi/acpi_io.h>
>   > 38  #include <acpi/pcc.h>
>     39
>     40  /* SLIMpro message defines */
>     41  #define MSG_TYPE_DBG                    0
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
