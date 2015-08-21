From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] ARM: shmobile: silk: add SDHI1 DT support
Date: Fri, 21 Aug 2015 23:57:09 +0300
Message-ID: <55D790A5.1050008@cogentembedded.com>
References: <10037494.4LD4T2QGPX@wasted.cogentembedded.com>
 <2757472.iuyUyRzJ3z@wasted.cogentembedded.com>
 <20150812012652.GH15957@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20150812012652.GH15957@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/12/2015 04:26 AM, Simon Horman wrote:

>> Define the SILK board dependent part of the SDHI1 (connected to micro-SD slot)
>> device nodes along with the necessary voltage regulators.
>>
>> Based on the original patch by Vladimir Barinov
>> <vladimir.barinov@cogentembedded.com>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> This patch is against 'renesas-devel-20150810-v4.2-rc6' tag of Simon Horman's
>> 'renesas.git' repo plus the R8A7794/SILK QSPI patches just re-posted. It needs
>> the R8A7794 GPIO patches in order to compile.
>>
>> Changes in version 2:
>> - removed not working SDHI0 stuff, renamed the patch;
>> - replaced SDHI1's "wp-gpios" property with "disable-wp".
>
> I am wondering if you could explain the motivation for the "disable-wp"
> update

    Please see the comment in mmc_sd_get_ro().

> and weather it is appropriate for other r8a779* dts files.

    In case of micro-SD slots, yes.

> Thanks.

MBR, Sergei

