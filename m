From: Fengguang Wu <lkp@intel.com>
Subject: Re: running "make dtbs" for test builds
Date: Mon, 18 Jul 2016 20:41:22 +0800
Message-ID: <20160718124122.GA30497@wfg-t540p.sh.intel.com>
References: <8924490.SntxSU2FOC@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8924490.SntxSU2FOC@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Mon, Jul 18, 2016 at 02:01:17PM +0200, Arnd Bergmann wrote:
>Hi Fengguang,
>
>I've recently run into a number of cases in which I pulled a branch that
>was building fine with "make vmlinux", but that failed for "make dtbs",
>and I wonder if this is something that could be checked by the kbuild
>test robot so we catch it earlier.

We initially run "make" without vmlinux, however during bisect more
specific make targets will be used to speed it up. To do that it's
necessary to know the regex patterns of "make dtbs" error messages,
so that they can be correctly bisected.

Can you give some "make dtbs" error messages or patterns?

Thanks,
Fengguang
