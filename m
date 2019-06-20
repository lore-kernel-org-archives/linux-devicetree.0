From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] usb: dwc3: remove unused @lock member of dwc3_ep struct
Date: Thu, 20 Jun 2019 11:51:04 +0300
Message-ID: <87muicbpxj.fsf@linux.intel.com>
References: <342af01a252a9ef9457a6a6ec653a40698058fbc.1561018149.git.chunfeng.yun@mediatek.com> <87pnn8brej.fsf@linux.intel.com> <1561019039.19385.0.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561019039.19385.0.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> Hi,
> On Thu, 2019-06-20 at 11:19 +0300, Felipe Balbi wrote:
>> Hi,
>> 
>> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
>> 
>> > The member @lock of dwc2_ep struct is only initialized,
>> > and not used elsewhere, so remove it.
> Sorry, I need send v2 to fix typo of dwc2_ep

I fixed when applying ;-)

-- 
balbi
