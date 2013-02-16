From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 2/6] mfd: Add ChromeOS EC implementation
Date: Fri, 15 Feb 2013 19:58:30 -0800
Message-ID: <CAPnjgZ2Kn12EMD1+hr5xRhcjbh77qiYj--5-LcqCzwp3t7wdHw@mail.gmail.com>
References: <1360723347-28701-1-git-send-email-sjg@chromium.org>
	<1360723347-28701-3-git-send-email-sjg@chromium.org>
	<1360726546.2220.6.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1360726546.2220.6.camel@joe-AO722>
Sender: linux-doc-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Che-Liang Chiou <clchiou@chromium.org>, Jonathan Kliegman <kliegs@chromium.org>, Luigi Semenzato <semenzato@chromium.org>, Olof Johansson <olofj@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Joe,

On Tue, Feb 12, 2013 at 7:35 PM, Joe Perches <joe@perches.com> wrote:
> On Tue, 2013-02-12 at 18:42 -0800, Simon Glass wrote:
>> This is the base EC implementation, which provides a high level
>> interface to the EC for use by the rest of the kernel. The actual
>> communcations is dealt with by a separate protocol driver which
>> registers itself with this interface.
>
> trivial logging message comments...

Thanks - I will tidy these up in the next spin.

>
>> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> []
>> +struct cros_ec_device *cros_ec_alloc(const char *name)
>> +{
>> +     struct cros_ec_device *ec_dev;
>> +
>> +     ec_dev = kzalloc(sizeof(*ec_dev), GFP_KERNEL);
>> +     if (ec_dev == NULL) {
>> +             dev_err(ec_dev->dev, "cannot allocate\n");
>
> allocation OOM messages aren't useful as there's
> a standard one on all allocs without __GFP_WARN
>
>> +int cros_ec_register(struct cros_ec_device *ec_dev)
>> +{
> []
>> +             ec_dev->din = kmalloc(ec_dev->din_size, GFP_KERNEL);
>> +             if (!ec_dev->din) {
>> +                     err = -ENOMEM;
>> +                     dev_err(dev, "cannot allocate din\n");
>
> etc...
>
>> +     if (err) {
>> +             dev_err(dev, "failed to add mfd devices");
>
> missing terminating newline
>
>

Regards,
Simon
