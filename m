From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: meson: Fix IRQ trigger type for macirq
Date: Fri, 7 Dec 2018 23:06:11 +0100
Message-ID: <CAFBinCBCO5ZOQPRQd4WvW9FPajqdhuTZGO0L07pMX8+6VO4aEA@mail.gmail.com>
References: <20181207105231.25593-1-ccaione@baylibre.com>
 <20181207105231.25593-3-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181207105231.25593-3-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ccaione@baylibre.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com, robh+dt@kernel.org, ingrassia@epigenesys.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Carlo,

On Fri, Dec 7, 2018 at 11:52 AM Carlo Caione <ccaione@baylibre.com> wrote:
>
> A long running stress test on a custom board shipping an AXG SoCs and a
> Realtek RTL8211F PHY revealed that after a few hours the connection
> speed would drop drastically, from ~1000Mbps to ~3Mbps. At the same time
> the 'macirq' (eth0) IRQ would stop being triggered at all and as
> consequence the GMAC IRQs never ACKed.
>
> After a painful investigation the problem seemed to be due to a wrong
> defined IRQ type for the GMAC IRQ that should be LEVEL_HIGH instead of
> EDGE_RISING.
>
> The change in the macirq IRQ type also solved another long standing
> issue affecting this SoC/PHY where EEE was causing the network
> connection to die after stressing it with iperf3 (even though much
> sooner). It's now possible to remove the 'eee-broken-1000t' quirk as
> well.
I tested this on my Odroid-C1. however, I must admit that I never had
issues *without* eee-broken-1000t on any of my boards

without your changes:
[root@alarm ~]# iperf3 -c 192.168.1.100
Connecting to host 192.168.1.100, port 5201
[  5] local 192.168.1.194 port 38870 connected to 192.168.1.100 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  80.6 MBytes   675 Mbits/sec    0   2.78 MBytes
[  5]   1.00-2.00   sec   108 MBytes   904 Mbits/sec    0   3.04 MBytes
[  5]   2.00-3.00   sec   106 MBytes   891 Mbits/sec    0   3.04 MBytes
[  5]   3.00-4.00   sec   105 MBytes   880 Mbits/sec    0   3.04 MBytes
[  5]   4.00-5.00   sec  65.0 MBytes   545 Mbits/sec    0   3.04 MBytes
[  5]   5.00-6.00   sec  92.5 MBytes   777 Mbits/sec    0   3.04 MBytes
[  5]   6.00-7.00   sec  72.5 MBytes   608 Mbits/sec    0   3.04 MBytes
[  5]   7.00-8.19   sec  76.2 MBytes   537 Mbits/sec    0   3.04 MBytes
[  5]   8.19-9.00   sec  48.8 MBytes   504 Mbits/sec    0   3.04 MBytes
[  5]   9.00-10.00  sec  87.5 MBytes   736 Mbits/sec    0   3.04 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec   842 MBytes   706 Mbits/sec    0             sender
[  5]   0.00-10.05  sec   839 MBytes   701 Mbits/sec                  receiver

iperf Done.
[root@alarm ~]# iperf3 -c 192.168.1.100 -R
Connecting to host 192.168.1.100, port 5201
Reverse mode, remote host 192.168.1.100 is sending
[  5] local 192.168.1.194 port 38874 connected to 192.168.1.100 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  21.0 MBytes   175 Mbits/sec
[  5]   1.00-2.00   sec  20.7 MBytes   174 Mbits/sec
[  5]   2.00-3.00   sec  22.4 MBytes   187 Mbits/sec
[  5]   3.00-4.69   sec  25.2 MBytes   125 Mbits/sec
[  5]   4.69-5.00   sec  7.56 MBytes   206 Mbits/sec
[  5]   5.00-6.00   sec  23.4 MBytes   196 Mbits/sec
[  5]   6.00-7.00   sec  14.6 MBytes   123 Mbits/sec
[  5]   7.00-8.00   sec  23.3 MBytes   196 Mbits/sec
[  5]   8.00-9.00   sec  27.8 MBytes   233 Mbits/sec
[  5]   9.00-10.03  sec  24.9 MBytes   203 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-9.36   sec   212 MBytes   190 Mbits/sec  1588             sender
[  5]   0.00-10.03  sec   211 MBytes   176 Mbits/sec                  receiver

iperf Done.
[root@alarm ~]#

with your changes:
[root@alarm ~]# iperf3 -c 192.168.1.100
Connecting to host 192.168.1.100, port 5201
[  5] local 192.168.1.197 port 45020 connected to 192.168.1.100 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  74.4 MBytes   624 Mbits/sec    0   2.75 MBytes
[  5]   1.00-2.00   sec   105 MBytes   881 Mbits/sec    0   3.03 MBytes
[  5]   2.00-3.00   sec   106 MBytes   891 Mbits/sec    0   3.03 MBytes
[  5]   3.00-4.00   sec  78.8 MBytes   661 Mbits/sec    0   3.03 MBytes
[  5]   4.00-5.00   sec  73.8 MBytes   617 Mbits/sec    0   3.03 MBytes
[  5]   5.00-6.00   sec  87.5 MBytes   735 Mbits/sec    0   3.03 MBytes
[  5]   6.00-7.15   sec  81.2 MBytes   594 Mbits/sec    0   3.03 MBytes
[  5]   7.15-8.00   sec  61.2 MBytes   603 Mbits/sec    0   3.03 MBytes
[  5]   8.00-9.02   sec  76.2 MBytes   625 Mbits/sec    0   3.03 MBytes
[  5]   9.02-10.00  sec   102 MBytes   880 Mbits/sec    0   3.03 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec   847 MBytes   710 Mbits/sec    0             sender
[  5]   0.00-10.05  sec   846 MBytes   706 Mbits/sec                  receiver

iperf Done.
[root@alarm ~]# iperf3 -c 192.168.1.100 -R
Connecting to host 192.168.1.100, port 5201
Reverse mode, remote host 192.168.1.100 is sending
[  5] local 192.168.1.197 port 45024 connected to 192.168.1.100 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  22.6 MBytes   190 Mbits/sec
[  5]   1.00-2.00   sec  19.3 MBytes   162 Mbits/sec
[  5]   2.00-3.00   sec  22.1 MBytes   185 Mbits/sec
[  5]   3.00-4.00   sec  29.6 MBytes   248 Mbits/sec
[  5]   4.00-5.00   sec  30.1 MBytes   253 Mbits/sec
[  5]   5.00-6.00   sec  16.7 MBytes   140 Mbits/sec
[  5]   6.00-7.00   sec  21.5 MBytes   180 Mbits/sec
[  5]   7.00-8.00   sec  14.0 MBytes   118 Mbits/sec
[  5]   8.00-9.04   sec  20.4 MBytes   165 Mbits/sec
[  5]   9.04-10.00  sec  19.6 MBytes   171 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.04  sec   217 MBytes   181 Mbits/sec  1795             sender
[  5]   0.00-10.00  sec   216 MBytes   181 Mbits/sec                  receiver

iperf Done.
[root@alarm ~]#

RX and TX speeds are within 10Mbit/s before and after the test, so I
would call the result "identical" (within a bit of measurement
tolerance)
I'll wait a few days and see what Emiliano finds out on his board,
then I'll send my Tested-by and Acked-by


Regards
Martin
