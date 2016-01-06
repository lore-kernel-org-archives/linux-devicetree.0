From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 07/10] [media] tvp5150: Add device tree binding document
Date: Wed, 6 Jan 2016 07:46:35 -0300
Message-ID: <568CF08B.6080107@osg.samsung.com>
References: <1451910332-23385-1-git-send-email-javier@osg.samsung.com>
 <1451910332-23385-8-git-send-email-javier@osg.samsung.com>
 <2787681.imkQ5NT8Qm@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2787681.imkQ5NT8Qm@avalon>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Enrico Butera <ebutera@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Rob Herring <robh+dt@kernel.org>, Eduard Gavin <egavinc@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Laurent,

On 01/06/2016 07:39 AM, Laurent Pinchart wrote:
> Hi Javier,
> 
> Thank you for the patch.
>

Thanks a lot for your feedback.

[snip]

>> +
>> +Optional Properties:
>> +- powerdown-gpios: phandle for the GPIO connected to the PDN pin, if any.
> 
> The signal is called PDN in the datasheet, so it might make sense to call this 
> pdn-gpios. I have no strong opinion on this, I'll let you decide what you 
> think is best.
>

Yes, I wondered if the convention was to use a descriptive name or the one
used in the datasheet but Documentation/devicetree/bindings/gpio/gpio.txt
says nothing about it.

I'll change it to pdn-gpios since it could be easier to match with the doc.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
