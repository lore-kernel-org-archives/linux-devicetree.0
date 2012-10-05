From: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v3 1/4] watchdog: core: dt: add support for the
 timeout-sec dt property
Date: Fri, 5 Oct 2012 14:06:38 +0200
Message-ID: <CAHkwnC8cZ26Z8jXx4LU3wBbGn2FC3-rjn+m861G3_Ue58yqfjw@mail.gmail.com>
References: <1349432169-13006-1-git-send-email-fabio.porcedda@gmail.com>
 <1349432169-13006-2-git-send-email-fabio.porcedda@gmail.com>
 <20121005111642.GA12462@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121005111642.GA12462-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 5, 2012 at 1:16 PM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> On 12:16 Fri 05 Oct     , Fabio Porcedda wrote:
>> Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  Documentation/watchdog/watchdog-kernel-api.txt |  4 ++++
>>  drivers/watchdog/watchdog_core.c               | 27 ++++++++++++++++++++++++++
>>  include/linux/watchdog.h                       |  4 ++++
>>  3 files changed, 35 insertions(+)
>>
>> diff --git a/Documentation/watchdog/watchdog-kernel-api.txt b/Documentation/watchdog/watchdog-kernel-api.txt
>> index 086638f..2208db7 100644
>> --- a/Documentation/watchdog/watchdog-kernel-api.txt
>> +++ b/Documentation/watchdog/watchdog-kernel-api.txt
>> @@ -212,3 +212,7 @@ driver specific data to and a pointer to the data itself.
>>  The watchdog_get_drvdata function allows you to retrieve driver specific data.
>>  The argument of this function is the watchdog device where you want to retrieve
>>  data from. The function returns the pointer to the driver specific data.
>> +
>> +The watchdog_init_timeout function allows you to initialize the timeout field
>> +using the module timeout parameter or retrieving the timeout-sec property from
>> +the device tree.
>> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
>> index 3796434..646be48 100644
>> --- a/drivers/watchdog/watchdog_core.c
>> +++ b/drivers/watchdog/watchdog_core.c
>> @@ -143,6 +143,33 @@ void watchdog_unregister_device(struct watchdog_device *wdd)
>>  }
>>  EXPORT_SYMBOL_GPL(watchdog_unregister_device);
>>
>> +/**
>> + * watchdog_init_timeout() - initialize the timeout field
>> + * @parm_timeout: timeout module parameter, it takes precedence over the
>> + *                timeout-sec property.
>> + * @node: Retrieve the timeout-sec property only if the parm_timeout
>> + *        is out of bounds.
>> + */
>> +void watchdog_init_timeout(struct watchdog_device *wdd,
>> +                        unsigned int parm_timeout, struct device_node *node)
>> +{
>> +     unsigned int t = 0;
>> +
>> +     if ((parm_timeout >= wdd->min_timeout) &&
>> +         (parm_timeout <= wdd->max_timeout)) {
>> +             wdd->timeout = parm_timeout;
>> +             return;
>> +     }
>> +
>> +     if (!node)
>> +             return;
>> +
>> +     of_property_read_u32(node, "timeout-sec", &t);
> why I bother to comment
> *make this of generic* this is not watchdog specific other driver can use it

You mean to add the function in of.h and use that function inside
watchdog_init_timeout or to
use the of_* function instead of the watchdog_init_timeout function?

Do you like the use of watchdog_init_timeout function inside the
at91sam9_wdt driver?

Best regards
-- 
Fabio Porcedda
