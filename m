From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: RFC: build config via DT names
Date: Mon, 12 Feb 2018 15:13:21 -0800
Message-ID: <d55f95cc-228b-e65f-b46c-2f314f4fa582@gmail.com>
References: <63f25fea-f163-f9cc-b5b2-f6f291d7f8d2@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <63f25fea-f163-f9cc-b5b2-f6f291d7f8d2@gmx.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <metux@gmx.de>
Cc: linux-kernel@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

+ devicetree mail list

On 02/10/18 07:52, Enrico Weigelt, metux IT consult wrote:
> Hi folks,
> 
> I've regularily have the task of configuring a kernel for a given DT.
> To make this a little bit easier, I'd like to do this automatically.
> 
> The tuff task here is getting a mapping between dt compatible strings
> and corresponding CONFIG_* flags. Automatically extracting it from the
> source code seems pretty tricky, especially w/ corner cases (eg. some
> drivers support groups of devices, depending on config options) - IMHO
> it will need some code changes anyways.
> 
> Therefore I propose a simple approach using the existing Kconfig system:
> 
> Add an extra (toplevel) menu and config flag naming scheme which
> directly map DT compatible strings to config flags. For example:
> 
>> fsl,mpc5200-gpio <=> CONFIG_DTDEV_FSL_MPC5200_GPIO
> 
>> config CONFIG_DTDEV_FSL_MPC5200_GPIO
>>    tristate "fsl,mpc5200-gpio"
>>    select GPIO_MPC5200
> 
> Note that these flags are separate from the actual drivers - they just
> enable them automatically. Of course they'll have to be maintained by
> the driver maintainers.
> 
> 
> What do you think about this idea ?
> 
> 
> --mtx
> 
