From: Alan Cooper <alcooperx@gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: mtu3: add devicetree bindings
Date: Thu, 12 May 2016 19:02:36 -0400
Message-ID: <CAOGqxeUYEGKq5yhHbgcjPZtY06ZfDp2iCLZDqS3uyfCW523B4w@mail.gmail.com>
References: <1462868614-20602-1-git-send-email-chunfeng.yun@mediatek.com>
	<1462868614-20602-4-git-send-email-chunfeng.yun@mediatek.com>
	<20160511145409.GA23042@rob-hp-laptop>
	<1463037844.11651.118.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1463037844.11651.118.camel@mhfsdcap03>
Sender: linux-gpio-owner@vger.kernel.org
To: chunfeng yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, Sascha Hauer <s.hauer@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Biao Huang <biao.huang@mediatek.com>, USB list <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, May 12, 2016 at 3:24 AM, chunfeng yun <chunfeng.yun@mediatek.com> wrote:
>> > + - mediatek,enable-manual-drd : supports manual dual-role switch by sysfs
>> > +   interface; only used when receptacle is TYPE-A and also wants to support
>> > +   dual-role mode.
>>
>> sysfs is a Linux detail that doesn't apply to the binding. Does the
>> property mean "the IP block supports or doesn't support switching"  or
>> "I want to enable switching feature". Only the former belongs in DT.
>>
> It is the former case, and has little relation with sysfs interface.
> I will modify it later, sorry for my unclear description.

Could the property name be just "enable-manual-drd" instead of
"mediatek,enable-manual-drd"? I expect to have to add this
functionality to our USB driver in the near future.
