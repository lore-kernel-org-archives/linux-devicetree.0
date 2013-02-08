From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v2] media: rc: gpio-ir-recv: add support for device tree
 parsing
Date: Fri, 08 Feb 2013 22:52:32 +0100
Message-ID: <511573A0.1030502@gmail.com>
References: <1360137832-13086-1-git-send-email-sebastian.hesselbarth@gmail.com> <1360355887-19973-1-git-send-email-sebastian.hesselbarth@gmail.com> <51156DA3.2080006@gmail.com> <51156FCB.6020401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51156FCB.6020401@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Mauro Carvalho Chehab <mchehab@redhat.com>, Benoit Thebaudeau <benoit.thebaudeau@advansee.com>, David Hardeman <david@hardeman.nu>, Trilok Soni <tsoni@codeaurora.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Matus Ujhelyi <ujhelyi.m@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/08/2013 10:36 PM, Sebastian Hesselbarth wrote:
>> You could also make it:
>>
>> #define gpio_ir_recv_get_devtree_pdata (-ENOSYS)
>
> Hmm, does that also play with parameter passing of the
> CONFIG_OF gpio_ir_recv_get_devtree_pdata() ?

Oops, should have been:

#define gpio_ir_recv_get_devtree_pdata(dev, pd) (-ENOSYS)

>> #define gpio_ir_recv_get_devtree_pdata (-ENOSYS)
>>> +{
>>> + return ERR_PTR(-ENODEV);
>>> +}
>>> +
>>> +#endif
>>> +
>>> static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
>>> {
>>> struct gpio_rc_dev *gpio_dev = dev_id;
>>> @@ -66,6 +111,17 @@ static int gpio_ir_recv_probe(struct
>>> platform_device *pdev)
>>> pdev->dev.platform_data;
>>> int rc;
>>>
>>> + if (pdev->dev.of_node) {
>>> + struct gpio_ir_recv_platform_data *dtpdata =
>>
>> I think you could use pdata here instead, as previously. But I'm fine
>> with
>> as it is now as well.
>
> Yeah, but pdata is const and I will change it within _get_devtree_pdata().
> I could cast the const away when passing it to
> gpio_ir_recv_get_devtree_pdata()
> but it is almost the same amount of code.. and it is cleaner this way.

True, let's leave it intact then.

S.
