Return-Path: <SRS0=Xw5e=IB=infradead.org=rdunlap@kernel.org>
Subject: Re: [PATCH/RFC v3 1/4] base: devcon: add a new API to find the graph
References: <1526289360-3997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526289360-3997-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9ed0661a-46ad-65aa-d801-b686a066c225@infradead.org>
Date: Mon, 14 May 2018 08:09:13 -0700
MIME-Version: 1.0
In-Reply-To: <1526289360-3997-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 05/14/2018 02:15 AM, Yoshihiro Shimoda wrote:
> This patch adds a new API "device_connection_find_by_graph()" to
> find device connection by using graph.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/driver-api/device_connection.rst |  4 +--
>  drivers/base/devcon.c                          | 43 ++++++++++++++++++++++++++
>  include/linux/device.h                         |  2 ++
>  3 files changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/device_connection.rst b/Documentation/driver-api/device_connection.rst
> index affbc556..2e2d26f 100644
> --- a/Documentation/driver-api/device_connection.rst
> +++ b/Documentation/driver-api/device_connection.rst
> @@ -19,7 +19,7 @@ Device connections alone do not create a dependency between the two devices.
>  They are only descriptions which are not tied to either of the devices directly.
>  A dependency between the two devices exists only if one of the two endpoint
>  devices requests a reference to the other. The descriptions themselves can be
> -defined in firmware (not yet supported) or they can be built-in.
> +defined in firmware or they can be built-in.
>  
>  Usage
>  -----
> @@ -40,4 +40,4 @@ API
>  ---
>  
>  .. kernel-doc:: drivers/base/devcon.c
> -   : functions: device_connection_find_match device_connection_find device_connection_add device_connection_remove
> +   : functions: device_connection_find_match device_connection_find device_connection_add device_connection_remove device_connection_find_by_graph

BTW, that line above should be like:
      :functions: ...
i.e., no space after the first ':'.

I have sent a patch for that and Jon Corbet has applied it to his docs tree.

-- 
~Randy
