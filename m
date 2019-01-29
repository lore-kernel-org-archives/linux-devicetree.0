From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: Re: Add Ingenic X1000 RTC support.
Date: Tue, 29 Jan 2019 11:53:54 +0800
Message-ID: <5C4FCE52.2040001@zoho.com>
References: <1548696599-53639-1-git-send-email-zhouyanjie@zoho.com>
 <20190128201014.GB18309@piout.net> <1548708484.7511.3@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548708484.7511.3@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, a.zummo@towertech.it, robh+dt@kernel.org, paul.burton@mips.com, mark.rutland@arm.com, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com
List-Id: devicetree@vger.kernel.org

OK, thanks for your suggestions. I'll drop this patch.

On 2019=E5=B9=B401=E6=9C=8829=E6=97=A5 04:48, Paul Cercueil wrote:
> Hi,
>
>> Hello,
>>
>> This seems like a useless renaming to me, can you elaborate a bit more?
>>
>> I'd also like to have Paul and Lars-Peter comment.
>
> According to the patchset, the RTC in the X1000 does not behave any=20
> different
> than the one in the JZ4780 SoC. Therefore patches 1/2 should be dropped.
> In your devicetree bindings, just use the "ingenic,jz4780-rtc" compatible
> string instead. The same goes for all the drivers (e.g. the uart one).
>
> I don't really mind the renaming, maybe replace "Ingenic JZ47xx SoCs"=20
> with
> just "Ingenic SoCs" since XBurst is just the name of the CPU inside these
> SoCs.
>
> Regards,
> -Paul
>
