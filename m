From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/2] meson: Fix IRQ trigger type
Date: Fri, 7 Dec 2018 22:56:43 +0100
Message-ID: <CAFBinCD8uwm-MJ7gCSVRrjZ3ksahPE8oRrcw+TieaWes-Kbr=w@mail.gmail.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
 <CAFBinCDCE7RP4vgs25bqSZ8vBjrmcuB=qb3U92X6QfpmzeqrBg@mail.gmail.com>
 <20181206124347.GA10676@ingrassia.epigenesys.com>
 <85973a9cd43c677ffa5c80853e86d79f36a9eb3a.camel@baylibre.com>
 <20181206155228.GA15225@ingrassia.epigenesys.com>
 <20181206185158.GA19901@ingrassia.epigenesys.com>
 <44c9eedf4dc2616645c2a49b080f42a493fe03fd.camel@baylibre.com>
 <20181207182845.GA3779@ingrassia.epigenesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181207182845.GA3779@ingrassia.epigenesys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ingrassia@epigenesys.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ccaione@baylibre.com, khilman@baylibre.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

Hi Emiliano,

On Fri, Dec 7, 2018 at 7:28 PM Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
[...]
> > All your test seems in show it the fact the Amlogic SoC usually prioritize the
> > TX traffic over RX, which is something we've known about for a while.
> >
>
> Is that normal and/or acceptable?
the public S805 datasheet mentions in the "Ethernet MAC" features
section (22.2) on page 120:
"RX FIFO 4KB, TX FIFO 2KB"
this suggests that

I did some tests using some Armbian 3.10 kernel on my Odroid-C1:
root@odroidc1:~# iperf3 -c 192.168.1.100
Connecting to host 192.168.1.100, port 5201
[  4] local 192.168.1.163 port 44297 connected to 192.168.1.100 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec  49.9 MBytes   419 Mbits/sec    0    809 KBytes
[  4]   1.00-2.00   sec  48.7 MBytes   408 Mbits/sec    0    809 KBytes
[  4]   2.00-3.00   sec  48.4 MBytes   407 Mbits/sec    0    809 KBytes
[  4]   3.00-4.00   sec  48.9 MBytes   409 Mbits/sec    0    809 KBytes
[  4]   4.00-5.00   sec  48.2 MBytes   406 Mbits/sec    0    809 KBytes
[  4]   5.00-6.00   sec  48.8 MBytes   409 Mbits/sec    0    809 KBytes
[  4]   6.00-7.00   sec  48.7 MBytes   408 Mbits/sec    0    809 KBytes
[  4]   7.00-8.00   sec  48.0 MBytes   404 Mbits/sec    0    809 KBytes
[  4]   8.00-9.00   sec  48.1 MBytes   403 Mbits/sec    0    809 KBytes
[  4]   9.00-10.00  sec  48.1 MBytes   404 Mbits/sec    0    809 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec   486 MBytes   408 Mbits/sec    0             sender
[  4]   0.00-10.00  sec   485 MBytes   407 Mbits/sec                  receiver

iperf Done.
root@odroidc1:~# iperf3 -c 192.168.1.100 -R
Connecting to host 192.168.1.100, port 5201
Reverse mode, remote host 192.168.1.100 is sending
[  4] local 192.168.1.163 port 44301 connected to 192.168.1.100 port 5201
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-1.00   sec  87.5 MBytes   734 Mbits/sec
[  4]   1.00-2.00   sec  89.2 MBytes   748 Mbits/sec
[  4]   2.00-3.00   sec  89.0 MBytes   747 Mbits/sec
[  4]   3.00-4.00   sec  88.9 MBytes   746 Mbits/sec
[  4]   4.00-5.00   sec  89.2 MBytes   748 Mbits/sec
[  4]   5.00-6.00   sec  89.0 MBytes   747 Mbits/sec
[  4]   6.00-7.00   sec  88.5 MBytes   742 Mbits/sec
[  4]   7.00-8.00   sec  88.5 MBytes   742 Mbits/sec
[  4]   8.00-9.00   sec  88.5 MBytes   742 Mbits/sec
[  4]   9.00-10.00  sec  88.2 MBytes   740 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec   889 MBytes   745 Mbits/sec    0             sender
[  4]   0.00-10.00  sec   887 MBytes   744 Mbits/sec                  receiver

iperf Done.
root@odroidc1:~#

[...]
> Furthermore, as Martin reported in one of the previous mail,
> even Amlogic's buildroot kernel uses an edge rising IRQ type
> for the Meson8b MAC. Other evidence that is not so clear
> the need for the first patch on 32 bit Meson SoC.
please note that the dwc2 USB controllers are also using
IRQ_TYPE_EDGE_RISING in Amlogic's 3.10 kernel.
mainline on the other hand uses IRQ_TYPE_LEVEL_HIGH after your commit
291f45dd6da5fa "ARM: dts: meson: fixing USB support on Meson6, Meson8
and Meson8b"
what I want to say is: in some cases we need to use different settings
than the 3.10 kernel!


Regards
Martin
