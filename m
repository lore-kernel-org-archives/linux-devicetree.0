From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v8 1/3] ARM: dts: da850: Add cfgchip syscon node
Date: Tue, 1 Nov 2016 18:12:04 -0500
Message-ID: <8770cb0a-a113-d9a0-ee71-7463d8042cdd@lechnology.com>
References: <1477946841-16126-1-git-send-email-david@lechnology.com>
 <1477946841-16126-2-git-send-email-david@lechnology.com>
 <b3617c00-1f1d-5ab8-23e9-a96307a53558@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b3617c00-1f1d-5ab8-23e9-a96307a53558@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>
Cc: Axel Haslam <ahaslam@baylibre.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/01/2016 04:53 AM, Sekhar Nori wrote:
> Hi David,
>
> On Tuesday 01 November 2016 02:17 AM, David Lechner wrote:
>> Add a syscon node for the SoC CFGCHIPn registers. It includes a child node
>> for the USB PHY that is part of this range of registers.
>>
>> Also have to add OF_DEV_AUXDATA() entry so that clock lookup will work for
>> the the USB PHY driver.
>>
>> Signed-off-by: David Lechner <david@lechnology.com>
>
> For future, please do not combine device-tree addition and other C code into a
> single patch. I have applied this patch while splitting it into two as
> attached.
>

Sorry. I should know that by now. :-/

Thank you for fixing it for me.
