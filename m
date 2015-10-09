From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] ARM: shmobile: henninger: add MSIOF0 DT support
Date: Fri, 9 Oct 2015 23:40:52 +0300
Message-ID: <56182654.6070205@cogentembedded.com>
References: <201405070048.00213.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <201405070048.00213.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/07/2014 12:47 AM, Sergei Shtylyov wrote:

> Define the Henninger board dependent part of the MSIOF0 device node.
> Add device node for Renesas R2A11302FT PMIC for which no bindings exist yet.

    I've just realized that there's no such PMIC on the Henninger/Porter 
boards and MSIOF0 is only connected to CN6, hence this patch was wrong.
The .dts is going to be deleted anyway though...

> Based on the Koelsch MSIOF device tree patch by Geert Uytterhoeven.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei

