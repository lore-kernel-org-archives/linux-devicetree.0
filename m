From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH 0/3] of: add update device node status via cmdline feature
Date: Thu, 15 Aug 2013 13:46:12 +0100
Message-ID: <CACxGe6tdvdFsAHjEZK8fuHNEgV+JW8K2GfLN0gD3HfSopb4Kfw@mail.gmail.com>
References: <1376564133-11286-1-git-send-email-b29396@freescale.com> <520CCB70.8090908@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <520CCB70.8090908@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Dong Aisheng <b29396@freescale.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Landley <rob@landley.net>, Rob Herring <rob.herring@calxeda.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 15, 2013 at 1:37 PM, Rob Herring <robherring2@gmail.com> wrote:
> On 08/15/2013 05:55 AM, Dong Aisheng wrote:
>> We meet some boards having a lot of pin conflicts between different devices,
>> only one of them can be enabled to run at one time.
>>
>> e.g. imx6q sabreauto board, i2c, spi, weim, flexcan, uart and etc involved
>> with pin conflict.
>>
>> Instead of changing dts manually or adding a lot dts files according to
>> different device availability, we provide feature to dynamically update the
>> device node status via command line, then those devices involved with
>> pin conflict can be enabled or disabled dynamically.
>>
>> It's conveniently to use and can save a lot dts board files, also can
>> permenantly fix the pin conflicts issue.
>
> This doesn't scale either with updating of lots devices or when the next
> person comes along and wants to edit another property.
>
> This is something u-boot is perfectly capable of handling and updating
> status is something lots of boards already do.

+1

g.
