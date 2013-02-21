From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Subject: Re: [PATCH] of/i2c: don't register disabled devices
Date: Thu, 21 Feb 2013 05:32:51 +0400
Message-ID: <51257943.3070509@mentor.com>
References: <1361384904-13853-1-git-send-email-dmitry_eremin@mentor.com> <51251F51.2010003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51251F51.2010003@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 20/02/13 23:09, Rob Herring wrote:
> On 02/20/2013 12:28 PM, Dmitry Eremin-Solenikov wrote:
>> Don't register i2c slave device tree nodes which have
>> status = "disabled" property.
>>
> 
> This is already in 3.8.

Ah, true. Sorry for the noise then.

-- 
With best wishes
Dmitry
