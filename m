Return-Path: <SRS0=PEGO=GY=redhat.com=hdegoede@kernel.org>
Subject: Re: [PATCH v2 0/5] usb: typec: remove max_snk_mv/ma/mw
References: <1521817127-23061-1-git-send-email-jun.li@nxp.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <e7ca276c-df03-738f-7a66-5e589e20b040@redhat.com>
Date: Tue, 3 Apr 2018 17:27:51 +0200
MIME-Version: 1.0
In-Reply-To: <1521817127-23061-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Li Jun <jun.li@nxp.com>, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com
Cc: linux@roeck-us.net, rmfrfs@gmail.com, yueyao.zhu@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Hi,

On 23-03-18 15:58, Li Jun wrote:
> This patch set is to remove max_snk_mv/ma/mw configs, as we should
> define the sink capability by sink PDOs, the first patch update
> the source PDO match policy by compare the voltage range between
> source and sink PDOs no matter what type they are, the following
> patchs remove those 3 variables from 2 existing users by adding
> a variable PDO, then finial patch remove the max_snk_* from tcpm.
> 
> Changes for v2:
> - rebase the 1st patch to be based on commit 6f566af34628
>    ("Revert "typec: tcpm: Only request matching pdos"").
> - Convert the device properties passing max_snk_* to be a
>    variable sink pdo for fusb302.

Thank you for the new version.

I've replied with some comments to patches 1 and 2, the other
3 patches look good to me.

Regards,

Hans



>   
> Li Jun (5):
>    usb: typec: tcpm: pdo matching optimization
>    usb: typec: fusb302:  remove max_snk_* for sink config
>    dt-bindings: usb: fusb302: remove max-sink-* properties
>    usb: typec: wcove: remove max_snk_* for sink config
>    usb: typec: tcpm: remove max_snk_mv/ma/mw
> 
>   .../devicetree/bindings/usb/fcs,fusb302.txt        |   6 -
>   drivers/usb/typec/fusb302/fusb302.c                |  51 +++++---
>   drivers/usb/typec/tcpm.c                           | 139 +++++++++++++--------
>   drivers/usb/typec/typec_wcove.c                    |   4 +-
>   include/linux/usb/tcpm.h                           |   9 --
>   5 files changed, 128 insertions(+), 81 deletions(-)
> 
