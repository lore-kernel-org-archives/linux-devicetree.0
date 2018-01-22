From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC PATCH v2 0/1] of: easier debugging for node life cycle
 issues
Date: Mon, 22 Jan 2018 00:43:02 -0800
Message-ID: <ac4f02e1-6d49-158a-4fb6-56ac0d474a44@gmail.com>
References: <20180121143117.19805-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180121143117.19805-1-wsa+renesas@sang-engineering.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org
Cc: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/21/18 06:31, Wolfram Sang wrote:
> I got a bug report for a DT node refcounting problem in the I2C subsystem. This
> patch was a huge help in validating the bug report and the proposed solution.
> So, I thought I bring it to attention again. Thanks Tyrel, for the initial
> work!
> 
> Note that I did not test the dynamic updates, only of_node_{get|put} so far. I
> read that Tyrel checked dynamic updates extensively with this patch. And since
> DT overlays are also used within our Renesas dev team, this will help there, as
> well.
> 
> Tested on a Renesas Salvator-XS board (R-Car H3).
> 
> Changes since RFC v1:
> 	* rebased to v4.15-rc8
> 	* fixed commit abbrev and one of the sysfs paths in commit desc
> 	* removed trailing space and fixed pointer declaration in code
> 
> I consider all the remaining checkpatch issues irrelevant for this patch.
> 
> So what about applying it?
> 
> Kind regards,
> 
>    Wolfram
> 
> 
> Tyrel Datwyler (1):
>   of: introduce event tracepoints for dynamic device_node lifecyle
> 
>  drivers/of/dynamic.c      | 32 ++++++----------
>  include/trace/events/of.h | 93 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 105 insertions(+), 20 deletions(-)
>  create mode 100644 include/trace/events/of.h
> 

Please go back and read the thread for version 1.  Simply resubmitting a
forward port is ignoring that whole conversation.

There is a lot of good info in that thread.  I certainly learned stuff in it.

Thanks,

Frank
