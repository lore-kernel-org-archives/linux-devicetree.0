From: syzbot <syzbot+83f2d54ec6b7e417e13f@syzkaller.appspotmail.com>
Subject: Re: WARNING in batadv_mcast_mla_tt_retract
Date: Sun, 24 Mar 2019 00:35:01 -0700
Message-ID: <0000000000002c5a7f0584d220fa@google.com>
References: <000000000000fa4f60057e499989@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <000000000000fa4f60057e499989@google.com>
Sender: netdev-owner@vger.kernel.org
To: a@unstable.cc, alexander.h.duyck@intel.com, amritha.nambiar@intel.com, avagin@gmail.com, b.a.t.m.a.n@lists.open-mesh.org, davem@davemloft.net, devicetree@vger.kernel.org, dmitry.torokhov@gmail.com, heiko@sntech.de, jeffrey.t.kirsher@intel.com, joe@perches.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, mareklindner@neomailbox.ch, mark.rutland@arm.com, netdev@vger.kernel.org, robh+dt@kernel.org, sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com, tyhicks@canonical.com
List-Id: devicetree@vger.kernel.org

syzbot has bisected this bug to:

commit 2ed30cfcf866f657349bf9f54a017a957cd98378
Author: Heiko Stuebner <heiko@sntech.de>
Date:   Thu Aug 2 11:36:41 2018 +0000

     arm64: dts: rockchip: enable dwc2-based otg controller on px30-evb

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=177e9917200000
start commit:   4b3c31c8 Merge branch 'i2c/for-current' of git://git.kerne..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=14fe9917200000
console output: https://syzkaller.appspot.com/x/log.txt?x=10fe9917200000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b05cfdb4ee8ab9b2
dashboard link: https://syzkaller.appspot.com/bug?extid=83f2d54ec6b7e417e13f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=139c6408c00000

Reported-by: syzbot+83f2d54ec6b7e417e13f@syzkaller.appspotmail.com
Fixes: 2ed30cfcf866 ("arm64: dts: rockchip: enable dwc2-based otg  
controller on px30-evb")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
