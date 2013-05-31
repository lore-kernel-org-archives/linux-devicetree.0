From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 1/2] rtc: omap: add option to indicate wakeup support
 through DT
Date: Fri, 31 May 2013 12:14:44 +0530
Message-ID: <CA+V-a8vAM_4qC20Fpipu3tROs65dERoFgV-ypyJh336rir-0EQ@mail.gmail.com>
References: <1369982005-8572-1-git-send-email-gururaja.hebbar@ti.com> <1369982005-8572-2-git-send-email-gururaja.hebbar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1369982005-8572-2-git-send-email-gururaja.hebbar@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Hebbar Gururaja <gururaja.hebbar@ti.com>
Cc: akpm@linux-foundation.org, a.zummo@towertech.it, davinci-linux-open-source@linux.davincidsp.com, linux@arm.linux.org.uk, rtc-linux@googlegroups.com, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, zonque@gmail.com, rob@landley.net, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Gururaja,

Thanks for the patch.

On Fri, May 31, 2013 at 12:03 PM, Hebbar Gururaja
<gururaja.hebbar@ti.com> wrote:
> Even though RTC-IP is wakeup capable, Not all Boards support it.
>
> For example
> The rtc alarm wakeup is available in rtc-ip since omap1 days but alarm
> was not wired properly in previous ompa1 boards.
>
[snip]
>
> +Optional properties:
> +- ti,wakeup_capable: Inform the rtc driver that this module is wake-up
For devicetree properties '-' is preferred over '_'.

Regards,
--Prabhakar Lad
