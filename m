From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v4 3/5] mmc: davinci_mmc: add DT support
Date: Tue, 5 Mar 2013 17:16:25 +0530
Message-ID: <5135DB11.7080602@ti.com>
References: <1360909322-1858-1-git-send-email-prakash.pm@ti.com> <1360909322-1858-4-git-send-email-prakash.pm@ti.com> <512DF16F.50702@ti.com> <A73F36158E33644199EB82C5EC81C7BC3EA484E9@DBDE01.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <A73F36158E33644199EB82C5EC81C7BC3EA484E9@DBDE01.ent.ti.com>
Sender: linux-mmc-owner@vger.kernel.org
To: "Manjunathappa, Prakash" <prakash.pm@ti.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "hs@denx.de" <hs@denx.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "cjb@laptop.org" <cjb@laptop.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, "Porter, Matt" <mporter@ti.com>
List-Id: devicetree@vger.kernel.org

On 3/5/2013 4:54 PM, Manjunathappa, Prakash wrote:

>>> +	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
>>> +	if (!pdata) {
>>> +		dev_err(&pdev->dev, "Failed to allocate memory for struct davinci_mmc_config\n");
>>> +		goto nodata;
>>
>> devm_kzalloc() returns NULL on error so you will end up returning
>> success in this case.
>>
> 
> Returns NULL on failure, caller is checking on NULL for failures.
> 
>         pdata = mmc_parse_pdata(pdev);
>         if (pdata == NULL) {
>                 dev_err(&pdev->dev, "Can not get platform data\n");
>                 return -ENOENT;
>         }

Ha, okay. I was somehow confused into thinking this is part of probe
routine.

Thanks,
Sekhar
