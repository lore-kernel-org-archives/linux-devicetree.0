From: Andres Salomon <dilinger@queued.net>
Subject: [PATCH 0/4] RFC: OLPC/x86 device tree code
Date: Mon, 28 Jun 2010 21:54:07 -0400
Message-ID: <20100628215407.2017bf2f@debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: sparclinux@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, cjb@laptop.org, Mitch Bradley <wmb@laptop.org>, pgf@laptop.org, linux-kernel@vger.kernel.org, davem@davemloft.net, grant.likely@secretlab.ca
List-Id: devicetree@vger.kernel.org

Hi,

I'm looking for input on the following patches; they're based upon the
OFW patch that's currently in the x86-tip tree[0], and they've only been
compile tested (on x86 and sparc64).  This stuff takes the sparc
device tree creation code and makes it available for multiple
architectures, which OLPC then makes use of to build the tree.
There's still a bunch of little stuff that I need to fix (and of
course, I need to verify that it actually remains compatible w/ the
old promfs code that OLPC's been using[1]).

[0]
http://git.kernel.org/?p=linux/kernel/git/mingo/linux-2.6-x86.git;a=commit;h=fd699c76552bb

[1]
http://dev.laptop.org/git/olpc-2.6/commit/?id=0b9734dc5f0b3d24e8f3dfedaeacb61675c838ff
