From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: WARNING: bad unlock balance detected! (3)
Date: Mon, 25 Mar 2019 12:54:49 +0100
Message-ID: <e3d9d95fd07502cccf8ef97ba7b2e2adb4eefbb3.camel@baylibre.com>
References: <0000000000003749360584c395ba@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0000000000003749360584c395ba@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: syzbot <syzbot+f3e3434787332dfc1c47@syzkaller.appspotmail.com>, davem@davemloft.net, devicetree@vger.kernel.org, khilman@baylibre.com, kuznet@ms2.inr.ac.ru, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, robh+dt@kernel.org, syzkaller-bugs@googlegroups.com, yoshfuji@linux-ipv6.org
List-Id: devicetree@vger.kernel.org

On Sat, 2019-03-23 at 07:14 -0700, syzbot wrote:
> syzbot has bisected this bug to:
> 
> commit ec01fb69ac8034ad6e839b31f9df167a110f868b
> Author: Jerome Brunet <jbrunet@baylibre.com>
> Date:   Wed Jan 16 17:59:47 2019 +0000
> 
>      arm64: dts: meson: s400: fix emmc maximum rate
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10afb7cf200000
> start commit:   065b6c4c Merge tag 'devicetree-for-5.1' of git://git.kerne..
> git tree:       upstream
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=12afb7cf200000
> console output: https://syzkaller.appspot.com/x/log.txt?x=14afb7cf200000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ea4067c9a08ae046
> dashboard link: https://syzkaller.appspot.com/bug?extid=f3e3434787332dfc1c47
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12a10577200000
> 
> Reported-by: syzbot+f3e3434787332dfc1c47@syzkaller.appspotmail.com
> Fixes: ec01fb69ac80 ("arm64: dts: meson: s400: fix emmc maximum rate")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Hi David,

I'm not sure I understand what the problem reported is but I don't think a DT
patch could be the cause of a locking issue on x86.

If I missed something, feel free to let me know.

Cheers
Jerome
