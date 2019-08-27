From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v5 2/2] EDAC: add EDAC driver for DMC520
Date: Tue, 27 Aug 2019 09:53:36 +0200
Message-ID: <20190827075336.GB29752@zn.tnic>
References: <BN6PR04MB1107CE3C2D666A806E62851B86C10@BN6PR04MB1107.namprd04.prod.outlook.com>
 <20190807144016.GA24328@zn.tnic>
 <BY5PR04MB659914AC91EBB3EAF72977BD86D20@BY5PR04MB6599.namprd04.prod.outlook.com>
 <20190819093147.GE4841@zn.tnic>
 <BY5PR04MB65996BD47D541327F8F1BE4A86A00@BY5PR04MB6599.namprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BY5PR04MB65996BD47D541327F8F1BE4A86A00@BY5PR04MB6599.namprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lei Wang <leiwang_git@outlook.com>
Cc: "james.morse@arm.com" <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>, "hangl@microsoft.com" <hangl@microsoft.com>, "lewan@microsoft.com" <lewan@microsoft.com>, "ruizhao@microsoft.com" <ruizhao@microsoft.com>, "scott.branden@broadcom.com" <scott.branden@broadcom.com>, "yuqing.shen@broadcom.com" <yuqing.shen@broadcom.com>, "ray.jui@broadcom.com" <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2019 at 01:49:29AM +0000, Lei Wang wrote:
> Yes, this is to help open source developers who potentially might want 
> to expand this driver, most likely colleagues, and possibly other 
> developers.

Then please put that info in the comment at the beginning of the driver
- not some random single sentences about what can be done, interspersed
throughout the code. It needs to be visible at a first glance.

Also, if you want this to be a longer doc, I wouldn't mind at all having
it in Documentation/edac/ (which doesn't exist yet) and then point
people to it from the comment at the beginning of the driver.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
