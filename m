From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 2/4] gpio: davinci: DT changes for driver
Date: Thu, 20 Jun 2013 10:21:47 +0530
Message-ID: <51C28A63.6080905@ti.com>
References: <1371203020-15092-1-git-send-email-avinashphilip@ti.com>
	<1371205241-17205-3-git-send-email-avinashphilipk@gmail.com>
	<CACRpkdbJJVKC539CAPNxxEbofVfw3Pr0gyCSZyY9YbkXneE-qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <CACRpkdbJJVKC539CAPNxxEbofVfw3Pr0gyCSZyY9YbkXneE-qQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org" <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 6/20/2013 12:40 AM, Linus Walleij wrote:
> On Fri, Jun 14, 2013 at 12:20 PM, Philip Avinash
> <avinashphilipk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> From: KV Sujith <sujithkv-l0cyMroinI0@public.gmane.org>
>>
>> - Add of_device_id for Davinci GPIO driver.
>> - Add function to populate data from DT.
>> - Modify the probe to read from DT if DT match is found.
>> - Add DT binding documentation for Davinci GPIO properties in a new file
>>   gpio-davinci.txt located at Documentation/devicetree/bindings/gpio/.
>>
>> Signed-off-by: KV Sujith <sujithkv-l0cyMroinI0@public.gmane.org>
>> Signed-off-by: Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>
>> ---
>> Changes since v1:
>>         - description for interrupts changed to reflecti
>>            interrupt array usage.
> (...)
> 
>> +static struct davinci_gpio_platform_data *davinci_gpio_set_pdata_of(
>> +                                               struct platform_device *pdev)
>> +{
>> +       struct device_node *dn = pdev->dev.of_node;
>> +       struct davinci_gpio_platform_data *pdata;
>> +       u32 val, ret;
>> +
>> +       pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
>> +       if (pdata) {
> 
> Instead of this arrow pattern:
> 
> if (!pdata) {
>   dev_err( ... "out of memory allocating platform data");
>   return NULL;
> }
> 
> And de-indent the rest.
> 
> With that change:
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> I guess this may go through the DaVinci tree with the rest of the DaVinci
> patches?

Linus, yes, I will pick these up with your acks.

Thanks,
Sekhar
