From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v4 1/6] ARM: shmobile: r8a7740 dtsi: Add L2
 cache-controller node
Date: Thu, 26 Nov 2015 11:59:59 +0000
Message-ID: <5656F43F.9050501@arm.com>
References: <1438765090-823-1-git-send-email-geert+renesas@glider.be>
 <1438765090-823-2-git-send-email-geert+renesas@glider.be>
 <55C1D894.8070302@arm.com>
 <CAMuHMdXdEV+41mH338bDbazzqOErDLQkBUAj2+uVX4Wupn1ABQ@mail.gmail.com>
 <55C1EC3C.9000407@arm.com>
 <CAMuHMdVAOba0ofmoy8OH2DdY1m3XaD8iOXvXBE035=C4yK58VQ@mail.gmail.com>
 <55C47E32.6070400@arm.com>
 <CAMuHMdWv4iDxmyPCG26sTMZAnHd3AO7h8nTcxbPryW-d3zzjFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdWv4iDxmyPCG26sTMZAnHd3AO7h8nTcxbPryW-d3zzjFw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Sudeep Holla <sudeep.holla@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 20/11/15 16:14, Geert Uytterhoeven wrote:
> Hi Sudeep,
>

[...]

> AFAIK, there's nothing to be overridden. The cache seems to be configured in
> the exact same way with and without cache-size, cache-sets, cache-block-size,
> and cache-line-size.
>
> With:
>
>      L2C OF: override cache size: 262144 bytes (256KB)
>      L2C OF: override line size: 32 bytes
>      L2C OF: override way size: 32768 bytes (32KB)
>      L2C OF: override associativity: 8
>      L2C: DT/platform modifies aux control register: 0x02040000 -> 0x02440000
>      L2C: DT/platform tries to modify or specify cache size
>      L2C-310 erratum 769419 enabled
>      L2C-310 enabling early BRESP for Cortex-A9
>      L2C-310 full line of zeros enabled for Cortex-A9
>      L2C-310 dynamic clock gating enabled, standby mode enabled
>      L2C-310 cache controller enabled, 8 ways, 256 kB
>      L2C-310: CACHE_ID 0x410000c7, AUX_CTRL 0x46440001
>
> Without:
>
>      L2C: DT/platform modifies aux control register: 0x02040000 -> 0x02440000
>      L2C-310 erratum 769419 enabled
>      L2C-310 enabling early BRESP for Cortex-A9
>      L2C-310 full line of zeros enabled for Cortex-A9
>      L2C-310 dynamic clock gating enabled, standby mode enabled
>      L2C-310 cache controller enabled, 8 ways, 256 kB
>      L2C-310: CACHE_ID 0x410000c7, AUX_CTRL 0x46440001
>
> Hence I'll drop cache-size, cache-sets, cache-block-size, and cache-line-size,
> for both unified L2 and L1 I/D caches.
>

Sorry for the delay, was on vacation. Looks fine for me.

-- 
Regards,
Sudeep
