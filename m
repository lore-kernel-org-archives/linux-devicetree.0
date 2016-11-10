From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 3/3] clocksource: Add clockevent support to NPS400
 driver
Date: Thu, 10 Nov 2016 11:34:16 +0100
Message-ID: <1850b6f7-3901-1065-5f35-d738f76fb218@linaro.org>
References: <1477224748-25223-1-git-send-email-noamca@mellanox.com>
 <1477224748-25223-4-git-send-email-noamca@mellanox.com>
 <20161031105251.GD1506@mai>
 <DB6PR0501MB2518720A0F95ACBBBCB1CB27AAAE0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
 <20161101200141.GF1506@mai>
 <DB6PR0501MB25184EFB9A5CFD3AA41CFDC1AAA60@DB6PR0501MB2518.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB6PR0501MB25184EFB9A5CFD3AA41CFDC1AAA60@DB6PR0501MB2518.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Noam Camus <noamca@mellanox.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>
List-Id: devicetree@vger.kernel.org

On 08/11/2016 09:30, Noam Camus wrote:
>> From: Daniel Lezcano [mailto:daniel.lezcano@linaro.org] 
>> Sent: Tuesday, November 1, 2016 10:02 PM
> ...
>> Assuming cpu0 and cpu1 are sibling, does
> 
>> taskset 0x1 time sleep 2 & taskset 0x2 time sleep 3
> 
> I will use 16,17 instead of 0,1
>> give a correct result without a dmesg log ?
> [root@192.168.8.2 /]$ [root@192.168.8.2 /]$ taskset 65536 time sleep 2 & taskset 131072 time sleep 3

Thanks for providing the numbers.

So there is no weird messages in dmesg ?

> real    0m 2.54s
> user    0m 0.04s
> sys     0m 0.14s
> real    0m 3.47s
> user    0m 0.00s
> sys     0m 0.15s
> [1]+  Done                       taskset 65536 time sleep 2
> 
> Seem OK to me.

I'm not sure of that.

2.54 instead of 2
3.47 instead of 3

0.02 time drift could be acceptable but 0.54 or 0.47 is too much.

And 0.15 in sys also a big number AFAICT.

Is the system in NO_HZ ?



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
