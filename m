From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v5 0/8] Add MT8173 Video Encoder Driver and VPU Driver
Date: Fri, 26 Feb 2016 14:09:44 +0100
Message-ID: <56D04E98.8040209@xs4all.nl>
References: <1456215081-16858-1-git-send-email-tiffany.lin@mediatek.com>
 <56CC1CAB.1060409@xs4all.nl> <56D03DE2.1090400@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <56D03DE2.1090400@mm-sol.com>
Sender: linux-media-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, daniel.thompson@linaro.org, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Pawel Osciak <posciak@chromium.org>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, PoChun.Lin@mediatek.com
List-Id: devicetree@vger.kernel.org

On 02/26/2016 12:58 PM, Stanimir Varbanov wrote:
> Hi Hans,
> 
> <snip>
> 
>> Nice!
>>
>> Can you try 'v4l2-compliance -s'? Note that this may not work since I know
>> that v4l2-compliance doesn't work all that well with codecs, but I am
>> curious what the output is when you try streaming.
> 
> Sorry for the off topic question.
> 
> Does every new v4l2 encoder/decoder driver must use v4l2 mem2mem device
> framework, with other words is that mandatory?
> 

No, that's not mandatory. In most cases it will simplify your code, but
sometimes it only makes it harder and then you are better off doing it
yourself.

Regards,

	Hans
