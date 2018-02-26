From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] ARM: dts: da850-lego-ev3: use a correct fallback for at24
 compatible
Date: Mon, 26 Feb 2018 11:25:54 +0530
Message-ID: <134fc583-785c-0112-94f2-f94b9ff93065@ti.com>
References: <20180122125505.16806-1-brgl@bgdev.pl>
 <c4c07714-4937-48bd-466d-c2c9848c4725@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c4c07714-4937-48bd-466d-c2c9848c4725@lechnology.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Monday 22 January 2018 10:20 PM, David Lechner wrote:
> On 01/22/2018 06:55 AM, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> We now require all at24 users to use the "atmel,<model>" fallback in
>> device tree for different manufacturers.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
> 
> Reviewed-by: David Lechner <david@lechnology.com>

Applied to v4.17/dt

Thanks,
Sekhar
