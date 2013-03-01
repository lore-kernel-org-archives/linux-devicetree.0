From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] <linux/of_platform.h>: fix compilation warnings with
 DT disabled
Date: Fri, 01 Mar 2013 17:55:27 +0400
Message-ID: <5130B34F.2090700@cogentembedded.com>
References: <201302190258.25726.sergei.shtylyov@cogentembedded.com> <20130301070925.GA24369@verge.net.au> <5130B12F.20409@gmail.com> <5130B1A7.9060001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <5130B1A7.9060001@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Simon Horman <horms@verge.net.au>, linux-sh@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, vladimir.barinov@cogentembedded.com
List-Id: devicetree@vger.kernel.org

Hello.

On 01-03-2013 17:48, Rob Herring wrote:

>>>> Fix the following compilation warnings (in Simon Horman's renesas.=
git repo):

>>>> In file included from arch/arm/mach-shmobile/setup-r8a7779.c:24:0:
>>>> include/linux/of_platform.h:107:13: warning: =E2=80=98struct of_de=
vice_id=E2=80=99 declared
>>>> inside parameter list [enabled by default]
>>>> include/linux/of_platform.h:107:13: warning: its scope is only thi=
s definition
>>>> or declaration, which is probably not what you want [enabled by de=
fault]
>>>> include/linux/of_platform.h:107:13: warning: =E2=80=98struct devic=
e_node=E2=80=99 declared
>>>> inside parameter list [enabled by default]

>>>> <linux/of_platform.h> only #include's headers with definitions of =
the above
>>>> mentioned structures if CONFIG_OF_DEVICE=3Dy but uses them even if=
 not. One
>>>> solution is to move some #include's out of #ifdef CONFIG_OF_DEVICE=
 and use
>>>> incomplete declarations for the rest of the structures where the #=
ifdef move
>>>> doesn't help...

>>>> Reported-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com=
>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com=
>

>>> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

>>> Grant, could you consider taking this patch?

>> Yes, I can, but I don't seem to have the original patch. Can you sen=
d it
>> again.

> Nevermind. Found it. I'll apply it.

    Will you drop 'struct device_node' declaration then or should I res=
end? In=20
fact, I think I should better resend it with the changelog somewhat edi=
ted.

> Rob

WBR, Sergei

