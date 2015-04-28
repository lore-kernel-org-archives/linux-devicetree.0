From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 08/10] ARM: shmobile: armadillo800eva dts: Use generic
 names for device nodes
Date: Tue, 28 Apr 2015 10:52:37 +0200
Message-ID: <CAMuHMdVBCS66UCjZwRSdcWjgukoVK-JMq2ZFHX0WKkh=Jh+yBQ@mail.gmail.com>
References: <1430139334-15272-1-git-send-email-geert+renesas@glider.be>
	<1430139334-15272-9-git-send-email-geert+renesas@glider.be>
	<553E3404.6020601@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <553E3404.6020601@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 27, 2015 at 3:05 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>> -       wm8978: wm8978@1a {
>> +       wm8978: codec@1a {
>
>     Perhaps sound-codec?

Given there's no single instance of "sound-codec" under
Documentation/devicetree/, and only four occurrences in DTS files (whoops,
I should fix up 3 of them ;-):

    arch/arm/boot/dts/r8a7778-bockw.dts: ak4643: sound-codec@12 {
    arch/arm/boot/dts/r8a7790-lager.dts: ak4643: sound-codec@12 {
    arch/arm/boot/dts/r8a7791-koelsch.dts: ak4643: sound-codec@12 {
    arch/xtensa/boot/dts/xtfpga.dtsi: tlv320aic23: sound-codec@0 {

I'm strongly leaning towards "codec".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
