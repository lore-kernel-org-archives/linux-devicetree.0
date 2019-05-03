Return-Path: <SRS0=1IWS=TD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38521 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfECUQo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 May 2019 16:16:44 -0400
Date: Fri, 3 May 2019 13:16:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 0/2] Support for TMP75B temperature sensor
Message-ID: <20190503201641.GA11065@roeck-us.net>
References: <20190503161501.29489-1-iker.perez@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503161501.29489-1-iker.perez@codethink.co.uk>
Sender: devicetree-owner@vger.kernel.org
To: Iker Perez <iker.perez@codethink.co.uk>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, May 03, 2019 at 05:14:59PM +0100, Iker Perez wrote:
> From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> 
> This patch series adds support for the TMP75 temperature sensor to the 
> lm75.c driver. Although the TMP75B has a configurable conversion rate,
> this series just sets it to the default rate of 37Hz. Sample rate is set 
> close to this.           
>                                                                                  
> In the future, I want to develop a function that allows the user choose        
> the preferred conversion rate from user-land. 
> 
> 
> Iker Perez del Palomar Sustatxa (2):
>   hwmon: (lm75) Add support for TMP75B
>   dt-bindings: hwmon: Add tmp75b to lm75.txt
> 
Series applied to hwmon-next.

Thanks,
Guenter
