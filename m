From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 0/4] of: Convert to using %pOFn for node name printf
Date: Fri, 31 Aug 2018 16:51:46 -0700
Message-ID: <a9d5bee5-2066-85dd-9b93-272781120894@gmail.com>
References: <20180828155254.10709-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828155254.10709-1-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/28/18 08:52, Rob Herring wrote:
> This is the DT portion of converting node name printf's to use the 
> %pOFn format specifier rather than device_node.name. Patches for other 
> subsystems are independent and have been sent separately.
> 
> Rob
> 
> Rob Herring (4):
>   of/unittest: remove use of node name pointer in overlay high level
>     test
>   of/unittest: add printf tests for node name
>   of: Convert to using %pOFn instead of device_node.name
>   vsprintf: print OF node name using full_name
> 
>  drivers/of/device.c   |  4 ++--
>  drivers/of/of_mdio.c  | 12 ++++++------
>  drivers/of/of_numa.c  |  4 ++--
>  drivers/of/overlay.c  |  4 ++--
>  drivers/of/platform.c |  8 ++++----
>  drivers/of/unittest.c | 26 ++++++++++++++++----------
>  lib/vsprintf.c        |  9 +++++++--
>  7 files changed, 39 insertions(+), 28 deletions(-)
> 


Reviewed-by: Frank Rowand <frank.rowand@sony.com>
