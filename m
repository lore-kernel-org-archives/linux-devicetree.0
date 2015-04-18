From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 02/14] MIPS: ath79: Add basic device tree support
Date: Sat, 18 Apr 2015 09:05:52 +0200
Message-ID: <1429340752.16771.120.camel@x220>
References: <1429280669-2986-1-git-send-email-albeu@free.fr>
	 <1429280669-2986-3-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429280669-2986-3-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2015-04-17 at 16:24 +0200, Alban Bedel wrote:

> --- a/arch/mips/ath79/Kconfig
> +++ b/arch/mips/ath79/Kconfig
>  
> +choice
> +	prompt "Builtin devicetree selection"
> +	default DTB_ATH79_NONE
> +	help
> +	  Select the devicetree.
> +
> +	config DTB_ATH79_NONE
> +		bool "None"
> +endchoice

This adds a choice block with one config entry. So what this achieves is
that DTB_ATH79_NONE will always be 'y', right? Besides I didn't notice
on a user of CONFIG_DTB_ATH79_NONE. So as far as I can see this choice
has no effect on the build.

Why was this choice entry added?


Paul Bolle
