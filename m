Return-Path: <SRS0=UpLl=HG=ti.com=t-kristo@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Subject: [RFC 00/13] ARM: dts: DT overlay support infra + some data
Date: Tue, 17 Apr 2018 12:10:02 +0300
Message-ID: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com
Cc: wmills@ti.com, tony@atomide.com, trini@konsulko.com, rmk@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

Hi,

This series is an attempt to start discussion on the DT overlay build time
support. Basically, one can build DT overlays directly from kernel tree,
and also build FIT images that contain the kernel + devicetree blobs
required for specific configuration that can be booted directly with
u-boot. No runtime support for overlay switching is touched by this
series.

What this series does, is to:

1) add subdir support under arch/arm/boot/dts
2) provide DT overlay build support to kernel tree
3) provide FIT image build support to kernel tree
4) provide a number of DT overlay + FIT image files for some TI SoCs
   to show the reasons why we are doing this, this is only a subset
   of our boards that we would want to use overlays with

Main reason for TI to use DT overlays right now is the rather large
amount of different displays we have around, which can be used with
different boards. With the current approach one needs to write a
separate .dts file for each board + display config, but with overlays,
one can just create a single overlay that would apply to different boards.
There are some other cases like the shown dra71-evm case in this series,
where the gpmc vs. display support is mutually exclusive, as they are
sharing certain pieces of the HW.

The main controversy with this series is most likely where the DT overlay
files should be stored at. Should they still reside with the kernel
tree or someplace else? Also, the FIT image support is probably
controversial, should it be part of the kernel build system like shown
here, or should it be separate? The zImage dependency is pretty annoying
so maybe it should be done somewhere else.

Any comments welcome as this is just an RFC for now, but basically we
would really want a solution to this problem.

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
