From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3] sh_eth: add device tree support
Date: Thu, 06 Feb 2014 15:52:07 +0400
Message-ID: <52F37767.20607@cogentembedded.com>
References: <201402060258.57025.sergei.shtylyov@cogentembedded.com> <CAMuHMdUrAJOTvUPZXVVK3ZSWL1BhE=uiZq0Yxp8XQuRaAxYnKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUrAJOTvUPZXVVK3ZSWL1BhE=uiZq0Yxp8XQuRaAxYnKw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 06-02-2014 12:16, Geert Uytterhoeven wrote:

>> +- reg: offset and length of (1) the E-DMAC/feLic register block (required),
>> +       (2) the TSU register block (optional).

> As there can be 2 regions, have you considered reg-names?

    I've been asked already, and so considered them and found them unneeded.

> Gr{oetje,eeting}s,
>                          Geert

WBR, Sergei

