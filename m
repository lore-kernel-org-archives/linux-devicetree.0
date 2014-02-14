From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH net-next v5 10/10] MAINTAINERS: add entry for the Broadcom
 GENET driver
Date: Sat, 15 Feb 2014 00:37:09 +0300
Message-ID: <52FE8C85.5070008@cogentembedded.com>
References: <1392336531-28875-1-git-send-email-f.fainelli@gmail.com> <1392336531-28875-11-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1392336531-28875-11-git-send-email-f.fainelli@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, devicetree@vger.kernel.org, cernekee@gmail.com, mark.rutland@arm.com, romieu@fr.zoreil.com
List-Id: devicetree@vger.kernel.org

Hello.

On 02/14/2014 03:08 AM, Florian Fainelli wrote:

> Add myself as a maintainer of the Broadcom GENET driver.

> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
[...]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 091b50e..5a7b3ec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1845,6 +1845,12 @@ L:	netdev@vger.kernel.org
>   S:	Supported
>   F:	drivers/net/ethernet/broadcom/b44.*
>
> +BROADCOM GENET ETHERNET DRIVER
> +M:	Florian Fainelli <f.fainelli@gmail.com>
> +L:	netdev@vger.kernel.org
> +S:	Supported
> +F:	drivers/net/ethernet/broadcom/genet/
> +

    Aren't these entries supposed to be sorted alphabetically? If so, in my 
alphabet BNX2 comes before GENET...

>   BROADCOM BNX2 GIGABIT ETHERNET DRIVER
>   M:	Michael Chan <mchan@broadcom.com>
>   L:	netdev@vger.kernel.org

PS: I'm probably wrong, the entries don't appear to be sorted on the 2nd word...

WBR, Sergei
