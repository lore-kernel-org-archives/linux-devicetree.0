From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 01/10] of_net: add NVMEM support to of_get_mac_address
Date: Fri, 3 May 2019 11:44:54 +0300
Message-ID: <2a5fcdec-c661-6dc5-6741-7d6675457b9b@cogentembedded.com>
References: <1556870168-26864-1-git-send-email-ynezz@true.cz>
 <1556870168-26864-2-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1556870168-26864-2-git-send-email-ynezz@true.cz>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz@true.cz>, netdev@vger.kernel.org, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Alban Bedel <albeu@free.fr>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 03.05.2019 10:55, Petr Štetiar wrote:

> Many embedded devices have information such as MAC addresses stored
> inside NVMEMs like EEPROMs and so on. Currently there are only two
> drivers in the tree which benefit from NVMEM bindings.
> 
> Adding support for NVMEM into every other driver would mean adding a lot
> of repetitive code. This patch allows us to configure MAC addresses in
> various devices like ethernet and wireless adapters directly from
> of_get_mac_address, which is already used by almost every driver in the
> tree.
> 
> Predecessor of this patch which used directly MTD layer has originated
> in OpenWrt some time ago and supports already about 497 use cases in 357
> device tree files.
> 
> Cc: Alban Bedel <albeu@free.fr>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Petr Štetiar <ynezz@true.cz>
> ---
> 
>   Changes since v1:
> 
>    * moved handling of nvmem after mac-address and local-mac-address properties
> 
>   Changes since v2:
> 
>    * moved of_get_mac_addr_nvmem after of_get_mac_addr(np, "address") call
>    * replaced kzalloc, kmemdup and kfree with it's devm variants
>    * introduced of_has_nvmem_mac_addr helper which checks if DT node has nvmem
>      cell with `mac-address`
>    * of_get_mac_address now returns ERR_PTR encoded error value
> 
>   drivers/of/of_net.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 62 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
> index d820f3e..258ceb8 100644
> --- a/drivers/of/of_net.c
> +++ b/drivers/of/of_net.c
[...]
> @@ -64,6 +113,9 @@ static const void *of_get_mac_addr(struct device_node *np, const char *name)
>    * addresses.  Some older U-Boots only initialized 'local-mac-address'.  In
>    * this case, the real MAC is in 'local-mac-address', and 'mac-address' exists
>    * but is all zeros.
> + *
> + * Return: Will be a valid pointer on success, NULL in case there wasn't
> + *         'mac-address' nvmem cell node found, and ERR_PTR in case of error.

    Returning both NULL and error codes on failure is usually a sign of a 
misdesigned API. Why not always return an error code?

[...]

MBR, Sergei
