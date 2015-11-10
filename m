From: "Kim, Milo" <milo.kim@ti.com>
Subject: Re: [PATCH RESEND 04/16] Documentation: dt-bindings: leds: add LM3633
 LED binding information
Date: Tue, 10 Nov 2015 16:01:56 +0900
Message-ID: <56419664.1080204@ti.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-5-git-send-email-milo.kim@ti.com>
 <5638DD8A.5020105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
In-Reply-To: <5638DD8A.5020105@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jacek,

On 11/4/2015 1:15 AM, Jacek Anaszewski wrote:
>> +  - led-max-microamp: Max current setting. Type is <u32>.
>> >+                      Unit is microampere. Range is from 5000 to 30000.
> Could you specify also a step?
>

Yep, step is 1000. Thanks for catching this.
I'll update the binding in the next patch.

Best regards,
Milo
