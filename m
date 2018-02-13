From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v10 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Tue, 13 Feb 2018 12:18:05 -0800
Message-ID: <b33b48ba-35ef-d98e-fa52-f70ed0953dcc@gmail.com>
References: <20180213200959.160157-1-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180213200959.160157-1-brendanhiggins@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brendan Higgins <brendanhiggins@google.com>, robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com, tmaimon77@gmail.com, avifishman70@gmail.com, julien.thierry@arm.com, pombredanne@nexb.com, arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 02/13/2018 12:09 PM, Brendan Higgins wrote:
> Addressed comments from:
>  - Joel: https://www.spinics.net/lists/arm-kernel/msg634074.html
>  - Arnd: https://www.spinics.net/lists/arm-kernel/msg634091.html
> 
> Summary of changes since previous update:
>  - Replaced "nuvoton,npcm7xx-smp" compatibility string with
>    "nuvoton,npcm750-smp".
>  - Fixed some whitespace issues.
>  - Added EVB DTS to Makefile.
> 
> All changes tested on Nuvoton NPCM750 EVB.
> 

Thanks for keeping me CC, FWIW: Reviewed-by: Florian Fainelli
<f.fainelli@gmail.com>

FWIW, I don't have a vested interest in BMCs in general, just happened
to do a drive by review of your SMP code, no need to CC me on future
submissions (e.g: boards, drivers etc.). Cheers
-- 
Florian
