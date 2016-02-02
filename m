From: santosh shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/3] Add initial support for TI's K2G SOC
Date: Tue, 2 Feb 2016 15:59:36 -0800
Message-ID: <56B142E8.4090301@oracle.com>
References: <1454455517-7360-1-git-send-email-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454455517-7360-1-git-send-email-fcooper-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, nm-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2/2/2016 3:25 PM, Franklin S Cooper Jr wrote:
> This patchset provides initial support for K2G the latest addition to Texas
> Instruments Keystone 2 product family. These patches are built on top of
> the latest 4.5-rc2 commit.
>
> K2G is a A15 + C66x DSP processor built to address the needs of industrial
> communication and control, automotive and performance audio applications.
>
> Supported peripherals include MMC,USB2.0,DCAN,DSS,McASP and PCIe SS.
>
> The technical reference manual for K2G can be found here:
> http://www.ti.com/lit/ug/spruhy8/spruhy8.pdf
>
> This patchset provides the ability to boot K2G's general purpose evm using
> a ramfs filesystem.
>
> Additional patches will follow this series that will add support for new
> drivers that will enable additional peripherals and features
>
> K2G Bootlog on 4.5-rc2:
> http://pastebin.ubuntu.com/14861580/
>
Quick scan of the series looks fine to me. I will wait for others to
come back for a week or so and then add to 4.6 queue.

Thanks for the series !!

Reagrds,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
