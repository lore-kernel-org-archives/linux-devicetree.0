From: liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: Re: [RFC v7 0/5] pstore/block: new support logger for block devices
Date: Wed, 13 Feb 2019 08:40:00 +0800
Message-ID: <18924d77-f027-33f9-a775-ef140f5ba360@allwinnertech.com>
References: <1548245116-6360-1-git-send-email-liaoweixiong@allwinnertech.com>
 <CAGXu5jLE8dr4+G6fFmwcbm8YAs=RB+OiupyPCX6COhVu6av__w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5jLE8dr4+G6fFmwcbm8YAs=RB+OiupyPCX6COhVu6av__w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Arnd Bergmann <arnd@arndb.de>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-02-13 04:54, Kees Cook wrote:
> On Wed, Jan 23, 2019 at 4:06 AM liaoweixiong
> <liaoweixiong@allwinnertech.com> wrote:
>>
>> Why should we need pstore_block?
>> 1. Most embedded intelligent equipment have no persistent ram, which
>> increases costs. We perfer to cheaper solutions, like block devices.
>> In fast, there is already a sample for block device logger in driver
>> MTD (drivers/mtd/mtdoops.c).
>> 2. Do not any equipment have battery, which means that it lost all data
>> on general ram if power failure. Pstore has little to do for these
>> equipments.
>>
>> [PATCH v7]
>> On patch 1:
>> 1. Fix line over 80 characters.
>> On patch 2:
>> 1. Insert a separate patch for DT bindings.
> 
> This is looking good. Can you address the DT bindings review concerns,
> and send a v8?
> 

Sure. I had little time to send patches as i caught up with the Spring
Festival some days ago, the most grand festival of China. I'll do it
before this weekend, which is already in my plan.

> Thanks!
> 

-- 
liaoweixiong
