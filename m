From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3 1/3] ARM: dts: da850: add cpu node and operating points
 to DT
Date: Mon, 8 Apr 2019 08:55:17 -0500
Message-ID: <f5d08299-8cc5-e70e-fc14-e172be544168@lechnology.com>
References: <20190408075924.2284-1-brgl@bgdev.pl>
 <20190408075924.2284-2-brgl@bgdev.pl>
 <236c4d1d-7275-3223-ee06-0a25982b1fe3@lechnology.com>
 <CAMRc=Mf7tT1j5n8kM4TJXy7sHYmyfu8DTOwMKwo-d3VG4qOXgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=Mf7tT1j5n8kM4TJXy7sHYmyfu8DTOwMKwo-d3VG4qOXgQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Adam Ford <aford173@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 4/8/19 8:51 AM, Bartosz Golaszewski wrote:
> pon., 8 kwi 2019 o 15:47 David Lechner <david@lechnology.com> napisał(a):
>>
>> On 4/8/19 2:59 AM, Bartosz Golaszewski wrote:
>>> From: David Lechner <david@lechnology.com>
>>>
>>> This adds a cpu node and operating points to the common da850.dtsi file.
>>>
>>> Additionally, a regulator is added to the LEGO EV3 board along with
>>> some board-specific CPU configuration.
>>>
>>> Regulators need to be hooked up on other boards to get them working.
>>>
>>
>> I still have the same comments that I made on v1. It would be nice to
>> also mention the LCDK board in the commit message since it is included
>> in this patch.
>>
> 
> My bad, I forgot it.
> 
>> Also, the 415MHz operating point is something I just made up for testing
>> and I'm not sure that it is actually useful in general. It could be
>> omitted from this patch.
>>
> 
> The board file has the 408 opp, I guess this is in line with other
> operating points defined by you which have slightly higher frequencies
> than those in the da850.c. Let's see what Sekhar thinks.
> 
> Bart
> 

My bad this time. I guess I put more thought into it that I remembered.
:-)
