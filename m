From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 05/06] devicetree: bindings: Remove unused 32-bit CMT
 bindings
Date: Tue, 16 Feb 2016 15:27:20 +0300
Message-ID: <56C315A8.3020901@cogentembedded.com>
References: <20160216071722.25461.61862.sendpatchset@little-apple>
 <20160216071809.25461.92875.sendpatchset@little-apple>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160216071809.25461.92875.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be, robh@kernel.org, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

Hello.

On 2/16/2016 10:18 AM, Magnus Damm wrote:

> From: Magnus Damm <damm+renesas@opensource.se>
>
> Remove the 32-bit CMT compat strings to reduce maintenance burden.
>
> It should be fine to break DT compatibility because the 32-bit
> 32-bit CMT DT binding was never part of any upstream DTS file.

    s/32-bit//. Once is enough. :-)

> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

[...]

MBR, Sergei
