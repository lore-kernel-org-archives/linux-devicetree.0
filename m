From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH 0/4] ARM: da850: enable cpufreq in DT mode
Date: Thu, 21 Mar 2019 10:29:22 -0500
Message-ID: <e4d51b63-bc07-c595-9d73-c4b09eb11341@lechnology.com>
References: <20190321141010.19612-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321141010.19612-1-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 3/21/19 9:10 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This series adds cpufreq-dt operating points for da850 boards supported
> with device tree (da850-lcdk, da850-lego-ev3, da850-evm) and also
> includes a fix for the da850-evm boardfile which checks an unset variable
> to determine the highest available frequency for cpufreq.


I can't find any old threads about this, but I recall that there was a
problem with the USB OHCI controller breaking when switching frequencies.
It didn't happen all of the time, but often enough that it made using
cpufreq unusable for me. Is this still a problem?

Also, a big-picture question. On boards with fixed regulators, what is
the benefit of enabling frequency scaling? The power savings aspect
seems negligible (< 1% in my tests) since the voltage cannot be changed.
