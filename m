From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3 1/3] ARM: dts: da850: add cpu node and operating points
 to DT
Date: Mon, 8 Apr 2019 08:47:50 -0500
Message-ID: <236c4d1d-7275-3223-ee06-0a25982b1fe3@lechnology.com>
References: <20190408075924.2284-1-brgl@bgdev.pl>
 <20190408075924.2284-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408075924.2284-2-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 4/8/19 2:59 AM, Bartosz Golaszewski wrote:
> From: David Lechner <david@lechnology.com>
> 
> This adds a cpu node and operating points to the common da850.dtsi file.
> 
> Additionally, a regulator is added to the LEGO EV3 board along with
> some board-specific CPU configuration.
> 
> Regulators need to be hooked up on other boards to get them working.
> 

I still have the same comments that I made on v1. It would be nice to
also mention the LCDK board in the commit message since it is included
in this patch.

Also, the 415MHz operating point is something I just made up for testing
and I'm not sure that it is actually useful in general. It could be
omitted from this patch.
