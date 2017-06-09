From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: Re: Re: [PATCH] arm64: allwinner: a64: Add initial
 NanoPi A64 support
Date: Fri, 9 Jun 2017 20:37:44 +0530
Message-ID: <affc8d55-b732-4a52-ff26-1564ebd8df6f@openedev.com>
References: <1497013436-14107-1-git-send-email-jteki@openedev.com>
 <20170609145236.tunnjyiorfggyhk5@flea.home>
Reply-To: jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBDH5TZWAZAFBBS7T5LEQKGQE5MH4PWI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170609145236.tunnjyiorfggyhk5-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 09 June 2017 08:22 PM, Maxime Ripard wrote:
> On Fri, Jun 09, 2017 at 01:03:56PM +0000, Jagan Teki wrote:
>> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>>
>> NanoPi A64 is a new board of high performance with low cost
>> designed by FriendlyElec., using the Allwinner A64 SOC.
>>
>> Nanopi A64 features
>> - Allwinner A64, 64-bit Quad-core Cortex-A53@648MHz to 1.152GHz, DVFS
>> - 1GB DDR3 RAM
>> - MicroSD
>> - Gigabit Ethernet (RTL8211E)
>> - Wi-Fi 802.11b/g/n
>> - IR receiver
>> - Audio In/Out
>> - Video In/Out
>> - Serial Debug Port
>> - microUSB 5V 2A DC power-supply
>>
>> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> 
> Hmmm, I'm confused, didn't you just send that DT already?
Sorry, I forgot to add version number this is v3

Jagan.
