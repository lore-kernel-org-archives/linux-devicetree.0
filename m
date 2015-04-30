From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 08/10] ARM: shmobile: armadillo800eva dts: Use generic
 names for device nodes
Date: Thu, 30 Apr 2015 09:12:55 +0900
Message-ID: <20150430001254.GB17758@verge.net.au>
References: <1430139334-15272-1-git-send-email-geert+renesas@glider.be>
 <1430139334-15272-9-git-send-email-geert+renesas@glider.be>
 <553E3404.6020601@cogentembedded.com>
 <CAMuHMdVBCS66UCjZwRSdcWjgukoVK-JMq2ZFHX0WKkh=Jh+yBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVBCS66UCjZwRSdcWjgukoVK-JMq2ZFHX0WKkh=Jh+yBQ@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 28, 2015 at 10:52:37AM +0200, Geert Uytterhoeven wrote:
> On Mon, Apr 27, 2015 at 3:05 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> >> -       wm8978: wm8978@1a {
> >> +       wm8978: codec@1a {
> >
> >     Perhaps sound-codec?
> 
> Given there's no single instance of "sound-codec" under
> Documentation/devicetree/, and only four occurrences in DTS files (whoops,
> I should fix up 3 of them ;-):

:)

I'm happy to help with that if you are dunning short of cycles.

>     arch/arm/boot/dts/r8a7778-bockw.dts: ak4643: sound-codec@12 {
>     arch/arm/boot/dts/r8a7790-lager.dts: ak4643: sound-codec@12 {
>     arch/arm/boot/dts/r8a7791-koelsch.dts: ak4643: sound-codec@12 {
>     arch/xtensa/boot/dts/xtfpga.dtsi: tlv320aic23: sound-codec@0 {
> 
> I'm strongly leaning towards "codec".

On the strength of that I have queued this up.
