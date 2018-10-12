Return-Path: <SRS0=URgm=MY=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77970: add thermal support
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <575ebd1f-165a-756f-f76a-14a11bba7f19@cogentembedded.com>
 <CAMuHMdW4JNYiDqwo9ZQbsrxCpXaoJzs8a1L3eNnfhVqgozRNaw@mail.gmail.com>
 <20181012112107.vtkjojhefzrkwovl@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <263dd8f7-8d7a-75e6-c1f3-43ddcdd98ead@cogentembedded.com>
Date: Fri, 12 Oct 2018 17:36:55 +0300
MIME-Version: 1.0
In-Reply-To: <20181012112107.vtkjojhefzrkwovl@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 10/12/2018 02:21 PM, Simon Horman wrote:

>>> Describe THS/CIVM in the R8A77970 device tree.
>>>
>>> Based on the original (and large) patches by Vladimir Barinov.
>>>
>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> ---
>>> This patch is against the 'renesas-devel-20181004-v4.19-rc6' tag of Simon
>>> Horman's 'renesas.git' repo.
>>>
>>> Changed in version 2:
>>> - fix the "reg" prop in the thermal device node;
>>> - fixed wrong plural in the patch description.
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks, applied for v4.21.

   Not seeing any updates -- forgot to push?

MBR, Sergei
