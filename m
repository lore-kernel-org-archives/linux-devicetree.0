From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v1 14/18] MIPS: Loongson64: Add generic dts
Date: Wed, 4 Sep 2019 14:08:28 +0800
Message-ID: <afdce123-385c-96b9-de78-e3a4dee23b29@flygoat.com>
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
 <20190830043232.20191-9-jiaxun.yang@flygoat.com>
 <tencent_1942EDDF41E4786E357A4E9D@qq.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <tencent_1942EDDF41E4786E357A4E9D@qq.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?6ZmI5Y2O5omN?= <chenhc@lemote.com>, linux-mips <linux-mips@vger.kernel.org>
Cc: "paul.burton" <paul.burton@mips.com>, tglx <tglx@linutronix.de>, jason <jason@lakedaemon.net>, maz <maz@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, robh+dt <robh+dt@kernel.org>, "mark.rutland" <mark.rutland@arm.co>, devicetree <devicetree@vger.kernel.org>, Huacai Chen <chenhuacai@gmail.com>
List-Id: devicetree@vger.kernel.org


在 2019/9/4 11:44, 陈华才 写道:
> Hi, Jiaxun,
>
> 1, There are too many dts files (all cputype/boardtype/n-ways combinations), in my opinon we don't need to distinguish 1way/2way/4way. In this way we can largely reduce dts files.
>
> 2, Please don't use "ls" to stand-for loongson, at least in file names.

Thanks, I'm going to drop cpu node in v2.

Renaming files seems meaningless, but I'm going to do that too.

-- 

Jiaxun Yang
