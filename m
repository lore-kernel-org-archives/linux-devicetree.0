Return-Path: <SRS0=Udh+=WI=mediatek.com=chunfeng.yun@kernel.org>
Message-ID: <1565614819.23705.51.camel@mhfsdcap03>
Subject: Re: [Patch V6 7/8] usb: gadget: Add UDC driver for tegra XUSB
 device mode controller
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Date: Mon, 12 Aug 2019 21:00:19 +0800
In-Reply-To: <871rxqtupm.fsf@gmail.com>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
	 <1565257046-9890-8-git-send-email-nkristam@nvidia.com>
	 <1565613783.23705.49.camel@mhfsdcap03> <871rxqtupm.fsf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>
Cc: Nagarjuna Kristam <nkristam@nvidia.com>, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 2019-08-12 at 15:49 +0300, Felipe Balbi wrote:
> Hi,
> 
> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> >> +/* XUSB_DEV registers */
> >> +#define SPARAM 0x000
> >> +#define  SPARAM_ERSTMAX_SHIFT 16
> >> +#define  SPARAM_ERSTMAX_MASK GENMASK(4, 0)
> >> +#define DB 0x004
> >> +#define  DB_TARGET_SHIFT 8
> >> +#define  DB_TARGET_MASK GENMASK(7, 0)
> >> +#define  DB_STREAMID_SHIFT 16
> >> +#define  DB_STREAMID_MASK GENMASK(15, 0)
> > To me, define it as :
> > #define  DB_STREAMID_MASK GENMASK(31, 16),
> > it's more clearer.
> > and define another macro
> > #define  DB_STREAMID(x) (((x) & 0xffff) << 16)
> 
> perhaps?
> 
> #define DB_STREAMID(x)	(((x) << 16) & DB_STREAMID_MASK)
It's a better way :)

> 
> Otherwise you end up defining the mask twice.
> 
