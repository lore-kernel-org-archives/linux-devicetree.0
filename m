From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: Re: [PATCH 3/4] dt-bindings: rtc: sd3078: add device tree
 documentation
Date: Mon, 12 Nov 2018 18:40:40 +0100
Message-ID: <20181112174040.GG29768@piout.net>
References: <1542001514-8167-1-git-send-email-long17.cool@163.com>
 <1542001514-8167-3-git-send-email-long17.cool@163.com>
 <20181112154919.GB26341@piout.net>
 <201811130055486298716@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201811130055486298716@163.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "long17.cool@163.com" <long17.cool@163.com>
Cc: "a.zummo" <a.zummo@towertech.it>, "mark.rutland" <mark.rutland@arm.com>, linux-rtc <linux-rtc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 13/11/2018 00:55:49+0800, long17.cool@163.com wrote:
> hello：
> The patch of 4/4 is not used for this modules,  this is my problem.
> 
> I have a question : 
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16130,6 +16130,7 @@ M: Zoro Li <long17.cool@163.com>
> >  L: linux-rtc@vger.kernel.org
> >  S: Maintained
> >  F: drivers/rtc/rtc-sd3078.c
> > +F: Documentation/devicetree/bindings/rtc/rtc-sd3078.txt
> > 
> 
> There is no need to list this file here if it is only done to silence checkpatch.
> What does it mean?
> 
> I found that if I didn't add that statement, when I checkpatch,
>  I would get the following warning.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #16: 
> new file mode 100644
> Can I ignore this warning?
> 

Yes, you can.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
