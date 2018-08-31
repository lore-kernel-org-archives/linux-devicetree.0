Return-Path: <SRS0=WyUm=LO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr60089.outbound.protection.outlook.com ([40.107.6.89]:39024
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727191AbeHaMgZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 31 Aug 2018 08:36:25 -0400
Subject: Re: [PATCH v2 2/2] Documentation/devicetree/bindings/i2c/i2c.txt: fix
 typo
References: <20180831054006.8158-1-semtax33@gmail.com>
From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <8572aa4f-769c-415e-704b-040e75b71044@ysoft.com>
Date: Fri, 31 Aug 2018 10:29:57 +0200
MIME-Version: 1.0
In-Reply-To: <20180831054006.8158-1-semtax33@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: sim manseop <semtax33@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org
List-ID: <devicetree@vger.kernel.org>

On 31.8.2018 07:40, sim manseop wrote:
> Fix typo 'SMbus' to 'SMBus'
> 
> Signed-off-by: manseop sim <semtax33@gmail.com>
> 
> ---
> Changes in v2:
> - modifing subject

Ahoj, I think Rob expected you to just extend the subject to something like:
"dt-bindings: i2c: Fix SMBus typo"

See paragraph 1) here:
https://www.kernel.org/doc/Documentation/devicetree/bindings/submitting-patches.txt

Best regards,
Michal

> - changed commit message
> ---
>   Documentation/devicetree/bindings/i2c/i2c.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index 11263982470e..44efafdfd7f5 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -84,7 +84,7 @@ Binding may contain optional "interrupts" property, describing interrupts
>   used by the device. I2C core will assign "irq" interrupt (or the very first
>   interrupt if not using interrupt names) as primary interrupt for the slave.
>   
> -Alternatively, devices supporting SMbus Host Notify, and connected to
> +Alternatively, devices supporting SMBus Host Notify, and connected to
>   adapters that support this feature, may use "host-notify" property. I2C
>   core will create a virtual interrupt for Host Notify and assign it as
>   primary interrupt for the slave.
> 
