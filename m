From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [Letux-kernel] [PATCH RFC] bluetooth: add uart h4 devices via
 serdev/devicetree
Date: Fri, 4 Jan 2019 10:07:34 +0100
Message-ID: <B5CEA49A-0F54-40C5-BCEA-7875BE1358E3@holtmann.org>
References: <20181110232034.17277-1-andreas@kemnade.info>
 <20181111024648.7rt7rlhaqihtqecv@earth.universe>
 <20181112215812.18ebca35@aktux>
 <2C74C837-A6D3-47C9-BE59-CCA594289B94@goldelico.com>
 <20181112222726.73m2oca7hankvcjs@earth.universe>
 <CABGGisxsdv+BTd5-HMzF8asEcWtL5F4CMzmkrBCwK=NibvqjLQ@mail.gmail.com>
 <20181113170128.0f59ef0e@kemnade.info>
 <86A3A2E6-FC89-42FE-8410-9C8273EC9CF7@holtmann.org>
 <20181116204601.4e1aa0de@kemnade.info>
 <09AFE47C-D188-4397-A2CD-C70FFAC3B677@holtmann.org>
 <20190104064403.325771fd@kemnade.info>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190104064403.325771fd@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Rob Herring <robh@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, "H . Nikolaus Schaller" <hns@goldelico.com>, devicetree <devicetree@vger.kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-bluetooth@vger.kernel.org, letux-kernel@openphoenux.org
List-Id: devicetree@vger.kernel.org

Hi Andreas,

>>>> Btw. I see nothing standing in the way of merging btuart.c driver and then go from there. Either I dig this out and submit or someone else does.
>>>> 
>>> Do you mean this?
>>> https://patchwork.kernel.org/patch/10490651/  
>> 
>> yes, that one.
>> 
> Hmm, there seemed to be nothing in the pull requests regarding btuart.
> Did you change plans?

because I only submitted it as RFC. We can easily merge that one upstream since it is rather trivial. The main problem is how you want to do the device matching. Do you have a DT entry for your really simple devices?

Regards

Marcel
