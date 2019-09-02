From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH 02/13] MIPS: Loongson64: Sepreate loongson2ef/loongson64
 code
Date: Mon, 2 Sep 2019 20:51:42 +0300
Message-ID: <20190902175142.GB4339@darkstar.musicnaut.iki.fi>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-3-jiaxun.yang@flygoat.com>
 <20190827220506.GK30291@darkstar.musicnaut.iki.fi>
 <c03045cd-25df-a3b9-3b3b-cf09b7fdd3fa@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c03045cd-25df-a3b9-3b3b-cf09b7fdd3fa@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 28, 2019 at 08:37:34AM +0800, Jiaxun Yang wrote:
> On 2019/8/28 上午6:05, Aaro Koskinen wrote:
> Hi Aaro,
> >You need to update lemote2f_defconfig with his patch.
> 
> How to generate this config? We should not edit it manually right?

It's possible to edit changed symbols by hand. Minimal defconfigs are
generated with "make savedefconfig".

A.
