From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 1/6] usb: xhci-mtk: resume USB3 roothub first
Date: Tue, 4 Sep 2018 17:44:23 +0300
Message-ID: <93e36b7b-f0d0-4f5e-69b7-4195c25628f4@linux.intel.com>
References: <3bcc220aa54bfebc39cea54cd736388ad37ee0c5.1535510898.git.chunfeng.yun@mediatek.com>
 <f144173b-6131-21cf-1ead-60d938ac289a@cogentembedded.com>
 <1535591392.32173.30.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535591392.32173.30.camel@mhfsdcap03>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 30.08.2018 04:09, Chunfeng Yun wrote:
> Hi,
> On Wed, 2018-08-29 at 12:13 +0300, Sergei Shtylyov wrote:
>> On 8/29/2018 5:55 AM, Chunfeng Yun wrote:
>>
>>> Give USB3 devices a better chance to enumerate at USB3 speeds if
>>> they are connected to a suspended host.
>>> Porting from "671ffdf xhci: resume USB 3 roothub first"
>>
>>      From commit 671ffdff5b13 ("xhci: resume USB 3 roothub first").
> 
> Ok, Thanks
> 

adding to queue (I'll fix that commit ID)

-Mathias
