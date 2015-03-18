From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] dt-bindings: brcm: rationalize Broadcom documentation
 naming
Date: Wed, 18 Mar 2015 16:03:10 -0600
Message-ID: <5509F61E.5000702@wwwdotorg.org>
References: <1426706645-19313-1-git-send-email-sbranden@broadcom.com> <5509D528.1080208@wwwdotorg.org> <5509F3CC.1010207@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5509F3CC.1010207@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Branden <sbranden@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 03/18/2015 03:53 PM, Scott Branden wrote:
> Hi Stephen,
>
> On 15-03-18 12:42 PM, Stephen Warren wrote:
>> On 03/18/2015 01:24 PM, Scott Branden wrote:
>>> This patchset attempts to standarize the naming of dt-bindings
>>> documents based on the Broadcom vendor prefix of brcm.
>>>
>>> Although there are no guidelines currently present for how to name
>>> the dt-bindings document the "vendor,binding.txt" style is in use by
>>> some of the other vendors.
>>
>> Conceptually I'm fine with this.
>> Acked-by: Stephen Warren <swarren@wwwdotorg.org>
>>
>> The only comment I have is that some bindings refer to other bindings,
>> e.g. an I2C controller binding might refer to the core I2C binding to
>> define core I2C properties. Since this patch moves a couple files
>> between directories, did you double-check that none of the pathnames in
>> those references need fixing up?
>
> Yes, I read all the brcm documents and did not find references to the
> moved files.

Oh, I meant references *from* the moved files to other files.

BTW, I just noticed that both your patches don't have signed-off-by lines.
