From: syzbot <syzbot+f3e3434787332dfc1c47@syzkaller.appspotmail.com>
Subject: Re: WARNING: bad unlock balance detected! (3)
Date: Sat, 23 Mar 2019 07:14:00 -0700
Message-ID: <0000000000003749360584c395ba@google.com>
References: <000000000000685dc805829e835c@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <000000000000685dc805829e835c@google.com>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, devicetree@vger.kernel.org, jbrunet@baylibre.com, khilman@baylibre.com, kuznet@ms2.inr.ac.ru, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, robh+dt@kernel.org, syzkaller-bugs@googlegroups.com, yoshfuji@linux-ipv6.org
List-Id: devicetree@vger.kernel.org

syzbot has bisected this bug to:

commit ec01fb69ac8034ad6e839b31f9df167a110f868b
Author: Jerome Brunet <jbrunet@baylibre.com>
Date:   Wed Jan 16 17:59:47 2019 +0000

     arm64: dts: meson: s400: fix emmc maximum rate

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10afb7cf200000
start commit:   065b6c4c Merge tag 'devicetree-for-5.1' of git://git.kerne..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=12afb7cf200000
console output: https://syzkaller.appspot.com/x/log.txt?x=14afb7cf200000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea4067c9a08ae046
dashboard link: https://syzkaller.appspot.com/bug?extid=f3e3434787332dfc1c47
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12a10577200000

Reported-by: syzbot+f3e3434787332dfc1c47@syzkaller.appspotmail.com
Fixes: ec01fb69ac80 ("arm64: dts: meson: s400: fix emmc maximum rate")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
