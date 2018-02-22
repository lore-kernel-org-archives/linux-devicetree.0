From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [RFC PATCH] drivers/peci: peci_match_id() can be static
Date: Thu, 22 Feb 2018 09:25:02 -0800
Message-ID: <f5f9afd0-a5ce-346f-772a-e8dec78bd872@linux.intel.com>
References: <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
 <20180222070111.GA22310@lkp-ne02>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180222070111.GA22310@lkp-ne02>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: fengguang.wu@intel.com
Cc: linux-hwmon@vger.kernel.org, andrew@lunn.ch, jdelvare@suse.com, arnd@arndb.de, linux-doc@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, joel@jms.id.au, benh@kernel.crashing.org, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2/21/2018 11:01 PM, kbuild test robot wrote:
> 
> Fixes: 99f5d2b99ecd ("drivers/peci: Add support for PECI bus driver core")
> Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
> ---
>   peci-core.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/peci/peci-core.c b/drivers/peci/peci-core.c
> index d976c73..4709b8c 100644
> --- a/drivers/peci/peci-core.c
> +++ b/drivers/peci/peci-core.c
> @@ -770,8 +770,8 @@ peci_of_match_device(const struct of_device_id *matches,
>   }
>   #endif
>   
> -const struct peci_device_id *peci_match_id(const struct peci_device_id *id,
> -					   struct peci_client *client)
> +static const struct peci_device_id *peci_match_id(const struct peci_device_id *id,
> +						  struct peci_client *client)
>   {
>   	if (!(id && client))
>   		return NULL;
> 

Hi Fengguang,

Thanks a lot for the fix. I'll merge your patch in v3 submission.

BR,
Jae
